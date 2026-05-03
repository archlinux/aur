# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=rustfs
pkgver=1.0.0_alpha.97
_console_ver=0.1.7
pkgrel=1
pkgdesc="High-performance distributed object storage for MinIO alternative."
url='https://rustfs.com/en/'
arch=('x86_64')
license=('Apache-2.0')
depends=(
	'glibc'
	'gcc-libs'
	'bzip2'
)
makedepends=(
	'cargo'
	'pnpm'
	'protobuf'
)
options=(!lto)
source=(
	"${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/rustfs/rustfs/archive/refs/tags/${pkgver//_/-}.tar.gz"
	"console-${_console_ver}.tar.gz::https://github.com/rustfs/console/archive/refs/tags/v${_console_ver}.tar.gz"
)
sha256sums=(
	'4c7089a2ae6faa058aa504565eef31c252ec5652a879f9ae1d72786845b37171'
	'1ecd2f414379786bcac322e90a6c06e23bbad1d77693fef796cfe91f996aebb2'
)

prepare() {
	cd ${pkgname}-${pkgver//_/-}

	RUSTC_BOOTSTRAP=1 cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	# build embedded console assets
	cd console-${_console_ver}

	pnpm i --dangerously-allow-all-builds
	pnpm build
	cp -r out/* ${srcdir}/${pkgname}-${pkgver//_/-}/rustfs/static/

	# build rustfs
	cd ${srcdir}/${pkgname}-${pkgver//_/-}

	export AWS_LC_SYS_NO_JITTER_ENTROPY=1
	RUSTFLAGS+=' --cfg tokio_unstable'
	RUSTC_BOOTSTRAP=1 cargo build --frozen --release
}

package() {
	cd ${pkgname}-${pkgver//_/-}

	install -Dm 755 -t "${pkgdir}/usr/bin" target/release/rustfs
}
