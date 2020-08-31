# Maintainer: Maciej Żok <maciek.zok@gmail.com>
pkgname=tkrzw-git
pkgrel=1
pkgver=0.9.3
pkgdesc="DBM with various algorithms for key-value storage"
arch=('x86_64')
url="https://dbmx.net/tkrzw/"
license=('APACHE')
depends=('gcc-libs')
makedepends=('git')
checkdepends=('gmock' 'gtest')
provides=("${pkgname%-git}" 'libtkrzw.so')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/estraier/tkrzw.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "%s.r%s.%s" "$(sed -n 's/AC_INIT(tkrzw,\s*\(.*\))/\1/p' configure.in)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install

	echo "Installing license..."
	install -Dm0755 "${srcdir}/tkrzw/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
