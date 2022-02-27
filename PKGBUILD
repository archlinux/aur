# Maintainer: Phil A. <flying-sheep@web.de>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Adrain Sinclair <adrian at adrusi dot com>
# Contributor: Miroslav Koškár <http://mkoskar.com/>
# Contributor: Florian Hülsmann <fh@cbix.de>

_name=Rack
pkgname=vcvrack
pkgver=2.1.0
pkgrel=1
pkgdesc='Open-source Eurorack modular synthesizer simulator'
url='https://vcvrack.com/'
license=(custom CCPL GPL3)
arch=(x86_64)
depends=(
	curl
	glew
	glfw
	jack
	jansson
	libpulse
	openssl
	rtaudio
	rtmidi
	speexdsp
	zenity
	zstd
)
makedepends=(git wget cmake unzip gendesk)
_submodule_deps=(nanovg nanosvg osdialog oui-blendish fuzzysearchdatabase filesystem pffft)
source=(
	"$pkgname-$pkgver::git+https://github.com/$pkgname/$_name.git#tag=v$pkgver"
	'git+https://github.com/VCVRack/nanovg.git'
	'git+https://github.com/memononen/nanosvg.git'
	'git+https://github.com/AndrewBelt/osdialog.git'
	'git+https://github.com/VCVRack/oui-blendish.git'
	'git+https://bitbucket.org/j_norberg/fuzzysearchdatabase.git'
	'git+https://github.com/gulrak/filesystem.git'
	'git+https://bitbucket.org/jpommier/pffft.git'
	"$pkgname.sh"
)
sha512sums=(
	SKIP SKIP SKIP SKIP SKIP SKIP SKIP SKIP
	'8ca3fbc790fa5d311ce41b5b9e84a79fe51db73cbf0f56f04d0429b28f0c4c0646e2d0c081b584161356ec24b06cc0181b115b865d564ff1452c64a57135acf6'
)

prepare() {
	cd "$pkgname-$pkgver"
	for M in "${_submodule_deps[@]}"; do
		git submodule init "dep/$M"
		git config "submodule.dep/$M.url" "$srcdir/$M"
		git submodule update "dep/$M"
	done

	# fix plugin.mk’s use of jq, if SLUG/VERSION are unset
	sed -e 's/SLUG :=/SLUG ?=/' \
		-e 's/VERSION :=/VERSION ?=/' \
		-i plugin.mk
	
	# add target to only build included dependencies
	echo 'includes: $(nanovg) $(nanosvg) $(osdialog) $(oui-blendish) $(fuzzysearchdatabase) $(ghcfilesystem) $(pffft)' >> dep/Makefile

	# recent changes to rtaudio.cpp require an unrelease version of rtaudio
	git checkout 6ae7fe05216950e461a27e05e8b9de53ccf8247b src/rtaudio.cpp

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
	VERSION=$pkgver make -C dep includes
	VERSION=$pkgver make LDFLAGS+="-shared \
		-lGLEW -lglfw -ljansson \
		-lcurl -lssl -lcrypto \
		-larchive -lzstd -lspeexdsp \
		-lsamplerate -lrtmidi -lrtaudio \
		-lpthread -lGL -ldl \
		-lasound -ljack \
		-lpulse -lpulse-simple"
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
