# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=lab3d-sdl
pkgver=3.0
pkgrel=1
pkgdesc="Enhanced port of Ken's Labyrinth with hi-res texture support"
arch=('i686' 'x86_64')
url="http://www.jspenguin.org/software/lab3d_sdl/"
license=('GPL')
depends=('sdl2_image' 'glu')
source=("http://s3.jspenguin.org/LAB3D-SDL-3.0-src.tar.gz"
        "$pkgname-datadir.patch"
        "$pkgname.sh")
sha256sums=('9b358dc75054e34c19e442a6af389415b1a2ae06780a1e6b11364467f40a5daf'
            '03de7ab26787eb64af0e20d00effe79efd924e6395923f58c797a3f725550f88'
            'bf15793b64711138c0eb23591b93d82df7fb41aed8bceb0d90c8b2a705d0ff73')

prepare() {
  # patch to change data directory
  patch -Np0 < $pkgname-datadir.patch
  sed 's|hires/|/usr/share/lab3d-sdl/&|' -i LAB3D-SDL-3.0/wallparams.ini
}

build() {
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
