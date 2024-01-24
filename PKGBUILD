# Maintainer: éclairevoyant
# Contributor: Sefa Eyeoglu <contact at scrumplex dot net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=zrythm
_pkgver=1.0.0-beta.6.1.1
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc='Highly automated and intuitive digital audio workstation'
arch=(x86_64 i686)
url="https://www.zrythm.org"
license=(AGPL3)
depends=(
	boost
	breeze-icons
	carla-git
	chromaprint
	dconf
	fftw
	fluidsynth
	graphene
	graphviz
	gtk4-git
	gtksourceview5
	guile
	json-glib
	libadwaita
	libaudec
	libbacktrace
	libcyaml
	libepoxy
	libpanel
	lilv
	libxinerama
	libxrandr
	lsp-dsp-lib
	pcre
	portaudio
	qt5-base
	reproc
	rtaudio
	rtmidi
	rubberband
	sdl2
	serd
	sratom
	vamp-plugin-sdk
	xxhash
	yyjson-git
	zix
)
makedepends=(git meson cmake ruby-sass help2man sassc)
optdepends=('realtime-privileges: allow memory locking')
options=('debug')
source=("https://www.zrythm.org/releases/$pkgname-$_pkgver.tar.xz"{,.asc}
        "git+https://github.com/drobilla/zix.git"
        0001-gcc13-fixes.patch)
sha256sums=('150d797f95f03a304036ffdd8065f9798c1bb369753ed1378aa58fa5f0e03160'
            'SKIP'
            'SKIP'
            'bb93eea519020e491f85c38ab3901ac530bbf747c4e7acc3aaea39f402091653')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3') # Alexandros Theodotou <alex@zrythm.org>

prepare() {
	cd $pkgname-$_pkgver

	patch -Np1 -i ../0001-gcc13-fixes.patch
	# use our local clones
	sed -i "s|https://github.com/drobilla/zix|$srcdir/zix|" "subprojects/zix.wrap"
	meson subprojects download zix
}

build() {
	cd $pkgname-$_pkgver

	meson build --prefix=/usr \
		--wrap-mode nofallback \
		--force-fallback-for=zix-0 \
		-Ddebug=true \
		-Dmanpage=true \
		-Dcheck_updates=false \
		-Dcarla_binaries_dir=/usr/lib/carla \
		-Dportaudio=enabled -Drtmidi=enabled -Drtaudio=enabled -Dsdl=enabled
	ninja -C build
}

package() {
	cd $pkgname-$_pkgver

	install -vDm644 AUTHORS CONTRIBUTING.md \
		CHANGELOG.md README.md THANKS TRANSLATORS \
		-t "$pkgdir/usr/share/doc/$pkgname/"
	meson install -C build --destdir="$pkgdir"

	rm -rf "$pkgdir"{/usr/include/zix-0/,/usr/lib/pkgconfig/zix-0.pc}
}
