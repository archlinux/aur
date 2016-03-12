# Maintainer: Joermungand <joermungand at gmail dot com>
pkgname=safeplugins-git
pkgver=r111.f210498
pkgrel=1
pkgdesc="Semantic Audio Feature Extraction VST plugins"
arch=('i686' 'x86_64')
url="http://www.semanticaudio.co.uk"
license=('GPL3')
depends=('libglvnd' 'curl' 'freetype2' 'libxtract')
makedepends=('git' 'steinberg-vst36')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}"::'git://github.com/semanticaudio/SAFE.git'
		'https://github.com/semanticaudio/SAFE/releases/download/v1.3/SAFE_User_Manual.pdf')
md5sums=('SKIP'
		 'ac13d8d27c8a77f7baed3cface61b1f7')

pkgver() {
	cd "$srcdir/${pkgname%-*}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-*}"
	sed -i 's/public.sdk\/source\/vst2.x/vst36/' JuceModules/juce_audio_plugin_client/VST/juce_VST_Wrapper.cpp
}

build() {
	cd "$srcdir/${pkgname%-*}"
	for plugin in Compressor Distortion Equaliser Reverb; do
		cd "SAFE$plugin/Builds/Linux"
		sed -i 's/\/usr\/local\/lib\/libxtract.a/-lxtract/' Makefile
		make CONFIG=Release
		cd "$srcdir/${pkgname%-*}"
	done
}

package() {
	cd "$srcdir/${pkgname%-*}"
	for plugin in Compressor Distortion Equaliser Reverb; do
		cd "SAFE$plugin/Builds/Linux/build"
		install -Dm755 "SAFE$plugin.so" "$pkgdir/usr/lib/vst/SAFE$plugin.so"
		cd "$srcdir/${pkgname%-*}"
	done
	install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-*}/README"
	install -Dm644 ../SAFE_User_Manual.pdf "$pkgdir/usr/share/doc/${pkgname%-*}/SAFE_User_Manual.pdf"
}
