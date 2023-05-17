# Maintainer: éclairevoyant
# Contributor: Sefa Eyeoglu <contact at scrumplex dot net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=zrythm
_pkgver=1.0.0-beta.4.9.1
pkgver="${_pkgver/-/.}"
pkgrel=1
pkgdesc='Highly automated and intuitive digital audio workstation'
arch=(x86_64 i686)
url="https://www.zrythm.org"
license=(AGPL3)
depends=(qt5-base gtk4 libadwaita libpanel gtksourceview5 graphviz carla-git fluidsynth vamp-plugin-sdk guile libaudec xxhash libcyaml reproc libbacktrace rubberband fftw sratom serd portaudio breeze-icons rtmidi rtaudio lsp-dsp-lib sdl2 chromaprint boost dconf libxrandr graphene libepoxy json-glib libxinerama lilv)
makedepends=(git meson cmake ruby-sass help2man sassc)
optdepends=('realtime-privileges: allow memory locking')
options=('debug')
source=("https://www.zrythm.org/releases/$pkgname-$_pkgver.tar.xz"{,.asc}
        "git+https://github.com/drobilla/zix.git"
        0001-gcc13-fixes.patch)
sha256sums=('0dea655ebf91826292b5e89e88b0ecd50c6958969127eecb0965137e17596d6a'
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
}
