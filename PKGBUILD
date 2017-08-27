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
'https://www.dropbox.com/s/vwgykhaeexyaap7/diablo_windows_0g1w.tar.xz?dl=0')
sha256sums=('SKIP'
'f2e18160b2ae42c14795d33c4c84d4dfe1234d96f08c4878cd2a53f8ffb96f1b'
'95ea4757e1f373e54cf899d6bef6efcf28798e6eca30d904e3710963cdd856df'
'abdd045f931a51ddbac3ac2f5bed6564e76865dd5f57869f65bfa06779bb3869'
'09b34d487656ad783f02c72e5e129e0785286bdd049120057b941cc07709c07d')

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
}

package() {
  # binaries
  install -Dm755 $srcdir/build/freeablo "$pkgdir"/usr/bin/"$pkgname_"_game
  for _f in celview exedump mpqtool launcher; do
    install -Dm755 $srcdir/build/$_f "$pkgdir"/usr/bin/"$pkgname_"-$_f
  done
  # data
  install -d "$pkgdir"/usr/share/"$pkgname_"
  cp -r $srcdir/build/resources "$pkgdir"/usr/share/"$pkgname_"
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
  
  install -m755 "$srcdir"/'Diablo - RIP'/Diabdat.mpq "$pkgdir"/usr/share/freeablo/resources/DIABDAT.MPQ
  install -m755 "$srcdir"/'Diablo - RIP'/Diablo.exe "$pkgdir"/usr/share/freeablo/resources/Diablo.exe
  
}
