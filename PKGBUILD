# Maintainer: Sofian-Hedi Krazini <blackma9ick@proton.me>

# shellcheck shell=bash disable=2034,2154,2164

pkgname=udisken-git
pkgver=0.1.r5.g3bad18b
pkgrel=1
pkgdesc='A small Linux automounter'
arch=(x86_64)
url="https://codeberg.org/blackma9ick/${pkgname%-git}"
license=('GPL-3.0-or-later')
depends=(
	'sdbus-cpp>=2.1.0' 'sdbus-cpp<3.0.0' # SemVer
	'spdlog>=1.15.0'
	'udisks2>=2.10.0' 'udisks2<3.0.0' # X.0.0 (major) bumps
)
makedepends=(
	'git'
	'meson'
	'argparse>=3.2'
)
optdepends=(
	'xdg-utils: for opening drives in default file manager'
)
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
install=service.install
source=("${pkgname}::git+${url}.git?signed")
sha256sums=('SKIP')
validpgpkeys=('F7DE7133F2CB6A18A0A9FCD8333CACEDE4C06716')

pkgver() {
	cd "${pkgname}"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	meson subprojects download --sourcedir="${pkgname}" \
		subprojects/udisks-sdbus-cpp
}

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "${pkgdir:?}" \
		--skip-subprojects udisks-sdbus-cpp # Don't install header files from this subproject.
}
