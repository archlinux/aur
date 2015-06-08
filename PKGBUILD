# Contributor: graysky <graysky AT archlinux dot us>

pkgname=('linpack')
pkgver=11.2.2.010
_pkgvershort=11.2.2
_stupid_number=5232
pkgrel=1
arch=('i686' 'x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("http://registrationcenter.intel.com/irc_nas/$_stupid_number/l_lpk_p_$pkgver.tgz"
'linpack.conf' 'runme.template')
sha256sums=('88fcc540425a7be8bd9e78af66474492f8c0f11d9ad4ad8a82879dc5757ffdf2'
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
	_path="l_lpk_p_$pkgver/linpack_$_pkgvershort/benchmarks/linpack"
	_docpath="l_lpk_p_$pkgver/linpack_$_pkgvershort/doc"

	# setup based on detected arch
	sed -e "s/@TARGET_BIT@/$bit/g" <runme.template >linpack_runme_xeon$bit
	
	install -Dm755 linpack_runme_xeon$bit "$pkgdir/usr/bin/linpack_runme_xeon$bit"
	install -Dm644 linpack.conf "$pkgdir/etc/linpack.conf"
	install -Dm644 "$srcdir/$_docpath/lpkEULA.txt" "$pkgdir/usr/share/licenses/linpack/lpkEULA.txt"
	install -Dm644 "$srcdir/$_docpath/lpksupport.txt" "$pkgdir/usr/share/doc/linpack/lpksupport.txt"
	install -Dm755 "$srcdir/$_path/xlinpack_xeon$bit" "$pkgdir/usr/bin/xlinpack_xeon$bit"
	install -Dm644 "$srcdir/$_path/xhelp.lpk" "$pkgdir/usr/share/doc/${pkgname}/xhelp.lpk"
	cp -r "$srcdir/$_docpath/mkl_userguide" "$pkgdir/usr/share/doc/linpack"
}
