# Maintainer: wommel <aur at impium dot de>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=pam_rssh-git
pkgver=r46.773823b
pkgrel=3
pkgdesc='Remote sudo authenticated via ssh-agent'
arch=('x86_64')
url='https://github.com/z4yx/pam_rssh'
license=(MIT)
makedepends=(
	cargo
	git
)
depends=(
	openssl
	pam
)
source=(
	"$pkgname::git+https://github.com/z4yx/pam_rssh.git"
)
sha256sums=(
	SKIP
)

pkgver() {
	cd "$srcdir/$pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${pkgname}"
	git submodule update --init
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "${pkgname}"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

package() {
	install -Dm0644 "${srcdir}/${pkgname}/target/release/libpam_rssh.so" "${pkgdir}/usr/lib/security/${pkgname}.so"
	install -Dm0644 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	sed -i "s#/usr/local/lib/libpam_rssh.so#/usr/lib/security/${pkgname}.so#" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm0644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
