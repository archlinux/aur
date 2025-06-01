# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=fav-git
_pkgname="${pkgname%-git}"
pkgver=v1.0.0.r3.gf1d879c
pkgrel=1
pkgdesc='Back up your favorite bilibili resources with CLI'
url="https://github.com/kingwingfly/${_pkgname}"
# license=('LicenseRef-MIT')
license=('custom:MIT')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
makedepends=('cargo' 'git' 'pkgconf')
depends=('sqlite')

source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
		git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)

}

prepare() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

	# copy LICENSE file
	cp LICENSE $srcdir/
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	export LIBSQLITE3_SYS_USE_PKG_CONFIG=1
	cargo build --release --frozen --all-features
}

check() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features --workspace
}

package() {
	cd "$_pkgname"
	mv target/release/fav_bili target/release/${_pkgname}
	install -Dm755 "target/release/${_pkgname}" -t "$pkgdir/usr/bin/"

	# completions
	target/release/${_pkgname} completion bash > ${_pkgname}.bash
	target/release/${_pkgname} completion fish > ${_pkgname}.fish
	target/release/${_pkgname} completion zsh > _${_pkgname}
	install -Dm644 ${_pkgname}.bash "$pkgdir"/usr/share/bash-completion/completions/${_pkgname}
	install -Dm644 ${_pkgname}.fish "$pkgdir"/usr/share/fish/vendor_completions.d/${_pkgname}.fish
	install -Dm644 _${_pkgname} "$pkgdir"/usr/share/zsh/site-functions/_${_pkgname}

	# license
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
