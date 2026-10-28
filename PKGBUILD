# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=rustfs
pkgver=1.0.4
_console_ver=0.1.38
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
	'fce3eb14564624ddf5bd769d2489d2fc08779363f8d512952096430463d70f82'
	'36cb3728460fa650c70b2ab8d52bcf16b18749dd329a1b58179c031e6dd3e653'
)

prepare() {
	cd ${pkgname}-${pkgver//_/-}

	RUSTC_BOOTSTRAP=1 cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

	cd ${srcdir}/console-${_console_ver}

	# Avoid hitting OS thread limits in Next.js builds by disabling worker threads
	sed -i 's/images: {/experimental: { workerThreads: false, cpus: 1 }, images: {/' next.config.ts
}

build() {
	# build embedded console assets
	cd console-${_console_ver}

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
