# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgbase=ensenso-sdk
pkgname=(ensenso-sdk ensenso-sdk-runtime ensenso-sdk-gui ensenso-sdk-doc ensenso-sdk-examples)
pkgdesc="Ensenso SDK and tools"
pkgver=4.0.1486
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
	ensenso-sdk.sh
)

sha512sums=(
	'10a067efb2bb532d7f9ea6ea6611aa03ea201f95f613a2c4daf9a57a8154a028c05a945762c081c4fb7d208487461c7096ceca88b4fa475189f701ba40c4c10f'
	'811e6727de246ddf791e5f67136d81a28b667285574612d37df09f228441c3b59829f2376abe3d5fb17bfc20dee03a65acaf3bbb7be22493fddef08d12a811c6'
	'646f56e962e0150cc40a54c6cee546992af79e4e1fff290fadb97d12453bf8778706d690e3650418636d73215d4dce825b6d7ae84ecff3840d53764ec5427d19'
	'4c3e8a8f3a2953cfed52c355d6847dc075aad52f80bb04fd898008c57e629e8a25c497396beef120f948faa7ea0a92125b3dde5c7390db7ad3137deeffeb3c79'
	'421a4e0c742bf60ddee785021e9e81bab14f36e5fde22a6db5dee8fdf8d0b7e303394cfbef855d775cdf8e701ed3fa416d50ec1145a8cb2c875cc2553b5e2c06'
	'8ba4af7b9af3a5bc997e515532aebd2c206fcda17eb2f941ca930d3c358badc354c137e2bbd5ff93446c250137dd5d829163cec01bc25a726ad8448cbc7bc9d7'
)

_dir="ensenso-sdk-$pkgver-x64"

package_ensenso-sdk() {
	depends=('ensenso-sdk' 'ensenso-sdk-gui')
	optdepends=(
		'ensenso-sdk-examples: for coding examples'
		'ensenso-sdk-doc: for documentation'
	)
}

package_ensenso-sdk-runtime() {
	depends=('glibc' 'glu' 'libsm')
	optdepends=(
		'ueyed: for capturing from live cameras'
	)

	local dir="$srcdir/$_dir/"

	install -Dd "$pkgdir/usr"
	install -Dd "$pkgdir/usr/lib/pkgconfig"
	install -Dd "$pkgdir/usr/include"
	install -Dd "$pkgdir/usr/share/licenses/$pkgname"

	cp -a "$dir/usr/lib" "$pkgdir/usr/"
	cp -a "$dir/opt" "$pkgdir/"
	rm -r "$pkgdir/opt/ensenso/development/examples"
	rm -r "$pkgdir/opt/ensenso/bin"

	rm -r "$pkgdir/opt/ensenso/lib"
	rm -r "$pkgdir/opt/ensenso/manual"

	ln -s "../../opt/ensenso/development/c/include" "$pkgdir/usr/include/ensenso"
	(
		cd "$pkgdir/usr/lib/pkgconfig/"
		ln -s "../../../opt/ensenso/pkgconfig/"* ./
	)

	install -Dt "$pkgdir/etc/profile.d/"               "ensenso-sdk.sh"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$dir/opt/ensenso/eula.txt"
	install -Dt "$pkgdir/opt/ensenso/"                 "$dir/Readme"
}

package_ensenso-sdk-gui() {
	depends=('ensenso-sdk-runtime' 'qt5-base')

	local dir="$srcdir/$_dir/"

	install -Dd "$pkgdir/usr"
	install -Dd "$pkgdir/usr/bin"
	install -Dd "$pkgdir/opt/ensenso"

	cp -a "$dir/opt/ensenso/bin" "$pkgdir/opt/ensenso/"
	cp -a "$dir/usr/share" "$pkgdir/usr/"

	install -Dt "$pkgdir/usr/bin" -m 755 \
		"$srcdir/nxCalTab" \
		"$srcdir/nxProfiler" \
		"$srcdir/nxTreeEdit" \
		"$srcdir/nxView"
}

package_ensenso-sdk-examples() {
	arch=(any)
	depends=(ensenso-sdk)

	local dir="$srcdir/$_dir/"
	install -Dd "$pkgdir/opt/ensenso/development"
	cp -a "$dir/opt/ensenso/development/examples" "$pkgdir/opt/ensenso/development/"
}

package_ensenso-sdk-doc() {
	arch=(any)

	local dir="$srcdir/$_dir/"
	install -Dd "$pkgdir/usr/share/doc"
	install -Dd "$pkgdir/opt/ensenso"

	cp -a "$dir/opt/ensenso/manual" "$pkgdir/opt/ensenso/manual"
	ln -s "/opt/ensenso/manual/html" "$pkgdir/usr/share/doc/$pkgname"
}
