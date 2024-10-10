# Maintainer: Kimiblock Moe

pkgname=browsers-git
pkgdesc="Open the right browser at the right time"
url="https://github.com/Browsers-software/browsers"
license=("custom")
arch=("any")
pkgver=r671.c8811a4
pkgrel=1
makedepends=("rust" "cargo" "git")
depends=()
source=("git+https://github.com/Browsers-software/browsers.git")
md5sums=("SKIP")
provides=("browsers")

function pkgver() {
	cd "${srcdir}/browsers"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

function prepare() {
	cd "${srcdir}/browsers"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

function build() {
	cd "${srcdir}/browsers"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features --locked
}

function check() {
	cd "${srcdir}/browsers"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

function package() {
	install -Dm755 "${srcdir}/browsers/target/release/browsers" "${pkgdir}/usr/bin/browsers"
	install -Dm644 "${srcdir}/browsers/extra/linux/dist/software.Browsers.template.desktop" "${pkgdir}/usr/share/applications/software.Browsers.desktop"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor"
	#cp -r "${srcdir}"/browsers/resources/icons/* "${pkgdir}/usr/share/icons/hicolor"
	sed -i 's/€ExecCommand€/browsers %u/g' "${pkgdir}/usr/share/applications/software.Browsers.desktop"
	cp -r "${srcdir}/browsers/resources" "${pkgdir}/usr/share/software.Browsers"
	chmod -R 755 "${pkgdir}/usr"
	install -Dm755 "${srcdir}"/browsers/resources/icons/512x512/software.Browsers.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/software.Browsers.png"
}


