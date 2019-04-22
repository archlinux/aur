pkgname=gog-heroes-of-might-and-magic-3-complete-edition
pkgver=4.0.28740
pkgrel=1
_gamename=${pkgname#gog-}
_gamename=${_gamename//-/_}
_gamehdpatchname="HoMM3%20HD%20Latest.exe"

pkgdesc="Heroes of Might & Magic III and its expansions: Armageddon's Blade and The Shadow of Death (with optional HD patch)"
arch=("i686" "x86_64")
url="https://www.gog.com/game/heroes_of_might_and_magic_3_complete_edition"
license=("custom")
groups=("games")

source=("setup_homm3_complete_${pkgver}.exe::gogdownloader://${_gamename}/en1installer0"
        "setup_homm3_complete_${pkgver}-1.bin::gogdownloader://${_gamename}/en1installer1"
        # "http://h3hota.com/HD/HoMM3%20HD%20Latest.exe"
        "${pkgname}.desktop"
        "${pkgname}-campaign-editor.desktop"
        "${pkgname}-map-editor.desktop"
        "${pkgname}"
        "${pkgname}-campaign-editor"
        "${pkgname}-map-editor"
        "${pkgname}.install")
sha256sums=('eaf75707911b16850ec770a551c59e594abba60c7a879fb0c171fc442b1299b3'
            '044f62c74067188ec0e52fb0db460109bcd23951acb9cfd424267a22c0f0d4f1'
            # 'SKIP'
            'ab14524f06cb213ee0b1e5bcd5d9089da9e66057794430347d32a60a86a945fd'
            'de064d9bc819403dc5990fd70d81c88d63d708ba5b4e02015cc616e77338c478'
            '4dc5f7d1bd44405dae2969ec093ef6ce680aec889024b68350023feb4a12ee1b'
            '4cbc70b50d94497294f6208dc91e0c3a8da2d494b0d1e02d0929ffc3924e4569'
            '1c780da9550edf46168b44dca34b68a8159e3083f8960b5443721bfad3d87a06'
            '14927c0c59520861fd8a00d05f4b9fbcc70a71ff669add852ba0f5c670f8556a'
            '493ef7009c2f4d103ed5b283fcc5dd900ff13cfb1d494052227bf7760fe0f7c7')
depends=(wine unionfs-fuse util-linux)
makedepends=(icoutils)

# Register lgogdownloader as a download agent
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

makedepends=("lgogdownloader>=2.25")

build() {
  export WINEDEBUG=-all
  export WINEPREFIX="$srcdir"/tmp/env
  export XDG_DATA_HOME="$srcdir"/tmp/local

  install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local

  msg "Running GOG installer"
  wine "${srcdir}/setup_homm3_complete_${pkgver}.exe" /LOG=$(tty) /Dir="${srcdir}/${pkgname#gog-}" /NoIcons=0 /verysilent # /LANG=english /?

  # msg "Installing HD patch"
  # wine "${srcdir}/${_gamehdpatchname}" /verysilent

  msg "Extracting HKEY_LOCAL_MACHINE registry"
  regedit -e ${srcdir}/local_machine.reg "HKEY_LOCAL_MACHINE\Software\New World Computing"
  sed -i 's,C:\\\\GOG Games\\\\homm 3 complete,Z:\\\\opt\\\\gog\\\\homm 3 complete,g' local_machine.reg

  msg "Generating Icons"
  mkdir -p "${srcdir}"/icons
  wrestool -x -t14 -o "${srcdir}"/icons "${srcdir}/${pkgname#gog-}/"{Heroes3,h3maped,h3ccmped}.exe
  icotool -x -o "${srcdir}"/icons "${srcdir}"/icons/*.ico
}

package() {
  # Install registry configuration
  install -Dm644 ${srcdir}/local_machine.reg ${pkgdir}/usr/share/${pkgname}/local_machine.reg

  # Install license
  install -Dm644 "${srcdir}/${pkgname#gog-}/EULA.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  # Install game
  install -m755 -d "${pkgdir}"/opt/gog/
  # mv instead of cp to save disk space
  mv ${srcdir}/${pkgname#gog-} ${pkgdir}/opt/gog/${pkgname#gog-}
  # Remove unneeded files
  rm -rf ${pkgdir}/opt/gog/${pkgname#gog-}/unins*
  rm -rf ${pkgdir}/opt/gog/${pkgname#gog-}/*.lnk
  
  # Install .desktop file and icons
  install -Dm644 "${srcdir}/${pkgname}.desktop"                  ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 "${srcdir}/${pkgname}-map-editor.desktop"       ${pkgdir}/usr/share/applications/${pkgname}-map-editor.desktop
  install -Dm644 "${srcdir}/${pkgname}-campaign-editor.desktop"  ${pkgdir}/usr/share/applications/${pkgname}-campaign-editor.desktop

  for res in 16 32 48
  do
    install -Dm644 ${srcdir}/icons/Heroes3.exe*${res}x${res}x8.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png
    install -Dm644 ${srcdir}/icons/h3maped.exe*${res}x${res}x8.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}-map-editor.png
    install -Dm644 ${srcdir}/icons/h3ccmped.exe*${res}x${res}x8.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}-campaign-editor.png
  done
  
  # Install startup scripts
  install -m755 -d ${pkgdir}/usr/bin
  for file in ${pkgname} ${pkgname}-map-editor ${pkgname}-campaign-editor
  do
    install -m755 ${srcdir}/${file} ${pkgdir}/usr/bin
  done
}

# vim:set ts=2 sw=2 et:
