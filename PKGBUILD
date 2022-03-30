# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=lab3d-sdl
pkgver=3.0
pkgrel=2
pkgdesc="Enhanced port of Ken's Labyrinth with hi-res texture support"
arch=('i686' 'x86_64')
url="https://ktpanda.org/software/lab3d_sdl/"
license=('GPL')
depends=('sdl2_image' 'glu')
source=("http://s3.jspenguin.org/LAB3D-SDL-3.0-src.tar.gz"
        "$pkgname-datadir.patch"
        "$pkgname.sh")
sha256sums=('95351253fe9dae45c6ec95ddbcef895758720789b3076403906154b4bb4dd80f'
            'dc452ef12fe98b0838e7d2e67f44b83cf5521168d8633dd6fe6a1ebb3c620255'
            'b1bbc3e16cb5d8846144ddbc22de54fb90b2be04f9116c14727ac6e50857cd6f')

prepare() {
  # patch to change data directory
  patch -Np0 < $pkgname-datadir.patch
}

build() {
  export CFLAGS="$CFLAGS -fcommon"
  make -C LAB3D-SDL-3.0
}

package() {
  cd LAB3D-SDL-3.0

  # binary + launcher
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 ken.bin "$pkgdir"/usr/lib/$pkgname/ken.bin
  # data
  install -d "$pkgdir"/usr/share/$pkgname/hires
  install -m644 *.kzp {insts,tables}.dat wallparams.ini ken.bmp "$pkgdir"/usr/share/$pkgname
  install -m644 hires/* "$pkgdir"/usr/share/$pkgname/hires
  # docs
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 *.doc *.txt "$pkgdir"/usr/share/doc/$pkgname
}
