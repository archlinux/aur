# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=jed-snapshot
_pkgname=${pkgname/-snapshot/}
pkgver=0.99.20.137
_pkgver=0.99.20-137
pkgrel=1
pkgdesc="A freely available text editor for Unix and others OS - Latest development version"
arch=('i686' 'x86_64')
url="http://www.jedsoft.org/snapshots/"
license=('GPL')
provides=('jed')
conflicts=('jed')
depends=('gpm' 'slang' 'libxft')
makedepends=('libxext' 'libxt')
options=('!makeflags')
source=("http://www.jedsoft.org/snapshots/jed-pre${_pkgver}.tar.gz")
sha256sums=('80c2fc54e22472b9ff4b22b830279d6651e56ad399126c883f2ccbe886a0f357')
install="$pkgname.install"

build() {
  cd ${_pkgname}-pre${_pkgver}

  ./configure --prefix=/usr JED_ROOT=/usr/share/jed

  sed \
    -e "s|\(^all.*\)|\1 xjed rgrep|" \
    -e "s|..DEST.*doc|${pkgdir}/usr/share/doc/${pkgname}|g" \
    -i src/Makefile

  make
}

package() {
  cd ${_pkgname}-pre${_pkgver}

  make DESTDIR="${pkgdir}" install

  # Install rgrep
  install -Dm755 src/objs/rgrep "$pkgdir"/usr/bin
}
