# Maintainer: xiliuya <xiliuya@aliyun.com>

pkgname=lightpanda
pkgver=0.3.7
pkgrel=1
pkgdesc="Headless browser designed for AI and automation - 11x faster than Chrome, 9x less memory"
arch=('x86_64' 'aarch64')
url="https://lightpanda.io"
license=('AGPL-3.0-only')
provides=('lightpanda')
makedepends=('zig' 'rust' 'cargo' 'git' 'python3')

source=(lightpanda_${pkgver}.tar.gz::https://github.com/lightpanda-io/browser/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('4d5963d921d8a5982dc943ea2bf3c07037410018dec16626594fa3238ed50265')
build() {
    zig version
	cd "browser-${pkgver}"

	if [[ "$CARCH" == "x86_64" ]]; then
		msg2 "Optional: enable AVX build with:   ENABLE_AVX=1 makepkg -si"
		if [[ "$ENABLE_AVX" == "1" ]]; then
			msg2 $'\e[32mBuilding with AVX\e[0m'
			ZIG_CPU="x86_64_v3"
		else
			msg2 $'\e[32mBuilding baseline (no AVX)\e[0m'
			ZIG_CPU="x86_64"
		fi
	else
		ZIG_CPU="aarch64"
	fi

	printf "\033[36mBuilding v8 snapshot (release safe)...\033[0m\n"
	zig build -Doptimize=ReleaseFast -Dcpu="$ZIG_CPU" snapshot_creator -- src/snapshot.bin || (
		printf "\033[33mBuild ERROR\033[0m\n"
		exit 1
	)
	printf "\033[33mBuild OK\033[0m\n"

	printf "\033[36mBuilding (release fast)...\033[0m\n"
	zig build -Doptimize=ReleaseFast -Dcpu="$ZIG_CPU" -Dsnapshot_path=../../snapshot.bin || (
		printf "\033[33mBuild ERROR\033[0m\n"
		exit 1
	)
	printf "\033[33mBuild OK\033[0m\n"

}

package() {
	install -Dm755 "${srcdir}/browser-${pkgver}/zig-out/bin/lightpanda" "$pkgdir/usr/bin/lightpanda"
	chmod +x "$pkgdir/usr/bin/lightpanda"
}
