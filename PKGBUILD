# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=deltarpm
pkgver=3.6.3
pkgrel=1
pkgdesc="Create deltas between rpms"
arch=('i686' 'x86_64')
license=('custom:BSD')
url="https://github.com/rpm-software-management/$pkgname"
depends=('rpm-tools' 'zlib' 'zstd>=1.3.8')
makedepends=('python2' 'python')
optdepends=('perl: for drpmsync command'
            'python2: for python2 module'
            'python: for python3 module')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5a24a92baa9c4b6c650f02fe8addd2002f3afde3fd5bd526d9988cf6ecdb682b')

build() {
	cd "$pkgname-$pkgver"
	make CPPFLAGS="$CPPFLAGS"     \
	     CFLAGS="$CFLAGS -fPIC -DWITH_ZSTD=1" \
	     LDFLAGS="$LDFLAGS"       \
	     PYTHONS='python2 python' \
	     prefix=/usr              \
	     zlibbundled=''           \
	     zlibldflags='-lz'        \
	     zlibcppflags=''          \
	     all python
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/"       \
	     PYTHONS='python2 python' \
	     prefix=/usr              \
	     mandir=/usr/share/man    \
	     install

	install -Dp -m644 README      "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dp -m644 LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
}

# vim: set ft=sh ts=4 sw=4 noet:
