# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: joyfulgirl@archlinux.us
# Contributor: nathan owe ndowens04 at gmail dot com

pkgname=cclive
pkgver=0.9.3
pkgrel=11
pkgdesc='Commandline downloader for popular video websites.'
arch=('i686' 'x86_64')
url='http://cclive.sourceforge.net/'
license=('AGPL3')
depends=('boost-libs' 'pcre' 'curl' 'libquvi' 'glibmm')
makedepends=('boost')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz"
        iostream.patch
        boost.m4) # https://github.com/tsuna/boost.m4
md5sums=('c336f97e29327d92ead62765a0ef0b65'
         'd5a2f6aee7832683bcffe2ea6b1561ad'
         'c2ed0f4a18fa2da46706705cc6d37dbd')

prepare() {
  cd $pkgname-$pkgver

  # Update boost.m4 to support GCC > 5.1
  cp $srcdir/boost.m4 m4/
  autoconf

  patch -p1 -i $srcdir/iostream.patch
}

build() {
  cd $pkgname-$pkgver

  # glibmm 2.46 uses C++11 features
  CXXFLAGS+=' -std=c++11'

  ./configure --prefix=/usr boost_cv_rpath_link_ldflag="-L/usr/lib"
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
