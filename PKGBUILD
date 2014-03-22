# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=boswars
pkgver=2.7
pkgrel=4
pkgdesc="Futuristic real-time strategy game"
url="http://www.boswars.org"
license=('GPL')
arch=('i686' 'x86_64')
depends=('sdl' 'libpng' 'lua51' 'libvorbis' 'libtheora' 'libgl' 'python2')
makedepends=('glu' 'coreutils') # nproc is in coreutils
source=("http://www.boswars.org/dist/releases/$pkgname-$pkgver-src.tar.gz"
        "boswars.sh"
        "boswars.png"
        "boswars.desktop")
sha256sums=('dc3718f531e9ea413cf37e1333b62a4c5e69f1405502d9c59b9e424635135e3e'
            '8f90601f1aedee2d2b097b3a47200013ec61639ca3dd6c8936dfc733eb5dc634'
            'f89454681f02df31f5714747563ce30c4643cda96d91b7fc29216dacf92e8b10'
            '666712c9cf7fff391e6a67f99fdc12f6fce45777ee0891a808cb2a00910c739c')

prepare() {
  cd $pkgname-$pkgver-src

  # use python2 in doc generator scripts
  sed 's|env python$|&2|' -i doc/scripts/*.py
  # fix 'zlib too far back error' of png images (needed for libpng>=1.6)
  msg2 "Fixing PNG images…"
  for _f in {maps/antarticum.map/terrain,graphics/ui/ui_*,units/{radar/*,tree*/tree0?}}.png
  do
    pngfix -e -w --out=$_f.fixed $_f || : # ignore exit code
    mv $_f.fixed $_f
  done
}

build() {
  cd $pkgname-$pkgver-src

  # speed up build process with parallel building
  python2 make.py -j $(nproc)
}

package(){
  cd $pkgname-$pkgver-src

  # data
  install -d "$pkgdir"/opt/bos/languages
  install -m644 languages/*.po "$pkgdir"/opt/bos/languages
  cp -r campaigns doc graphics intro maps scripts sounds units "$pkgdir"/opt/bos

  # executable, launcher and .desktop entry
  install -Dm755 fbuild/release/boswars "$pkgdir"/opt/bos/boswars
  install -Dm755 ../boswars.sh "$pkgdir"/usr/bin/boswars
  install -Dm644 ../boswars.png "$pkgdir"/usr/share/pixmaps/boswars.png
  install -Dm644 ../boswars.desktop "$pkgdir"/usr/share/applications/boswars.desktop
}
