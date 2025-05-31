# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgname=mydict-git
_name="${pkgname%-git}"
pkgver=r42.ba6265f
pkgrel=1
pkgdesc="Simple & fast dictionary application powered by ODict"
arch=(x86_64)
url="https://github.com/jaxvanyang/mydict"
license=('MIT')
depends=('gcc-libs' 'bzip2' 'libxkbcommon' 'xz' 'hicolor-icon-theme')
makedepends=('git' 'just' 'cargo')
provides=("$_name")
conflicts=("$_name")
source=("$_name::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_name"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_name"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_name"
	cargo build --frozen --release --all-features
}

check() {
	cd "$_name"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$_name"
	just rootdir="$pkgdir" install
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
