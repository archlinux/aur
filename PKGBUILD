# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Fluida.lv2
_plugin_uri="https://github.com/brummer10/$_name"
pkgname=${_name,,}
pkgver=0.8
pkgrel=3
pkgdesc='An LV2 plugin which wraps the fluidsynth SF2 soundfont player'
arch=(x86_64 aarch64)
url="https://github.com/brummer10/$_name"
license=(GPL2)
depends=(cairo gcc-libs glibc libx11)
makedepends=(fluidsynth lv2 xxd)
checkdepends=(lv2lint)
optdepends=('lv2-host: for loading the LV2 format plugin')
groups=(lv2-plugins pro-audio)
source=("https://github.com/brummer10/Fluida.lv2/releases/download/v$pkgver/${_name%*.lv2}_$pkgver.tar.gz"
        'libxputty-fix-asprintf.patch::https://github.com/brummer10/libxputty/commit/7eb70bf3f7bce0af9e1919d6c875cdb8efca734e.patch'
        'fluida-fix-asprintf.patch')
sha256sums=('67aa666bf68c13b3def8b47d19589a86ccd8f534aa2090d1304c6c025fe38e51'
            '15fe7e3e2ec8efe62dc9bb4c0830eaf3ed0373cd39ebd755f2d9193710ebbf76'
            'ee62982b9d8f3a713bf15e31510727a5ac36c8a1c7c4985a13ffcf7668289300')


prepare() {
  cd ${_name%*.lv2}_$pkgver
  patch -p1 -N -r - -i "$srcdir"/fluida-fix-asprintf.patch
  cd libxputty
  patch -p1 -N -r - -i "$srcdir"/libxputty-fix-asprintf.patch
}

build() {
  cd ${_name%*.lv2}_$pkgver
  make
}

check() {
  cd ${_name%*.lv2}_$pkgver
  lv2lint -Mpack -I Fluida/$_name "$_plugin_uri"
}

package() {
  depends+=(libfluidsynth.so)
  cd ${_name%*.lv2}_$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
