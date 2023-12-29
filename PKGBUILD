# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgbase=ensenso-sdk
pkgname=(ensenso-sdk ensenso-sdk-doc ensenso-sdk-examples)
pkgdesc="Ensenso SDK and tools"
pkgver=3.5.1375
pkgrel=2
arch=(x86_64)
license=(custom)
url='http://ensenso.com'

source=(
	"$pkgname-$pkgver.tar.bz2::https://download.optonic.com/s/ensensosdk/download?files=ensenso-sdk-$pkgver-x64.tar.bz2"
	nxCalTab
	nxProfiler
	nxTreeEdit
	nxView
)

sha512sums=(
	'1f6143b76019ab97c14aa8bc1f8d8e616526c7529d88812a0063807fefded1c903f469c5c7ea4803235e73525dca0ecb4e185e7232b36daf816a527678375bd3'
	'811e6727de246ddf791e5f67136d81a28b667285574612d37df09f228441c3b59829f2376abe3d5fb17bfc20dee03a65acaf3bbb7be22493fddef08d12a811c6'
	'646f56e962e0150cc40a54c6cee546992af79e4e1fff290fadb97d12453bf8778706d690e3650418636d73215d4dce825b6d7ae84ecff3840d53764ec5427d19'
	'4c3e8a8f3a2953cfed52c355d6847dc075aad52f80bb04fd898008c57e629e8a25c497396beef120f948faa7ea0a92125b3dde5c7390db7ad3137deeffeb3c79'
	'421a4e0c742bf60ddee785021e9e81bab14f36e5fde22a6db5dee8fdf8d0b7e303394cfbef855d775cdf8e701ed3fa416d50ec1145a8cb2c875cc2553b5e2c06'
)

# Stripping results in a segfaulting NxView somehow.
options=(!strip)

_hash="632fd5c"
_dir="ensenso-sdk-$pkgver-x64-$_hash"

package_ensenso-sdk() {
	depends=('glibc' 'glu' 'libsm' 'qt4')
	optdepends=(
		'ueyed: for capturing from live cameras'
	)

	local dir="$srcdir/$_dir/"

	install -Dd "$pkgdir/usr"
	install -Dd "$pkgdir/usr/bin"
	install -Dd "$pkgdir/usr/lib/pkgconfig"
	install -Dd "$pkgdir/usr/include"
	install -Dd "$pkgdir/usr/share/doc"
	install -Dd "$pkgdir/usr/share/licenses/$pkgname"

	cp -a "$dir/usr/lib" "$pkgdir/usr/"
	cp -a "$dir/usr/share" "$pkgdir/usr/"
	cp -a "$dir/opt" "$pkgdir/"
	rm -r "$pkgdir/opt/ensenso/development/examples"

	rm -r "$pkgdir/opt/ensenso/lib"
	rm -r "$pkgdir/opt/ensenso/manual"

	ln -s "/opt/ensenso/development/c/include" "$pkgdir/usr/include/ensenso"
	ln -s "/opt/ensenso/pkgconfig/"* "$pkgdir/usr/lib/pkgconfig/"

	install -Dt "$pkgdir/usr/bin" -m 755 \
		"$srcdir/nxCalTab" \
		"$srcdir/nxProfiler" \
		"$srcdir/nxTreeEdit" \
		"$srcdir/nxView"

	install -D "$dir/opt/ensenso/eula.txt" "$pkgdir/usr/share/licenses/$pkgname/eula.txt"
	install -D "$dir/Readme"               "$pkgdir/opt/ensenso/"
}

package_ensenso-sdk-examples() {
	depends=(ensenso-sdk)

	local dir="$srcdir/$_dir/"
	install -Dd "$pkgdir/opt/ensenso/development"
	cp -a "$dir/opt/ensenso/development/examples" "$pkgdir/opt/ensenso/development/"
}

package_ensenso-sdk-doc() {
	local dir="$srcdir/$_dir/"
	install -Dd "$pkgdir/usr/share/doc"
	install -Dd "$pkgdir/opt/ensenso"

	cp -a "$dir/opt/ensenso/manual" "$pkgdir/opt/ensenso/manual"
	ln -s "/opt/ensenso/manual/html" "$pkgdir/usr/share/doc/$pkgname"
}
