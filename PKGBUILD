pkgname=delta-plugin-git
pkgver=0.24.1
pkgrel=1
pkgdesc='A multi-purpose OMWAddon/ESP tool. Its primary features include a yaml transcoder, minimal diffing functionality, and using the minimal diffing functionality to produce merged plugins'
url='https://gitlab.com/bmwinger/delta-plugin'
license=('GPL')
makedepends=('git' 'cargo')
provides=(delta-plugin)
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=('git+https://gitlab.com/bmwinger/delta-plugin.git')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	_tag="$(git describe --tags $(git rev-list --tags --max-count=1))"
	_numcommits="$(git rev-list  $(git rev-list --tags --no-walk --max-count=1)..HEAD --count)"
	_hash="$(git rev-parse --short HEAD)"
	printf "%s.r%s.g%s" "$_tag" "$_numcommits" "$_hash"
}

prepare() {
	cd "${srcdir}/delta-plugin"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/delta-plugin"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${srcdir}/delta-plugin"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${srcdir}/delta-plugin"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/delta_plugin"
}
