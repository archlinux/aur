# Maintainer: Eden Rose - Contact through aur.
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=freeablo-git
pkgname_=freeablo
pkgver=0.4
pkgrel=1
pkgdesc='Modern, FLOSS reimplementation of the Diablo 1 game engine. GIT-Version *(Engine and Game Data Installer)*'
arch=('i686' 'x86_64')
url="http://freeablo.org/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'zlib' 'enet' 'bzip2' 'boost-libs' 'librocket' 'libgl' 'qt5-base')
makedepends=('cmake' 'boost')
install=$pkgname_.install
source=(freeablo-git::"git+https://github.com/wheybags/freeablo.git"
'freeablo.bin'
'freeablo.desktop'
'freeablo_icon.svg'
'diablo-files.tar.xz::https://www.dropbox.com/s/ljshg2kwdxly66s/Diablo_FreeAblo_files.tar.xz?dl=0')
sha256sums=('SKIP'
'96d7434be63aa095dc0187e3b3ec9f1c9a9169118905a65dd562f8a888a16dbb'
'95ea4757e1f373e54cf899d6bef6efcf28798e6eca30d904e3710963cdd856df'
'abdd045f931a51ddbac3ac2f5bed6564e76865dd5f57869f65bfa06779bb3869'
'a9689afd44b67d3dac281209e78dd63757511a0d9b1853273d0ed4f6d553679e')

prepare() {
  cd $srcdir
  rm -rf build
  mkdir build
  
  if [ -e $srcdir/$pkgname ]; then
  	ln -s $pkgname $pkgname_
  fi

  cd $srcdir/$pkgname
  git submodule update --init

}

build() {
  cd $srcdir/build
  ln -s $srcdir/$pkgname/resources
   
  cmake $srcdir/$pkgname
  make
  rm $srcdir/$pkgname/resources
  cp -r $srcdir/$pkgname/resources .
}

package() {
  # binaries
  install -Dm755 $srcdir/build/freeablo "$pkgdir"/usr/bin/"$pkgname_"_game
  for _f in celview exedump mpqtool launcher; do
    install -Dm755 $srcdir/build/$_f "$pkgdir"/usr/bin/"$pkgname_"-$_f
  done
  # data
  install -d "$pkgdir"/usr/share/"$pkgname_"
  install -d "$pkgdir"/usr/share/"$pkgname_"/resources
  cp -r $srcdir/build/resources "$pkgdir"/usr/share/"$pkgname_"/resources
  # doc
  install -Dm644 $srcdir/$pkgname/readme.md "$pkgdir"/usr/share/doc/"$pkgname_"/readme.md
  # shorcuts
  mkdir -p "$pkgdir"/usr/share/applications
  install -m755 freeablo.desktop "$pkgdir"/usr/share/applications
  #### I(Eden) Created this Icon. It is LICENSED(GPL).
  mkdir -p "$pkgdir"/usr/share/icons
  install -m755 freeablo_icon.svg "$pkgdir"/usr/share/icons
  #install -m755 freeablo_icon.png "$pkgdir"/usr/share/icons
  #install -m755 freeablo_icon.xcf "$pkgdir"/usr/share/"$pkgname_"
  install -Dm755 freeablo.bin "$pkgdir"/usr/bin/freeablo
  #### NOTE: DIABLO 1, is ABANDONWARE. Please NOTE: This Game is still licensed by Blizzard. Please ...
  #### Support future Releases.
  
  install -m755 "$srcdir"/'Diablo-files'/Diabdat.mpq "$pkgdir"/usr/share/freeablo/resources/DIABDAT.MPQ
  install -m755 "$srcdir"/'Diablo-files'/Diablo.exe "$pkgdir"/usr/share/freeablo/resources/Diablo.exe
  
}
