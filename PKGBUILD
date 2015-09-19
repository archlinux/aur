# Contributor: graysky <graysky AT archlinux dot us>

pkgname=('linpack')
pkgver=11.3.0.006
_pkgvershort=11.3
_stupid_number=7963
pkgrel=1
arch=('i686' 'x86_64')
license=('custom')
url="http://software.intel.com/en-us/articles/intel-math-kernel-library-linpack-download"
source=("http://registrationcenter.intel.com/irc_nas/$_stupid_number/l_lpk_p_$pkgver.tgz"
'linpack.conf' 'runme.template')
sha256sums=('bbabed3cd3686ead35d8bf59df5c7b6608f7c1919be29f01dda6363ded4c250c'
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
	_path="l_lpk_p_$pkgver/linpack_$_pkgvershort"
	_binpath="$_path/linux/mkl/benchmarks/linpack"
	_docpath="$_path/documentation_2016/en/mkl/common/mkl_userguide"

	# setup based on detected arch
	sed -e "s/@TARGET_BIT@/$bit/g" <runme.template >linpack_runme_xeon$bit
	
	install -Dm755 linpack_runme_xeon$bit "$pkgdir/usr/bin/linpack_runme_xeon$bit"
	install -Dm644 linpack.conf "$pkgdir/etc/linpack.conf"
	install -Dm644 "$srcdir/$_path/lpkEULA.txt" "$pkgdir/usr/share/licenses/linpack/lpkEULA.txt"
	install -Dm644 "$srcdir/$_path/lpksupport.txt" "$pkgdir/usr/share/doc/linpack/lpksupport.txt"
	install -Dm755 "$srcdir/$_binpath/xlinpack_xeon$bit" "$pkgdir/usr/bin/xlinpack_xeon$bit"
	install -Dm644 "$srcdir/$_binpath/xhelp.lpk" "$pkgdir/usr/share/doc/${pkgname}/xhelp.lpk"
	cp -r "$srcdir/$_docpath" "$pkgdir/usr/share/doc/linpack"
}
