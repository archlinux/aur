# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Mamba
pkgname="${_projectname,,}"
pkgver=2.5
pkgrel=2
pkgdesc='A virtual MIDI keyboard and file player/recorder for ALSA/JACK'
arch=(x86_64 aarch64)
url="https://github.com/brummer10/$_projectname"
license=(BSD)
depends=(gcc-libs glibc cairo libx11)
makedepends=(alsa-lib fluidsynth graphite jack liblo libsigc++ libsmf xxd)
optdepends=('new-session-manager: for NSM support')
groups=(pro-audio)
source=("https://github.com/brummer10/Mamba/releases/download/v$pkgver/${_projectname}_$pkgver.tar.gz"
        'mamba-asprintf-7eb70bf.patch')
sha256sums=('4880c2fe2554843cce3dbf783adbaeae376e287daa86030c0fc5fc58f084b064'
            'b80d33fe8f228a587a02019f7a206e4494cb2d7202f7f80062f782819a1bc054')

prepare() {
  cd ${_projectname}_$pkgver/libxputty
  patch -p1 -N -r - -i "$srcdir"/mamba-asprintf-7eb70bf.patch
}

build() {
  cd ${_projectname}_$pkgver
  make
}

package() {
  depends+=(libasound.so libfluidsynth.so libjack.so liblo.so libsigc-2.0.so
            libsmf.so)
  cd ${_projectname}_$pkgver
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
