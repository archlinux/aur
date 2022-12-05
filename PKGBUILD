# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=zrythm
_pkgver=1.0.0-beta.3.5.1
pkgver=${_pkgver/-/.}
pkgrel=3
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('gtk4' 'libadwaita' 'libpanel' 'gtksourceview5' 'graphviz' 'carla' 'fluidsynth' 'vamp-plugin-sdk' 'guile' 'libaudec' 'xxhash' 'libcyaml' 'reproc' 'libbacktrace' 'rubberband' 'fftw' 'sratom' 'serd' 'portaudio' 'breeze-icons' 'rtmidi' 'rtaudio' 'lsp-dsp-lib' 'sdl2' 'chromaprint' 'boost' 'dconf' 'libxrandr' 'graphene' 'libepoxy' 'json-glib' 'libxinerama' 'lilv')
makedepends=('git' 'meson' 'cmake' 'ruby-sass' 'help2man' 'sassc')
optdepends=('realtime-privileges: allow memory locking')
conflicts=('zrythm-git')
options=('debug')
source=("https://www.zrythm.org/releases/$pkgname-$_pkgver.tar.xz"{,.asc}
        "0001-fix-missing-stdbool-include.patch"
        "0002-fix-missing-stdbool-include-2.patch"
        "git+https://github.com/drobilla/zix.git")
sha256sums=('aec7667c7bd886df4acf8e10648637bdd68bd94cb74642128ead8a1d48e34d90'
            'SKIP'
            '43489490659564908bd42c3b3c5fec93996e773e21b7ccc74eb4a3fd05fbcb29'
            'fd3e5ac9775033938d25635cc8a55c42660e45d71ceb50047e302716633654d3'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')


prepare() {
  cd "$pkgname-$_pkgver"

  # use our local clones
  sed -i "s|https://github.com/drobilla/zix|$srcdir/zix|" "subprojects/zix.wrap"
  meson subprojects download zix

  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 -i "../$src"
  done
}

build() {
  cd "$pkgname-$_pkgver"

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
  cd "$pkgname-$_pkgver"

  install -vDm 644 AUTHORS CONTRIBUTING.md \
    CHANGELOG.md README.md THANKS TRANSLATORS \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  meson install -C build --destdir="$pkgdir"
}
