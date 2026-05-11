# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgbase=ensenso-sdk
pkgname=(ensenso-sdk ensenso-sdk-runtime ensenso-sdk-gui ensenso-sdk-doc ensenso-sdk-examples ensenso-sdk-halcon)
pkgdesc="Ensenso SDK and tools"
pkgver=4.3.991
pkgrel=1
arch=(x86_64)
license=(custom)
url='http://ensenso.com'

source=(
	"$pkgname-$pkgver.deb::https://share.optonic.com/public.php/dav/files/ensensosdk/ensenso-sdk-$pkgver-x64.deb"
	90-ensenso-install.conf
	ensenso-cli
	ensenso-engage
	nxCalTab
	nxProfiler
	nxTreeEdit
	nxView
)

sha512sums=('412938f493c0326e60b89c3ef1a65e3fe4704ca9b27d015de4f6df5bfd2d76eee4d6749c68377779c95c4422bb3ded4923216a8b05d968da511ecc6de2efe8bd'
            '8ba4af7b9af3a5bc997e515532aebd2c206fcda17eb2f941ca930d3c358badc354c137e2bbd5ff93446c250137dd5d829163cec01bc25a726ad8448cbc7bc9d7'
            '078540395ddece29a0433632cd4eca15eba09afcd52c3751d2eadf86c474cdf8d8f28b443146f84835767a3df42df926f929fa07058ef4f6ff9aa23bbd5d8f02'
            'ba6de8c87918a870e55023c4da172e66eec608562dac620b869c452441d6f1b02aca406172a7bb15960ffd7588e2abdf0718117b371639dc6ce94f9a0bb4111a'
            '811e6727de246ddf791e5f67136d81a28b667285574612d37df09f228441c3b59829f2376abe3d5fb17bfc20dee03a65acaf3bbb7be22493fddef08d12a811c6'
            '646f56e962e0150cc40a54c6cee546992af79e4e1fff290fadb97d12453bf8778706d690e3650418636d73215d4dce825b6d7ae84ecff3840d53764ec5427d19'
            '4c3e8a8f3a2953cfed52c355d6847dc075aad52f80bb04fd898008c57e629e8a25c497396beef120f948faa7ea0a92125b3dde5c7390db7ad3137deeffeb3c79'
            '421a4e0c742bf60ddee785021e9e81bab14f36e5fde22a6db5dee8fdf8d0b7e303394cfbef855d775cdf8e701ed3fa416d50ec1145a8cb2c875cc2553b5e2c06')

prepare() {
	bsdtar -xf data.tar.xz
}

package_ensenso-sdk() {
	depends=('ensenso-sdk-runtime' 'ensenso-sdk-gui')
	optdepends=(
		'ensenso-sdk-examples: for coding examples'
		'ensenso-sdk-doc: for documentation'
		'ensenso-sdk-halcon: for halcon support'
	)
}

package_ensenso-sdk-runtime() {
	depends=('glibc' 'glu' 'libsm')
	optdepends=(
		'ueyed: for capturing from live cameras'
	)

	local dir="$srcdir"

	install -Dd "$pkgdir/usr"
	install -Dd "$pkgdir/usr/lib/pkgconfig"
	install -Dd "$pkgdir/usr/include"
	install -Dd "$pkgdir/usr/share/licenses/$pkgname"

	cp -a "$dir/usr/lib" "$pkgdir/usr/"
	cp -a "$dir/opt" "$pkgdir/"
	rm -r "$pkgdir/opt/ensenso/development/examples"
	rm -r "$pkgdir/opt/ensenso/development/halcon"
	rm -r "$pkgdir/opt/ensenso/bin"

	# Re-add the CLI
	install -m 755 -Dt "$pkgdir/opt/ensenso/bin/" "$dir/opt/ensenso/bin/ensenso-cli"
	install -m 755 -Dt "$pkgdir/usr/bin"          "$srcdir/ensenso-cli"

	rm -r "$pkgdir/opt/ensenso/lib/qt5"
	rm -r "$pkgdir/opt/ensenso/manual"

	ln -s "../../opt/ensenso/development/c/include" "$pkgdir/usr/include/ensenso"
	(
		cd "$pkgdir/usr/lib/pkgconfig/"
		ln -s "../../../opt/ensenso/pkgconfig/"* ./
	)

	install -Dt "$pkgdir/usr/lib/environment.d/"       "$srcdir/90-ensenso-install.conf"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$dir/opt/ensenso/eula.txt"
}

package_ensenso-sdk-gui() {
	depends=('ensenso-sdk-runtime' 'qt5-base')

	local dir="$srcdir"

	install -Dd "$pkgdir/usr"
	install -Dd "$pkgdir/usr/bin"
	install -Dd "$pkgdir/opt/ensenso"

	cp -a "$dir/opt/ensenso/bin" "$pkgdir/opt/ensenso/"
	rm "$pkgdir/opt/ensenso/bin/ensenso-cli"

	cp -a "$dir/usr/share" "$pkgdir/usr/"

	install -Dt "$pkgdir/usr/bin" -m 755 \
		"$srcdir/ensenso-engage" \
		"$srcdir/nxCalTab" \
		"$srcdir/nxProfiler" \
		"$srcdir/nxTreeEdit" \
		"$srcdir/nxView"
}

package_ensenso-sdk-examples() {
	arch=(any)
	depends=(ensenso-sdk-runtime)

	local dir="$srcdir"
	install -Dd "$pkgdir/opt/ensenso/development"
	cp -a "$dir/opt/ensenso/development/examples" "$pkgdir/opt/ensenso/development/"
}

package_ensenso-sdk-doc() {
	arch=(any)

	local dir="$srcdir"
	install -Dd "$pkgdir/usr/share/doc"
	install -Dd "$pkgdir/opt/ensenso"

	cp -a "$dir/opt/ensenso/manual" "$pkgdir/opt/ensenso/manual"
	ln -s "/opt/ensenso/manual/html" "$pkgdir/usr/share/doc/$pkgname"
}

package_ensenso-sdk-halcon() {
	depends=(ensenso-sdk-runtime)

	local dir="$srcdir"
	install -Dd "$pkgdir/opt/ensenso/development"
	cp -a "$dir/opt/ensenso/development/halcon" "$pkgdir/opt/ensenso/development/"
}
