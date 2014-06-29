# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=gigalomania
pkgver=0.26
pkgrel=1
pkgdesc="2D real time strategy game that is a clone of Mega-Lo-Mania"
arch=('i686' 'x86_64')
url="http://homepage.ntlworld.com/mark.harman/comp_gigalomania.html"
license=('GPL')
depends=('sdl' 'sdl_image' 'sdl_mixer')
source=(http://launchpad.net/gigalomania/trunk/${pkgver}/+download/gigalomaniasrc.zip)
md5sums=('d537c8206e85a02750253243b592f422')
sha256sums=('8912b12aa6397f396954c6b742a1842f6bc671a60c843975b341fc22d3211ecf')
sha384sums=('d59627a15d6f4e5eca81e86b4c62fb5e8b0534a694c26571b951c5b4b976bfded9fea4268ac8028d5840f9bffd427b8a')
sha512sums=('e956c7f6b5a05db238959f879f8f043c07d1a51300a23992290c1561d3e4904cf106fa55e1230ebfea86acd9e8def3ccd4dfb0045bb1bbfc9b0e8be822951e85')

build() {
  cd ${srcdir}/${pkgname}src

  # patch data directories
  sed 's#gfx/#/usr/share/gigalomania/gfx/#' -i game.cpp
  sed 's#sound/#/usr/share/gigalomania/sound/#' -i game.cpp
  sed 's#maps_dirname = "islands";#maps_dirname = "/usr/share/gigalomania/islands";#' -i game.cpp

  # don't create log file as they would be placed in cwd
  sed 's#\"log.txt\"#\"/dev/null"#' -i utils.cpp
  sed 's#\"log_old.txt\"#\"/dev/null"#' -i utils.cpp

  # use "stat" instead of "access" to determine if a file exists
  sed 's#access#stat#g' -i utils.cpp

  # patch .desktop files
  sed 's#/opt/gigalomania/gigalomania#/usr/bin/gigalomania#g' -i gigalomania.desktop
  sed 's#/opt/gigalomania/#/usr/share/gigalomania/#g' -i gigalomania.desktop
  sed 's#/opt/gigalomania/gigalomania#/usr/bin/gigalomania#g' -i gigalomania_fullscreen.desktop
  sed 's#/opt/gigalomania/#/usr/share/gigalomania/#g' -i gigalomania_fullscreen.desktop

  # use the svg icon
  sed 's#gigalomania64#gigalomania#g' -i gigalomania.desktop
  sed 's#gigalomania64#gigalomania#g' -i gigalomania_fullscreen.desktop

  make
}

package() {
  cd "${srcdir}/${pkgname}src"

  # install the executable
  install -Dm 755 gigalomania "${pkgdir}/usr/bin/gigalomania"

  # create the mods and maps directory
  install -dm755 "${pkgdir}/usr/share/gigalomania/gfx"
  install -dm755 "${pkgdir}/usr/share/gigalomania/islands"
  install -dm755 "${pkgdir}/usr/share/gigalomania/sound"

  # install the data files
  install -Dm644 gfx/* "${pkgdir}/usr/share/gigalomania/gfx/"
  install -Dm644 islands/* "${pkgdir}/usr/share/gigalomania/islands/"
  install -Dm644 sound/* "${pkgdir}/usr/share/gigalomania/sound/"

  # install .desktop
  install -Dm 644 gigalomania.desktop "${pkgdir}/usr/share/applications/gigalomania.desktop"
  install -Dm 644 gigalomania_fullscreen.desktop "${pkgdir}/usr/share/applications/gigalomania_fullscreen.desktop"

  # install icon
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
  install -Dm 644 gigalomania64.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/gigalomania.png"
  install -dm755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  install -Dm 644 gigalomania.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}

