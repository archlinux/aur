# Maintainer: Phil A. <flying-sheep@web.de>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Adrain Sinclair <adrian at adrusi dot com>
# Contributor: Miroslav Koškár <http://mkoskar.com/>

_name=Rack
pkgname=vcvrack
pkgver=2.0.6
pkgrel=1
pkgdesc='Open-source Eurorack modular synthesizer simulator'
url='https://vcvrack.com/'
license=(custom CCPL GPL3)
arch=(x86_64)
# TODO: devendor fonts and commented out libs
depends=(
	#curl
	glew
	glfw
	#gtk3
	jack
	#jansson
	libpulse
	libx11
	libxcursor
	libxinerama
	libxrandr
	#libzip
	#openssl
	#rtaudio
	#rtmidi
	#speexdsp
)
makedepends=(git wget cmake unzip gendesk)
source=(
	"$pkgname-$pkgver::git+https://github.com/$pkgname/$_name.git#tag=v$pkgver"
	'git+https://github.com/VCVRack/nanovg.git#commit=0bebdb314aff9cfa28fde4744bcb037a2b3fd756'
	'git+https://github.com/memononen/nanosvg.git#commit=25241c5a8f8451d41ab1b02ab2d865b01600d949'
	'git+https://github.com/AndrewBelt/osdialog.git#commit=21b9dcc2a1bbdacb9b46da477ffd82a4ce9204b9'
	'git+https://github.com/VCVRack/oui-blendish.git#commit=2fc6405883f8451944ed080547d073c8f9f31898'
	'git+https://github.com/VCVRack/rtaudio.git#commit=8128053f4bd83463c7c901d9f5d40b272c2f4e4e'
	'git+https://github.com/VCVRack/glfw.git#commit=0e18076016f4ba57c314eeebd85654c70644abe3'
	'git+https://bitbucket.org/j_norberg/fuzzysearchdatabase.git#commit=fe62479811e503ef3c091f5a859d27bfcf0a44da'
	'git+https://github.com/gulrak/filesystem.git#commit=7e37433f318488ae4bc80f80e12df12a01579874'
	'git+https://bitbucket.org/jpommier/pffft.git#commit=74d7261be17cf659d5930d4830609406bd7553e3'
	"$pkgname.sh"
)
sha512sums=(
	SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
	'8ca3fbc790fa5d311ce41b5b9e84a79fe51db73cbf0f56f04d0429b28f0c4c0646e2d0c081b584161356ec24b06cc0181b115b865d564ff1452c64a57135acf6'
)

prepare() {
	cd "$pkgname-$pkgver"
	git submodule init
	git config submodule.dep/nanovg.url "$srcdir/nanovg"
	git config submodule.dep/nanosvg.url "$srcdir/nanosvg"
	git config submodule.dep/osdialog.url "$srcdir/osdialog"
	git config submodule.dep/oui-blendish.url "$srcdir/oui-blendish"
	git config submodule.dep/rtaudio.url "$srcdir/rtaudio"
	git config submodule.dep/glfw.url "$srcdir/glfw"
	git config submodule.dep/fuzzysearchdatabase.url "$srcdir/fuzzysearchdatabase"
	git config submodule.dep/filesystem.url "$srcdir/filesystem"
	git config submodule.dep/pffft.url "$srcdir/pffft"
	git submodule update

	# fix plugin.mk’s use of jq, if SLUG/VERSION are unset
	sed -e 's/SLUG :=/SLUG ?=/' \
		-e 's/VERSION :=/VERSION ?=/' \
		-i plugin.mk

	gendesk -f -n \
		--pkgname "$pkgname" \
		--name "VCV $_name" \
		--exec "$_name" \
		--pkgdesc "$pkgdesc" \
		--genericname "Virtual modular synthesizer" \
		--categories "AudioVideo;Audio"
}

build() {
	cd "$pkgname-$pkgver"
	VERSION=$pkgver make dep
	ERSION=$pkgver make
}

package() {
	cd "$pkgname-$pkgver"
	install -vDm 755 "$_name" -t "$pkgdir/opt/$pkgname"
	install -vDm 755 "lib$_name.so" -t "$pkgdir/opt/$pkgname"
	install -vDm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$_name"
	install -vDm 644 -t "$pkgdir/opt/$pkgname" template.vcv
	install -vDm 644 -t "$pkgdir/opt/$pkgname" Core.json
	install -vDm 644 -t "$pkgdir/opt/$pkgname" cacert.pem

	# resources
	cp -dr --preserve=mode res -t "$pkgdir/opt/$pkgname"

	# headers (required for plugins)
	for _path in {app,dsp,engine,plugin,simd,ui,widget,window}; do
		install -vDm 644 "include/$_path/"* \
			-t "$pkgdir/usr/include/$pkgname/$_path/"
	done
	install -vDm 644 include/*.{h,hpp} -t "$pkgdir/usr/include/$pkgname/"
	install -vDm 644 dep/include/*.h -t "$pkgdir/usr/include/$pkgname/dep"
	# Makefile snippets required for plugins
	install -vDm 644 {arch,compile,dep,plugin}.mk -t "$pkgdir/usr/share/$pkgname"

	# xdg desktop integration
	install -vDm 644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -vDm 644 'res/icon.png' "$pkgdir/usr/share/pixmaps/$pkgname.png"
	# licenses
	install -vDm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
