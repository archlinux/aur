# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=rustfs
pkgver=1.0.0_beta.12
_console_ver=0.1.17
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
	'a80b8eff2d9234ac6a0a507f41ec3fc4572422d43b38498ef06a95b389391fad'
	'cdcb7f29839c2b8e47e2163b92e61b63b410bec3b06461f4e7ebab6569ef9b69'
)

prepare() {
	cd ${pkgname}-${pkgver//_/-}

	RUSTC_BOOTSTRAP=1 cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	# build embedded console assets
	cd console-${_console_ver}

	# Avoid hitting OS thread limits in Next.js builds by disabling worker threads
	sed -i 's/images: {/experimental: { workerThreads: false, cpus: 1 }, images: {/' next.config.ts

	pnpm --pm-on-fail=ignore i --dangerously-allow-all-builds
	pnpm --pm-on-fail=ignore build
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
