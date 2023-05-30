# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=swayosd-git
_pkgname="${pkgname%-git}"
_reponame=SwayOSD
pkgver=r22.d640f1d
pkgrel=1
pkgdesc="A GTK based on screen display for keyboard shortcuts like caps-lock and volume"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/ErikReider/SwayOSD"
license=('GPL3')
depends=('gtk3' 'gtk-layer-shell' 'pulseaudio')
makedepends=('git' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_reponame}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_reponame}"
	cargo fetch --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${_reponame}"
	export RUSTUP_TOOLCHAIN=nightly
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "${_reponame}"
	install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
