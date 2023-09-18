# Maintainer: Jason Papakostas <vithos@gmail.com>

pkgname=passmark-performancetest-bin
pkgver=v11.0.1001
pkgrel=2
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
sha256sums_x86_64=('e9cf3c79211838756ed051500d032746018a0b7767eb153d05dce64de75d14fc')
sha256sums_aarch64=('39698367913ad77841a380c7ea7e0895e2e911df459f2487a2f983957134ba6f')
sha256sums_armv7h=('9f61fe33a65b44f5bbe76f339421af16d767f91d716ca58e9671238658bbc50d')

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
