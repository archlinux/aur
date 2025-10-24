# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=rustfs-git
pkgver=1.0.0.alpha.65.r3.gb47765b4
_console_ver=0.0.10
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
	'git'
	'cargo'
	'pnpm'
)
options=(!lto)
source=(
	"${pkgname%-git}::git+https://github.com/rustfs/rustfs.git"
	"console::git+https://github.com/rustfs/console.git"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd "${pkgbase%-git}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${pkgname%-git}

	RUSTC_BOOTSTRAP=1 cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	# build embedded console assets
	cd console

	# `NUXT_TELEMETRY_DISABLED=1` ignores the Nuxt.js starting question.
	export NUXT_TELEMETRY_DISABLED=1
	# pnpm-lock.yaml exists, but pnpm failed to build. The following options fixes it.
	pnpm i --shamefully-hoist --dangerously-allow-all-builds
	pnpm generate
	cp -r .output/public/* ${srcdir}/${pkgname%-git}/rustfs/static/

	# build rustfs
	cd ${srcdir}/${pkgname%-git}

	RUSTC_BOOTSTRAP=1 cargo build --frozen --release
}

package() {
	cd ${pkgname%-git}

	install -Dm 755 -t "${pkgdir}/usr/bin" target/release/rustfs
}
