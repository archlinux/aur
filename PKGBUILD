# Maintainer: Andy Alt <arch_stanton5995 [at] proton [dot] me
# Contributor: SanskritFritz (gmail)
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=boswars
pkgver=2.8
pkgrel=1
pkgdesc="Futuristic real-time strategy game"
url="http://www.boswars.org"
license=('GPL-2.0-or-later')
arch=('i686' 'x86_64')
depends=('sdl' 'libpng' 'lua51' 'libvorbis' 'libtheora' 'libgl')
makedepends=('glu' 'coreutils') # nproc is in coreutils
source=("http://www.boswars.org/dist/releases/$pkgname-$pkgver-src.tar.gz"
        "boswars.sh"
        "boswars.png"
        "boswars.desktop"
        "5cb645f8.patch")
sha256sums=('5185206990bf6765c7a5d3802ce6e6048a1087cf4c307b099a5691a3eec6b86a'
            '757b934f61d8e12825ca6a788a0802020c156fba1377582f301c599a68ca82f8'
            'f89454681f02df31f5714747563ce30c4643cda96d91b7fc29216dacf92e8b10'
            '666712c9cf7fff391e6a67f99fdc12f6fce45777ee0891a808cb2a00910c739c'
            '4c932182fb7d406711398345045b0cb53d65cc4151a4aeeaf0a7b837846c32b4')

prepare() {
  cd $pkgname-$pkgver-src
  patch -p1 < ../5cb645f8.patch
}

build() {
  cd $pkgname-$pkgver-src

  # speed up build process with parallel building
  python make.py -j $(nproc)
}

package(){
  cd $pkgname-$pkgver-src

  # data
  install -d "$pkgdir"/usr/share/boswars/languages
  install -m644 languages/*.po "$pkgdir"/usr/share/boswars/languages
  cp -r campaigns doc graphics intro maps patches scripts sounds units "$pkgdir"/usr/share/boswars/

  # binary + launcher
  install -Dm755 fbuild/release/boswars "$pkgdir"/usr/share/boswars/boswars
  install -Dm755 ../boswars.sh "$pkgdir"/usr/bin/boswars
  # .desktop entry
  install -Dm644 ../boswars.png "$pkgdir"/usr/share/pixmaps/boswars.png
  install -Dm644 ../boswars.desktop "$pkgdir"/usr/share/applications/boswars.desktop
  # license + doc
  install -d "$pkgdir"/usr/share/{licenses/$pkgname,doc}
  install -m644 COPYRIGHT.txt "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/boswars/doc "$pkgdir"/usr/share/doc/$pkgname
}
