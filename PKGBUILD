# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: taotieren <admin@taotieren.com>
# Contributor: glatavento <glatavento at outlook dot com>

pkgname=libjaylink-git
_pkg="${pkgname%-git}"
pkgver=0.3.1.r4.ge98b1d4
pkgrel=1
pkgdesc='Library for accessing SEGGER J-Link and compatible devices'
arch=('x86_64')
url='https://gitlab.zapb.de/libjaylink/libjaylink'
license=('GPL-2.0-or-later')
depends=('glibc'
	'libusb')
makedepends=('git')
optdepends=('doxygen: Required for API documentation')
provides=("$_pkg.so")
conflicts=("$_pkg")
source=("$_pkg::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkg}"
    ( set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare()
{
    git -C "${srcdir}/${_pkg}" clean -dfx
}

build() {
	cd "$_pkg"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkg"
	make DESTDIR="$pkgdir/" install
}
