pkgname=gog-heroes-of-might-and-magic-3-complete-edition
pkgver=2.0.1.17
pkgrel=3
_gamename=${pkgname#gog-}
_gamename_=${_gamename//-/_}
_unpatchedver=2.0.0.16
_gamehdpatchname="HoMM3%20HD%20Latest.exe"

pkgdesc="Heroes of Might & Magic III and its expansions: Armageddon's Blade and The Shadow of Death (with HD patch)"
arch=("i686" "x86_64")
url="https://www.gog.com/game/heroes_of_might_and_magic_3_complete_edition"
license=("custom")
groups=("games")

source=("setup_homm3_complete_${_unpatchedver}.exe::gogdownloader://${_gamename_}/en1installer1"
        "patch_${_gamename_%_edition}_${pkgver}.exe::gogdownloader://${_gamename_}/en1patch1"
        "http://h3hota.com/HD/HoMM3%20HD%20Latest.exe"
        "${_gamename}"
        "${_gamename}-map-editor"
        "${_gamename}-campaign-editor"
        "${pkgname}.install")
sha256sums=('d90bed0fd7e5338045f5f9983fdc7390297025ac1accdbc2f9bbec217a066468'
            '9c6ca90dacc621f0bb333a3f5fb6df8b06af2afee571beea14782c989177ff5a'
            '23d31b77ab4741400e976281a2a93ac3bfe19dba2b225763061b32c6782c05a6'
            '79d941eec1f590cd416b568b1b619ad7ed40230d3ddaf1cc7de1cb97ea9f1f4d'
            'bc5f57dd8fe1c4cb9bc4f144eea686a61ccc19e5020e446796f8f4c79014c8be'
            'f7b58168872ce04bfad2ef151632762d29735f3e165bc5c4cf887df68de62ed2'
            '6c6d7f19bcca181ee5c1c51c9f15e8d12d95e1feabcd676d1a41fc377f050d37')
depends=(wine)

# Register lgogdownloader as a download agent
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

makedepends=("lgogdownloader>=2.25")

build() {
  export WINEDEBUG=-all
  export WINEPREFIX="$srcdir"/tmp/env
  export XDG_DATA_HOME="$srcdir"/tmp/local

  install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local
  msg "Running GOG installer"
  wine "$srcdir"/setup_homm3_complete_${_unpatchedver}.exe /verysilent
  # Unfortunately, /verysilent doesn't prevent the installation is successful
  # messagebox from showing up and blocking. Manual intervention is required
  msg "Installing patches (don't launch game yet)"
  wine "${srcdir}"/patch_${_gamename_%_edition}_${pkgver}.exe /verysilent
  msg "Installing HD patch"
  wine "${srcdir}/${_gamehdpatchname}" /verysilent
  msg "Extracting HKEY_LOCAL_MACHINE registry"
  regedit -e ${srcdir}/local_machine.reg "HKEY_LOCAL_MACHINE\Software\New World Computing"
  sed -i 's,C:\\\\GOG Games\\\\Heroes of Might and Magic 3 Complete,Z:\\\\opt\\\\gog\\\\heroes-of-might-and-magic-3-complete-edition,g' local_machine.reg
}

package() {
  # Install registry configuration
  install -Dm644 ${srcdir}/local_machine.reg ${pkgdir}/usr/share/${pkgname}/local_machine.reg

  # Install license
  install -Dm644 "${srcdir}/tmp/env/drive_c/GOG Games/Heroes of Might and Magic 3 Complete/EULA.txt" "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE

  # Install game
  install -m755 -d "${pkgdir}"/opt/gog/
  # mv instead of cp to save disk space
  mv "${srcdir}/tmp/env/drive_c/GOG Games/Heroes of Might and Magic 3 Complete" ${pkgdir}/opt/gog/${pkgname#gog-}
  # Remove unneeded files
  rm -rf ${pkgdir}/opt/gog/${pkgname#gog-}/unins*
  rm -rf ${pkgdir}/opt/gog/${pkgname#gog-}/*.lnk
  # Give group write access to Data (to enable h3mmaped.exe)
  chown :games ${pkgdir}/opt/gog/${_gamename#gog-}/Data/*
  chmod g+w ${pkgdir}/opt/gog/${_gamename#gog-}/Data/*
  # Give group write access to HD3 launcher config
  for conf in _HD3_Data/HD3_Launcher.ini _HD3_Data/Settings/sod.ini
  do
    touch ${pkgdir}/opt/gog/${_gamename#gog-}/${conf}
    chown :games ${pkgdir}/opt/gog/${_gamename#gog-}/${conf}
    chmod g+w ${pkgdir}/opt/gog/${_gamename#gog-}/${conf}
  done
  
  # Install .desktop file and icons
  install -Dm644 "${srcdir}/tmp/local/applications/wine/Programs/GOG.com/Heroes of Might and Magic 3 Complete/Heroes of Might and Magic 3 Complete.desktop" ${pkgdir}/usr/share/applications/${_gamename}.desktop
  install -Dm644 "${srcdir}/tmp/local/applications/wine/Programs/GOG.com/Heroes of Might and Magic 3 Complete/Heroes 3 Map Editor.desktop"                  ${pkgdir}/usr/share/applications/${_gamename}-map-editor.desktop
  install -Dm644 "${srcdir}/tmp/local/applications/wine/Programs/GOG.com/Heroes of Might and Magic 3 Complete/Heroes 3 Campaign Editor.desktop"             ${pkgdir}/usr/share/applications/${_gamename}-campaign-editor.desktop
  for res in 16 32 48 256
  do
    install -Dm644 ${srcdir}/tmp/local/icons/hicolor/${res}x${res}/apps/3679_gfw_high.0.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_gamename}.png
  done
  for res in 16 32 48 64
  do
    install -Dm644 ${srcdir}/tmp/local/icons/hicolor/${res}x${res}/apps/0500_h3maped.0.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_gamename}-map-editor.png
    install -Dm644 ${srcdir}/tmp/local/icons/hicolor/${res}x${res}/apps/472F_h3ccmped.0.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_gamename}-campaign-editor.png
  done
  # Edit out wine jumbled entries from .desktop file
  for file in ${_gamename} ${_gamename}-map-editor ${_gamename}-campaign-editor
  do
    sed -i "/^Path=\|^Version=\|^Terminal=\|^Categories/d" ${pkgdir}/usr/share/applications/${file}.desktop
    sed -i "s,^\(Exec=\|Icon=\).*,\1${file}," ${pkgdir}/usr/share/applications/${file}.desktop
    printf "Version=${pkgver}\nTerminal=false\nCategories=Game;\n" >> ${pkgdir}/usr/share/applications/${file}.desktop
  done
  
  # Install startup scripts
  install -m755 -d ${pkgdir}/usr/bin
  for file in ${_gamename} ${_gamename}-map-editor ${_gamename}-campaign-editor
  do
    install -m755 ${srcdir}/${file} ${pkgdir}/usr/bin
  done
}

# vim:set ts=2 sw=2 et:
