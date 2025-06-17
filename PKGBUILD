pkgname=s3lightfixes-git
pkgver=0.4.1
pkgrel=1
pkgdesc='Application for OpenMW modlists designed to make ESP files which adjust the lighting values from all mods listed in openmw.cfg'
url='https://modding-openmw.com/mods/s3lightfixes/'
license=('GPL')
makedepends=('git' 'cargo')
provides=(s3lightfixes)
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=('git+https://github.com/magicaldave/S3LightFixes')
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/S3LightFixes"
	_tag="$(git describe --tags $(git rev-list --tags --max-count=1))"
	_numcommits="$(git rev-list  $(git rev-list --tags --no-walk --max-count=1)..HEAD --count)"
	_hash="$(git rev-parse --short HEAD)"
	printf "%s.r%s.g%s" "${_tag:1}" "$_numcommits" "$_hash"
}

prepare() {
	cd "${srcdir}/S3LightFixes"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "${srcdir}/S3LightFixes"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "${srcdir}/S3LightFixes"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "${srcdir}/S3LightFixes"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/s3lightfixes"
}
