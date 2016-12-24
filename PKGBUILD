# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgbase=pokemini
pkgname=(pokemini-common pokemini-sdl2 pokemini-gtk)
pkgver=0.60
_verhash=7ac1d267b209
pkgrel=1
pkgdesc='Portable emulator and tools for Pokémon-Mini'
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/pokemini/"
license=('GPL3')
makedepends=('git' 'gtk2' 'sdl' 'sdl2' 'openal' 'freeimage' 'zlib')
source=(pokemini::"git+http://git.code.sf.net/p/pokemini/code#commit=$_verhash"
        "pokemini_colormapper.desktop"
        "pokemini_debugger.desktop"
        "x-pokemon-mini.xml"
        "x-pokemon-mini-color.xml")
sha256sums=('SKIP'
            'cdd14a6525bc37473d51c9e03765599d7d80f4b7e1d251bc93063891a97c021e'
            'd30110117f349c8242323a228168232f4e58e22d0c072d05480c530d04dc84d7'
            '0ad8eb2c4c2907422c6c1fde9298c3d0b44baf47dead52b2d1b9238976685acb'
            '33e49ce6ba8851c1dd2abdcff19e531b0667877b20cf7b151fd2e87fce7c3a9f')

build() {
  cd pokemini

  # gtk+sdl version with debugger
  make -C platform/debug
  # sdl2 version
  make -C platform/sdl2
  # tools
  #make -C tools/color_mapper
  make -C tools/imgconv
  make -C tools/musicconv
}

package_pokemini-common() {
  pkgdesc+=' - common files and tools'
  depends=('openal' 'freeimage' 'zlib' 'hicolor-icon-theme')

  cd pokemini

  # rom associations
  install -d "$pkgdir"/usr/share/mime/packages
  install -m644 ../x-pokemon-mini{,-color}.xml "$pkgdir"/usr/share/mime/packages
  cd dev-misc/associateMin
  install -d "$pkgdir"/usr/share/icons/hicolor/{16x16,32x32}/apps
  install -m644 min16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/application-x-pokemon-mini.png
  install -m644 minc16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/application-x-pokemon-mini-color.png
  install -m644 min32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/application-x-pokemon-mini.png
  install -m644 minc32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/application-x-pokemon-mini-color.png
  cd ..

  # examples
  install -d "$pkgdir"/usr/share/pokemini
  cp -rup examples "$pkgdir"/usr/share/pokemini
  cd ..

  # tools
  cd tools
  install -d "$pkgdir"/usr/bin
  #install -m755 color_mappper/colormapper "$pkgdir"/usr/bin/pokemini_colormapper
  #install -Dm644 ../../pokemini_colormapper.desktop "$pkgdir"/usr/share/applications/pokemini_colormapper.desktop
  install -m755 imgconv/pokemini_imgconv musicconv/pokemini_musicconv "$pkgdir"/usr/bin
  cd ..

  # doc
  install -d "$pkgdir"/usr/share/doc/pokemini/html
  install -m644 *.txt tools/*.txt "$pkgdir"/usr/share/doc/pokemini
  install -m644 doc/* "$pkgdir"/usr/share/doc/pokemini/html
}

package_pokemini-sdl2() {
  pkgdesc+=' - command line emulator'
  depends=('sdl2' 'pokemini-common')

  install -Dm755 pokemini/platform/sdl2/PokeMini "$pkgdir"/usr/bin/PokeMini
}

package_pokemini-gtk() {
  pkgdesc+=' - GTK+ Debugger'
  depends=('gtk2' 'sdl' 'pokemini-common')

  install -Dm755 pokemini/platform/debug/PokeMiniD "$pkgdir"/usr/bin/PokeMiniD

  # .desktop integration
  install -Dm644 pokemini_debugger.desktop "$pkgdir"/usr/share/applications/pokemini_debugger.desktop
  cd pokemini/dev-misc/associateMin
  install -d "$pkgdir"/usr/share/icons/hicolor/{16x16,32x32}/apps
  install -m644 pokemini16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/pokemini_debugger.png
  install -m644 pokemini32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/pokemini_debugger.png
}

