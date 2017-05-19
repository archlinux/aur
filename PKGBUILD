# Contributor: graysky <graysky AT archlinux dot us>
pkgname=('linpack')
pkgver=2017.3.017
_math_kernel_lib=2017
_url=9752
pkgrel=1
arch=('i686' 'x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("http://registrationcenter-download.intel.com/akdlm/irc_nas/$_url/l_mklb_p_$pkgver.tgz"
'linpack.conf' 'runme.template')
sha256sums=('ff1164e9b525c115543059be87bc759f3f843b598fc78fd445abd7747a136a95'
            'd7e31c8c7e2648c8fa3c4838d98dfc39b8fadf0f74bdaa4ca52cd38277ec8254'
            '8bcd48bd97b3177590f15e922f8f7fb1ebfe6ea0608b4d63d8902ac2bd9b6a52')

build() {
	[[ -z "$CARCH" ]] && echo "Cannot determine architecture of this system!" && exit 1
	[[ "$CARCH" = "x86_64" ]] && bit=64 || bit=32
	export bit
}

package_linpack() {
	pkgdesc='Benchmark based on linear algebra excellent app for stress testing.'
	backup=(etc/linpack.conf)
	_base="$srcdir/l_mklb_p_$pkgver/benchmarks_$_math_kernel_lib"
	_test="$_base/linux/mkl/benchmarks/linpack"
	# setup based on detected arch
	sed -e "s/@TARGET_BIT@/$bit/g" <runme.template >linpack_runme_xeon$bit
	
	install -Dm755 linpack_runme_xeon$bit "$pkgdir/usr/bin/linpack_runme_xeon$bit"
	install -Dm644 linpack.conf "$pkgdir/usr/share/$pkgname/linpack.conf"
	install -Dm644 "$_base/license.txt" "$pkgdir/usr/share/licenses/linpack/license.txt"
	install -Dm755 "$_test/xlinpack_xeon$bit" "$pkgdir/usr/bin/xlinpack_xeon$bit"
}
