# Contributor: graysky <graysky AT archlinux dot us>

pkgname=('linpack')
pkgver=11.3.1.002
_math_kernel_lib=11.3.1
_url=8305
pkgrel=1
arch=('i686' 'x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("http://registrationcenter.intel.com/irc_nas/$_url/l_mklb_p_$pkgver.tgz"
'linpack.conf' 'runme.template')
sha256sums=('aac34c9960a394130bc5b77060dc3e2066d36a8b020465f0ec16d5a30551ed1b'
            'd7e31c8c7e2648c8fa3c4838d98dfc39b8fadf0f74bdaa4ca52cd38277ec8254'
            '8c880adeee3de6c0e6005e210cea0e01b471219c590e25e824298a25ab0eef31')

build() {
	[[ -z "$CARCH" ]] && echo "Cannot determine architecture of this system!" && exit 1
	[[ "$CARCH" = "x86_64" ]] && bit=64 || bit=32
	export bit
}

package_linpack() {
	pkgdesc='Benchmark based on linear algebra excellent app for stress testing.'
	install=readme.install
	backup=(etc/linpack.conf)
	_base="$srcdir/l_mklb_p_$pkgver/benchmarks_$_math_kernel_lib"
	_test="$_base/linux/mkl/benchmarks/linpack"
	# setup based on detected arch
	sed -e "s/@TARGET_BIT@/$bit/g" <runme.template >linpack_runme_xeon$bit
	
	install -Dm755 linpack_runme_xeon$bit "$pkgdir/usr/bin/linpack_runme_xeon$bit"
	install -Dm644 linpack.conf "$pkgdir/etc/linpack.conf"
	install -Dm644 "$_base/license.txt" "$pkgdir/usr/share/licenses/linpack/license.txt"
	install -Dm644 "$_base/support.txt" "$pkgdir/usr/share/doc/linpack/support.txt"
	install -Dm755 "$_test/xlinpack_xeon$bit" "$pkgdir/usr/bin/xlinpack_xeon$bit"
	#install -Dm644 "$srcdir/$_binpath/xhelp.lpk" "$pkgdir/usr/share/doc/${pkgname}/xhelp.lpk"
	#cp -r "$srcdir/$_docpath" "$pkgdir/usr/share/doc/linpack"
}
