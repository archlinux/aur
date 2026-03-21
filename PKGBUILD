pkgname=mobvibe-cli-git
pkgver=0.1.46.r3.g95262dc
pkgrel=1
pkgdesc="CLI daemon for Mobvibe that connects ACP-compatible agents to the gateway"
arch=("x86_64" "aarch64")
url="https://github.com/Eric-Song-Nop/mobvibe"
license=("Apache-2.0")
depends=("gcc-libs" "glibc")
makedepends=("bun" "git" "pnpm")
provides=("mobvibe-cli")
conflicts=("mobvibe-cli")
source=("${pkgname}::git+${url}.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags --abbrev=7 | sed "s/^v//; s/-/.r/; s/-g/./"
}

build() {
	cd "${srcdir}/${pkgname}"

	pnpm install --frozen-lockfile
	pnpm -C packages/shared build

	local bun_target
	case "${CARCH}" in
		x86_64)
			bun_target="linux-x64"
			;;
		aarch64)
			bun_target="linux-arm64"
			;;
		*)
			echo "Unsupported architecture: ${CARCH}" >&2
			return 1
			;;
	esac

	cd apps/mobvibe-cli
	MOBVIBE_BUN_TARGET="${bun_target}" bun run build-bin.ts
}

package() {
	cd "${srcdir}/${pkgname}/apps/mobvibe-cli"

	local bin_dir
	case "${CARCH}" in
		x86_64)
			bin_dir="linux-x64"
			;;
		aarch64)
			bin_dir="linux-arm64"
			;;
		*)
			echo "Unsupported architecture: ${CARCH}" >&2
			return 1
			;;
	esac

	install -Dm755 "npm/${bin_dir}/bin/mobvibe" "${pkgdir}/usr/bin/mobvibe"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
