# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=echoping
pkgver=6.0.2
pkgrel=11
pkgdesc="tests performance of a remote host by sending HTTP, TCP and UDP requests"
arch=('x86_64')
url="http://echoping.sourceforge.net/"
license=('GPL')
depends=(libidn popt libldap)
#source=(https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
source=("https://pkgs.fedoraproject.org/repo/pkgs/echoping/echoping-$pkgver.tar.gz/991478532b56ab3b6f46ea9fa332626f/echoping-$pkgver.tar.gz"
        link-echoping-to-libm.patch)
md5sums=('991478532b56ab3b6f46ea9fa332626f'
         '3df2d0073af658579323d5f638de0289')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../link-echoping-to-libm.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./configure --prefix=/usr --config-cache --with-ssl
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
