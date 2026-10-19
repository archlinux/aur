# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
pkgname=libliftoff-git
pkgver=0.5.0.r14.gc4226a7
pkgrel=1
pkgdesc='Lightweight KMS plane library (git development version)'
arch=(x86_64)
url='https://gitlab.freedesktop.org/emersion/libliftoff'
license=(MIT)
depends=(
	glibc
	libdrm
)
makedepends=(
	git
	meson
)
provides=(
	"${pkgname%-git}=${pkgver}"
	libliftoff.so
)
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "${pkgname}" build \
		-D werror=false
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
	install -Dm644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 "${pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
