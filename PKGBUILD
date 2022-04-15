# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Alexandros Theodotou <alex at zrythm dot org>

pkgname=zrythm
_pkgver=1.0.0-beta.1.5.1
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc='a highly automated and intuitive digital audio workstation'
arch=('x86_64' 'i686')
url="https://www.zrythm.org"
license=('AGPL3')
depends=('gtk4' 'graphviz' 'carla' 'fluidsynth' 'vamp-plugin-sdk' 'guile' 'libaudec' 'xxhash' 'libcyaml' 'libadwaita' 'reproc' 'libbacktrace' 'rubberband' 'gtksourceview5' 'fftw' 'sratom' 'serd' 'portaudio' 'breeze-icons' 'rtmidi' 'rtaudio' 'lsp-dsp-lib' 'sdl2' 'chromaprint' 'boost')
makedepends=('meson' 'cmake' 'ruby-sass' 'help2man' 'sassc')
optdepends=('realtime-privileges: allow memory locking')
conflicts=('zrythm-git')
options=('debug')
source=("https://www.zrythm.org/releases/$pkgname-$_pkgver.tar.xz"{,.asc})
sha256sums=('1594b23cbd842f494acce50dd6cd22a0fa45a9e6f90d0d2d402aa97dcb0a2cc0'
            'SKIP')
validpgpkeys=('48132384AD3DF7D86E254B83022EAE42313D70F3')


prepare() {
  cd "$pkgname-$_pkgver"

  rm -r subprojects
}

build() {
  cd "$pkgname-$_pkgver"

  # TODO: tests
  meson build --prefix=/usr \
    -Doptimization=3 -Ddebug=true \
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
  DESTDIR="${pkgdir}/" ninja -C build install
}
