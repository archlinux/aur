# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=zrythm
_pkgver=1.0.0-beta.3.4.1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('gtk4' 'gtksourceview5' 'graphviz' 'carla' 'fluidsynth' 'vamp-plugin-sdk' 'guile' 'libaudec' 'xxhash' 'libcyaml' 'reproc' 'libbacktrace' 'rubberband' 'fftw' 'sratom' 'serd' 'portaudio' 'breeze-icons' 'rtmidi' 'rtaudio' 'lsp-dsp-lib' 'sdl2' 'chromaprint' 'boost' 'dconf' 'libxrandr' 'graphene' 'libepoxy' 'json-glib' 'libxinerama' 'lilv')
makedepends=('git' 'meson' 'cmake' 'ruby-sass' 'help2man' 'sassc')
optdepends=('realtime-privileges: allow memory locking')
conflicts=('zrythm-git' 'libadwaita' 'libpanel')  # TODO: statically link?
options=('debug')
source=("https://www.zrythm.org/releases/$pkgname-$_pkgver.tar.xz"{,.asc}
        "git+https://gitlab.gnome.org/GNOME/libadwaita.git"
        "git+https://gitlab.gnome.org/GNOME/libpanel.git"
        "git+https://github.com/drobilla/zix.git")
sha256sums=('c928eeb5a3010e49164fd6e858d0a8b1c1210e00a3c3d1b817cde5b7c1944505'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')


prepare() {
  cd "$pkgname-$_pkgver"

  # use our local clones
  sed -i "s|https://gitlab.gnome.org/GNOME/libadwaita|$srcdir/libadwaita|" "subprojects/libadwaita.wrap"
  sed -i "s|https://gitlab.gnome.org/GNOME/libpanel|$srcdir/libpanel|" "subprojects/libpanel.wrap"
  sed -i "s|https://github.com/drobilla/zix|$srcdir/zix|" "subprojects/zix.wrap"
  meson subprojects download libadwaita libpanel zix
}

build() {
  cd "$pkgname-$_pkgver"

  # TODO: static link everything, gtk4 as well
  meson build --prefix=/usr \
    --wrap-mode nofallback \
    --force-fallback-for=libpanel-1,libadwaita-1,zix-0 \
    -Ddebug=true \
    -Dmanpage=true \
    -Dcheck_updates=false \
    -Dportaudio=enabled -Drtmidi=enabled -Drtaudio=enabled -Dsdl=enabled
  ninja -C build
}

package() {
  cd "$pkgname-$_pkgver"

  install -vDm 644 AUTHORS CONTRIBUTING.md \
    CHANGELOG.md README.md THANKS TRANSLATORS \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  meson install -C build --destdir="$pkgdir"
}
