# $Id: PKGBUILD 194152 2016-10-31 13:48:24Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=netcount
pkgver=0.8i
pkgrel=7
pkgdesc="network statistic and monitor tools"
arch=('any')
url="http://www.hczim.de/software/"
license=('GPL')
depends=('python2')
makedepends=('ppp')
source=(http://www.hczim.de/software/$pkgname-$pkgver.tar.gz
	build.patch)
md5sums=('537d941b6725f17d46b228967b8f6d23'
         '90dc22e9fce2b1a2fbc6899d23debbde')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 <../build.patch
  echo -e "#!/bin/sh\necho gentoo">distro-detect.sh
  sed -i 's|sbin|bin|g' Makefile *.in
}

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make files
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/man/man1
  mkdir -p "$pkgdir"/etc/logrotate.d

  make \
	INSTALLDIR="$pkgdir"/usr \
	MANDIR="$pkgdir"/usr/share/man \
	LOGROTATEDIR="$pkgdir"/etc/logrotate.d \
	PPPDIR="$srcdir" \
	CRONDIR="$srcdir" \
	RCRONDIR="$srcdir" \
	INIT_GENTOO="$srcdir" \
	install
  mv "$pkgdir"/usr/bin/nstat "$pkgdir"/usr/bin/nstat-$pkgname
}
