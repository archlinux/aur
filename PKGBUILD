pkgname=vfstool-git
pkgver=0.9.0
pkgrel=1
pkgdesc='Application for OpenMW modlists designed to allow introspecting into and creating virtual filesystems, even for other games.'
url='https://github.com/DreamWeave-MP/vfstool'
license=('GPL')
makedepends=('git' 'cargo')
provides=(vfstool)
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=('git+https://github.com/DreamWeave-MP/vfstool')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/vfstool"
	_tag="$(git describe --tags $(git rev-list --tags --max-count=1))"
	_numcommits="$(git rev-list  $(git rev-list --tags --no-walk --max-count=1)..HEAD --count)"
	_hash="$(git rev-parse --short HEAD)"
	printf "%s.r%s.g%s" "${_tag:1}" "$_numcommits" "$_hash"
}

prepare() {
	cd "${srcdir}/vfstool"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/vfstool"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RUSTFLAGS+=" -C link-arg=-llz4 "
	cargo build --frozen --release --all-features
}

check() {
	cd "${srcdir}/vfstool"
	export RUSTUP_TOOLCHAIN=stable
	export RUSTFLAGS+=" -C link-arg=-llz4 "
	cargo test --frozen --release --all-features
}

package() {
	cd "${srcdir}/vfstool"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/vfstool"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
