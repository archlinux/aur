# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libinput-config
pkgver=r84.f373bb6
pkgrel=1
pkgdesc='Configuration system for libinput'
arch=(x86_64)
url='https://gitlab.com/warningnonpotablewater/libinput-config'
license=(BSD)
depends=(
	glibc
	libinput
)
makedepends=(
	git
	meson
)
_commit='f373bb6777ce983368bc540b7d683cc59e274b9e'
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	# git describe --long --tags --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	install -Dm644 /dev/null "${pkgdir}/etc/ld.so.preload"
	meson install -C build --destdir "${pkgdir}"
	install -Dm644 "${srcdir}/libinput-config/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
