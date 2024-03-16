# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=fav-git
_pkgname="${pkgname%-git}"
pkgver=v0.2.10.r3.g11245b0
# _tag="$(git -C "$_pkgname" describe --tags --abbrev=0)"
_commit="$(git -C "$_pkgname" log -1 --pretty=format:%H)"
pkgrel=1
pkgdesc='Back up your favorite bilibili resources with CLI'
url="https://github.com/kingwingfly/${_pkgname}"
# license=('LicenseRef-MIT')
license=('custom:MIT')
arch=('x86_64')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
makedepends=('cargo' 'git' 'pkgconf')

source=("$_pkgname::git+$url.git"
	"$url/raw/${_commit}/LICENSE")
sha256sums=('SKIP'
            '54e2d4c99f8d0eacb6dd9cae4c1bddce86fe7926d29cdb0ceded4d3797df0d65')

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
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --frozen --all-features
}

## check() cannot run automatically, it requires manual intervention.
## And check() will not affect the build, so comment it out here.
# check() {
# 	cd "$_pkgname"
# 	export RUSTUP_TOOLCHAIN=stable
# 	cargo test --frozen --all-features --workspace
# }

package() {
	cd "$_pkgname"
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
