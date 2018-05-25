# Maintainer: c0d3st0rm
pkgname=intel-lms-git
pkgver=1
pkgrel=1
pkgdesc="Intel(R) Local Manageability Service tool. This version of LMS is based on the official Intel sources, with modifications to fix issues and try to extend system compatibility."
url="https://github.com/openamt/lms"
arch=('x86_64')
license=('custom')
depends=()
makedepends=('git' 'make' 'gcc')
source=(
	"$pkgname::git+https://github.com/openamt/lms"
)
sha256sums=('SKIP')
build_threadcount="$(cat /proc/cpuinfo|grep processor|wc -l)"

pkgver() {
	cd "$pkgname"
	printf '%s.%s' $(cat configure|grep 'PACKAGE_VERSION='|cut -b 18-|sed -e "s/'//g") "$(git describe --always)"
}

prepare() {
	cd "$pkgname"
    ./configure
}

build() {
	cd "$pkgname"
    make -j"${build_threadcount}"
}

package() {
	cd "$pkgname"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/mestatus/LICENSE"
}
