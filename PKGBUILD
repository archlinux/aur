# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgbase=ensenso-sdk
pkgname=(ensenso-sdk ensenso-sdk-runtime ensenso-sdk-gui ensenso-sdk-doc ensenso-sdk-examples ensenso-sdk-halcon)
pkgdesc="Ensenso SDK and tools"
pkgver=4.3.991
pkgrel=2
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
            '5964849edd1bcd4c9aec3b5ec6d434d1be83f0205c848792c0b13284b8b2fe2a90d0468fd5927ca9ff857438b34597e146d8fccef56943bcc4c47637bd390388'
            'cdab79891ef802f77b5b9824355326fbd8153db7253a353e10e7bb374fea84f28e1212eb202a1939e5db8bf8f28290ea204c5308adfe0d1704f8bc3fabdbef7e'
            '4897d24c2f6caf9bf451677b890aeb5f5406c1f12b21e524cbbc5bfed1e261f69bf3546fc97f3c99b9151828e0194d8ff3b33d9b3f131cb60b955f1393a4d621'
            '83cfaab80ee78e0766028745c3802c805efc0379b8bc5492d890c8c71d4099462237ce7cf658ab9cf6a7b02bbbd91e2ddc0a0d88a3e0a9bc00960e0628c53a82'
            'baf9b8845f34c3035440331bfbe5d42dac1539f6d120949fe68e2d0c68ca6820768ff66a4b9b4848b44123564b4beb976c60c07bd245c27226c48c5e7c825618'
            '7b257632e044f75cbbf44adabeea42be225fbdc1a98bf7f4127c9780b8e9fa2fbbe245044921d02c7d2d38cf9ea927bf141ffabd0bd2ffaf9ce8d0cb7c27d9a9')

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
