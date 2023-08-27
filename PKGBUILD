# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>
# Contributor: jujudusud <jujudusud gmail com>

_pkgname=FreeMajor
pkgname=${_pkgname,,}
pkgver=1.0
pkgrel=3
pkgdesc="Graphical editor for the TC Electronic G-Major guitar effect module"
arch=(x86_64 aarch64)
url='https://github.com/linuxmao-org/FreeMajor/'
license=(Boost)
depends=(glibc gcc-libs)
makedepends=(cmake alsa-lib fltk jack)
groups=(pro-audio)
source=("https://github.com/linuxmao-org/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('ce3b112520a773e105a35b6251e0867fdba2f49632911108a66e343988b66dfd')

build() {
  cmake -B $pkgname-build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -Wno-dev
  cmake --build $pkgname-build
}

package() {
  depends+=(libasound.so libfltk.so libjack.so)
  DESTDIR="$pkgdir" cmake --install $pkgname-build
  # install documentation
  install -vDm 644 $_pkgname-$pkgver/README.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
  for lang in en fr; do
    install -vDm 644 $_pkgname-$pkgver/docs/manual/$lang/manual.* \
      -t "$pkgdir"/usr/share/doc/$pkgname/manual/$lang
    install -vDm 644 $_pkgname-$pkgver/docs/manual/resources/$lang/*.png \
      -t "$pkgdir"/usr/share/doc/$pkgname/manual/resources/$lang
  done
}
