# Maintainer: Rubin Simons <me@rubin55.org>

pkgname=passmark-performancetest-bin
pkgver=v11.0.1004
pkgrel=1
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
sha256sums_x86_64=('dab991f957373a5cfaa1e1b212a882bbb4d0fb85abaa22fc7694e8bd9dc070ad')
sha256sums_aarch64=('968d247170df1a060e798ce0e9c033c83c8e018fafbd2930d4db666c7d435021')
sha256sums_armv7h=('c521a068015c551d4ace1ccc229828699fd3b5fac099016aaec0ad6167e42d6f')

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
		install -D PerformanceTest_Linux_x86-64 "$pkgdir/usr/bin/passmark-performancetest"
		;;

	aarch64)
		install -D PerformanceTest_Linux_arm64 "$pkgdir/usr/bin/passmark-performancetest"
		;;

	armv7h)
		install -D PerformanceTest_Linux_arm32 "$pkgdir/usr/bin/passmark-performancetest"
		;;

	*)
		echo "unsupported CARCH, bailing"
		exit 1
		;;

	esac
}
