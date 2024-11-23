# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=passmark-performancetest-bin
pkgver=v11.0.1002
pkgrel=3
pkgdesc="PassMark PerformanceTest Linux - Fast, easy to use, Linux system speed testing and benchmarking."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.passmark.com/products/pt_linux/"
options=('!strip')
license=('custom')
depends=('ncurses5-compat-libs' 'curl')
changelog=CHANGELOG
source_x86_64=("pt_linux_x64_$pkgver.zip::https://www.passmark.com/downloads/pt_linux_x64.zip")
source_aarch64=("pt_linux_arm64_$pkgver.zip::https://www.passmark.com/downloads/pt_linux_arm64.zip")
source_armv7h=("pt_linux_arm32_$pkgver.zip::https://www.passmark.com/downloads/pt_linux_arm32.zip")
sha256sums_x86_64=('abd1fefd5e1f912c09244a7e56cf8c3ef9dd8b90c89f1e4c402cc0bfdeb92098')
sha256sums_aarch64=('edf99dd9fba4279e9ed0124525edd28ad1a5a2b7722056cd8c8cd0bfebba66ec')
sha256sums_armv7h=('e13c6bdd3bbc030e49c06b4b787fe06e18d04f1fe23da44f9d0703410dd6e817')

prepare() {
	cd "PerformanceTest" || exit

	# abort packaging if license changed
	if [ "3a5466cf822921ff49ac704aedde345ea46b8b4efe465b137b2c1377bc1597c4  -" = "$(head -n7 readme.txt | sha256sum)" ]; then
		echo "licence doesn't match expected checksum"
		exit 1
	fi

	# extract license
	head -n4 readme.txt >LICENSE
}

package() {
	cd "PerformanceTest" || exit

	install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	case $CARCH in

	x86_64)
		install -D pt_linux_x64 "$pkgdir/usr/bin/passmark-performancetest"
		;;

	aarch64)
		install -D pt_linux_arm64 "$pkgdir/usr/bin/passmark-performancetest"
		;;

	armv7h)
		install -D pt_linux_arm32 "$pkgdir/usr/bin/passmark-performancetest"
		;;

	*)
		echo "unsupported CARCH, bailing"
		exit 1
		;;

	esac
}
