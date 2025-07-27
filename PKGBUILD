# Maintainer: Jax Young <jaxvanyang@gmail.com>
pkgname=mydict-git
_name="${pkgname%-git}"
pkgver=r66.04668cf
pkgrel=2
pkgdesc="Simple & fast dictionary application powered by ODict"
arch=(x86_64)
url="https://github.com/jaxvanyang/mydict"
license=('GPL-3.0-or-later')
depends=(glibc gcc-libs bzip2 libxkbcommon xz hicolor-icon-theme oniguruma)
makedepends=(git just cargo)
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
	RUSTFLAGS="-C link-arg=-lonig"
	cargo build --frozen --release
}

# upstream provides no test for now
# check() {
# 	cd "$_name"
# 	export RUSTUP_TOOLCHAIN=stable
# 	cargo test --frozen
# }

package() {
	cd "$_name"
	just rootdir="$pkgdir" install
}
