# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=Fluida.lv2
_plugin_uri="https://github.com/brummer10/$_name"
pkgname=${_name,,}
pkgver=0.9
pkgrel=1
pkgdesc='An LV2 plugin which wraps the fluidsynth SF2 soundfont player'
arch=(x86_64 aarch64)
url="https://github.com/brummer10/$_name"
license=(GPL2 MIT)
depends=(cairo gcc-libs glibc libx11)
makedepends=(fluidsynth lv2 xxd)
checkdepends=(lv2lint)
optdepends=('lv2-host: for loading the LV2 format plugin')
groups=(lv2-plugins pro-audio)
source=("https://github.com/brummer10/Fluida.lv2/releases/download/v$pkgver/${_name}-v$pkgver-src.tar.xz"
        'fix-ttl-28.patch::https://github.com/brummer10/Fluida.lv2/pull/28.patch'
        'lv2ui.version')
sha256sums=('caa41d37208208f28c393bbf4e98d2abb048e688c8cc7a5b28e12ea3b47efe84'
            'a5e2b7d5bb80e9712de2b8a301741eecc280f20846863227aa5405bdc4e3bb81'
            '5abe9dbb9f02b02b361f5e5393e52029cd2eae4fb4b45817ad51c8ab7a217a88')

prepare() {
  cd $_name-v$pkgver
  patch -p1 -N -r - -i "$srcdir"/fix-ttl-28.patch
}

build() {
  cd $_name-v$pkgver
  export GUI_LDFLAGS="-Wl,--version-script=$srcdir/lv2ui.version"
  make
}

check() {
  cd $_name-v$pkgver
  lv2lint -Mpack -I bin/$_name "$_plugin_uri"
}

package() {
  depends+=(libfluidsynth.so)
  cd $_name-v$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -vDm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm 644 Fluida/libscala-file/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-libscala-file
}
