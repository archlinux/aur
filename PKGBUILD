# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Nicholas Novak <34256932+NickyBoy89@users.noreply.github.com>
pkgname=typst-git
pkgver=0.9.0.r8.g8fd54676
pkgrel=1
pkgdesc="A new markup-based typesetting system that is powerful and easy to learn (Latest GitHub version)."
url="https://github.com/typst/typst"
license=('Apache')
arch=('x86_64')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/rc.\.//'
}

prepare() {
	cd "${pkgname%-git}"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname%-git}"
	CFLAGS+=" -ffat-lto-objects"
	export TYPST_VERSION="${pkgver}"
	export GEN_ARTIFACTS=artifacts/
	export CARGO_TARGET_DIR=target
	cargo build -p ${pkgname%-git}-cli --frozen --release --all-features
}

check() {
    cd "${pkgname%-git}"
	cargo test --workspace --frozen --release --all-features
}

package() {
	cd "${pkgname%-git}"
	local _artifacts="crates/${pkgname%-git}-cli/artifacts"
	install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm0644 -t "${pkgdir}/usr/share/man/man1/" "$_artifacts/${pkgname%-git}"*.1
	install -Dm0644 -t "${pkgdir}/usr/share/zsh/site-functions/" "${_artifacts}/_${pkgname%-git}"
	install -Dm0644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" "${_artifacts}/${pkgname%-git}.fish"
	install -Dm0644 "${_artifacts}/${pkgname%-git}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
	install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/" "LICENSE"
}
# vim:set ts=4 sw=4 et:
