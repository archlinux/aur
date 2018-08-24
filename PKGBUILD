# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Yichao Yu <yyc1992@gmail.com>
# Contributor: Weng Xuetian <wengxt@gmail.com>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: Callea Gaetano Andrea <callea:gaetano:andrea/gmail:com>

pkgname=recorditnow
pkgver=0.8.1
pkgrel=10
pkgdesc="A plugin based desktop recorder for KDE SC 4"
arch=('x86_64')
url="http://kde-apps.org/content/show.php/RecordItNow?content=114610"
license=('GPL')
depends=('kdebase-runtime' 'ffmpeg' 'xdg-utils')
makedepends=('cmake' 'automoc4' 'recordmydesktop' 'mencoder')
optdepends=('mencoder: for mencoder encoder plugin'
            'recordmydesktop')
provides=('joschy')
source=("http://downloads.sourceforge.net/project/recorditnow/${pkgname}-${pkgver}.tar.bz2"
        "cmake.patch"
        "ffmpeg.patch")
md5sums=('6619b4048545adbab1d13a790189e80f'
         '74ea0ababc2291e2a62e5d045c62616a'
         '867f30a0cba692c7dad56195fd64b092')

prepare() {
  cd "${srcdir}/$pkgname-$pkgver"
  patch -p0 -i "${srcdir}/cmake.patch"
  patch -p0 -i "${srcdir}/ffmpeg.patch"
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DLINGUAS="de hu cs pt_BR fr it" ..
  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver/build"
  make DESTDIR="${pkgdir}" install

  if [[ "$CARCH" == "x86_64" ]]; then
    cd "$pkgdir/usr"
    mv lib64/* lib
    rmdir lib64
  fi
}
