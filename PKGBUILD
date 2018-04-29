# Maintainer:

pkgname=megamario
pkgver=1.7
pkgrel=3
pkgdesc="A Super Mario Bros. clone"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/mmario"
license=('LGPL')
depends=('sdl_ttf' 'sdl_image' 'sdl_mixer' 'mesa')
makedepends=('glu')
source=("https://downloads.sourceforge.net/mmario/MegaMario_v${pkgver}_full.zip"
        "megamario-1.7-fix-compile-error.patch"
        "megamario-1.7-fix-mp3-path.patch"
        "megamario-1.7-fix-logfile-path.patch"
        "megamario-1.7-makefile-compiler-flags.patch")
noextract=("MegaMario_v${pkgver}_full.zip")
sha256sums=('243ebf03cb1e5c5e7cead48d9a988ffb9a1c94f9427f71ea559ad047486c9e72'
            '2665b31e5014868a4df71f4e0565dac4c50b703f9d539be8ee1d24688fdde070'
            'ff1286986ca125b888802e205f5291e3a30ccd15433744e9fa18fd1ec0ee9e2f'
            '02361dd4bc005d13d6010d42179b1aaa3d4ea6bd8a02f47ddf8b10ea4215bd34'
            'cdce4ab90a3050f4b4ccb772894814d6f4f2dffe3afbe3d4687e5816fe854e82')

prepare() {
  mkdir -p $pkgname-$pkgver
  bsdtar -xf MegaMario_v${pkgver}_full.zip -C $pkgname-$pkgver
  cd $pkgname-$pkgver

  patch -p0 -i ../megamario-1.7-fix-compile-error.patch
  patch -p0 -i ../megamario-1.7-fix-mp3-path.patch
  patch -p0 -i ../megamario-1.7-fix-logfile-path.patch
  patch -p0 -i ../megamario-1.7-makefile-compiler-flags.patch
}

build() {
  cd $pkgname-$pkgver

  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver

  make PREFIX="$pkgdir"/usr install
  cp -r mp3music "$pkgdir"/usr/share/megamario
  install -Dm644 megamario.desktop "$pkgdir"/usr/share/applications/megamario.desktop
  install -Dm644 megamario.png "$pkgdir"/usr/share/pixmaps/megamario.png
  install -m644 CONTROLS.txt readme.txt "$pkgdir"/usr/share/megamario
}
