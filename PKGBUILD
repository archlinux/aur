# Maintainer: Sofian-Hedi Krazini <blackma9ick@proton.me>

# shellcheck shell=bash disable=2034,2154,2164

pkgname=udisken
pkgver=0.1
pkgrel=1
pkgdesc='A small Linux automounter'
arch=(x86_64)
url="https://codeberg.org/blackma9ick/${pkgname}"
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
install=service.install
_tag=b40c7c7299c1da8bb5758b80558179d08157240a # git rev-parse "${pkgver}"
_udisks_sd_tag=aba2e16f0f7db6c635bb5095bbbae9811bd70582
source=(
	"${pkgname}::git+${url}.git#tag=${_tag}?signed"
	"git+https://codeberg.org/blackma9ick/udisks-sdbus-cpp.git#tag=${_udisks_sd_tag}?signed"
)
b2sums=(
	'afc91836503a832b424f827966e903b71a65d07278fc09d5918bd32cbf439e80c2aade8226cf96cf8668f133d225fb6fd801bfa5ce64af8bae7ddc4e7724c257'
	'9012a2dba4c7a8e1a266d959b5a83186479ff67ea333ac0a0662a086e1baca43ba15e5b430ba1c543e0a729c679ed5b0ba494fea39f6060bba08d7ad76f96a47'
)
validpgpkeys=('F7DE7133F2CB6A18A0A9FCD8333CACEDE4C06716')

pkgver() {
	cd "${pkgname}"
	git describe
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
