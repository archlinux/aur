# Maintainer: éclairevoyant
# Contributor: Sefa Eyeoglu <contact at scrumplex dot net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=zrythm
_pkgver=1.0.0-beta.4.8.1
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc='Highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=(AGPL3)
depends=(qt5-base gtk4 libadwaita libpanel gtksourceview5 graphviz carla-git fluidsynth vamp-plugin-sdk guile libaudec xxhash libcyaml reproc libbacktrace rubberband fftw sratom serd portaudio breeze-icons rtmidi rtaudio lsp-dsp-lib sdl2 chromaprint boost dconf libxrandr graphene libepoxy json-glib libxinerama lilv)
makedepends=(git meson cmake ruby-sass help2man sassc)
optdepends=('realtime-privileges: allow memory locking')
options=('debug')
source=("https://www.zrythm.org/releases/$pkgname-$_pkgver.tar.xz"{,.asc}
        "git+https://github.com/drobilla/zix.git")
sha256sums=('c981432f793efe1a62f6f4345dee9ef5533f4a628316de5574b745b73dcda777'
            'SKIP'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3') # Alexandros Theodotou <alex@zrythm.org>

prepare() {
	cd $pkgname-$_pkgver

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
}
