# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=rustfs
pkgver=1.0.0_rc.6
_console_ver=0.1.27
pkgrel=2
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
	'c2b3f79221966f87ebefd53207b61bdba8a45997c7dc6814ade20ca4a2fe6d9a'
	'628e24b8f9b5a283cedbcfa211ad8fbf69b8b0e24bbe27703fb87f637ed93ff6'
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
