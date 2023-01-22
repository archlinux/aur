pkgname=gog-heroes-of-might-and-magic-3-complete-edition
pkgver=4.0.28740
pkgrel=7
_gamename=${pkgname#gog-}
_gamename=${_gamename//-/_}
#INCLUDE_HD_MOD=true
#INCLUDE_HOTA=true

pkgdesc="Heroes of Might & Magic III and its expansions: Armageddon's Blade and The Shadow of Death (with optional HD patch)"
arch=("i686" "x86_64")
url="https://www.gog.com/game/heroes_of_might_and_magic_3_complete_edition"
license=("custom")
groups=("games")

source=("setup_homm3_complete_${pkgver}.exe::gogdownloader://${_gamename}/en1installer0"
        "setup_homm3_complete_${pkgver}-1.bin::gogdownloader://${_gamename}/en1installer1"
        "${pkgname}.desktop"
        "${pkgname}-campaign-editor.desktop"
        "${pkgname}-map-editor.desktop"
        "${pkgname}"
        "${pkgname}-campaign-editor"
        "${pkgname}-map-editor"
        "${pkgname}.install")
sha256sums=('eaf75707911b16850ec770a551c59e594abba60c7a879fb0c171fc442b1299b3'
            '044f62c74067188ec0e52fb0db460109bcd23951acb9cfd424267a22c0f0d4f1'
            'ab14524f06cb213ee0b1e5bcd5d9089da9e66057794430347d32a60a86a945fd'
            'de064d9bc819403dc5990fd70d81c88d63d708ba5b4e02015cc616e77338c478'
            '4dc5f7d1bd44405dae2969ec093ef6ce680aec889024b68350023feb4a12ee1b'
            '3dfc6fbb909aad2ea906b184b0d780cf3b9768dd80aa01e2745a062b964b881c'
            'cd18b260ed5fe0009fc89e6dc50eb9f0c13a3cea9fb569fbda1412ba348b1539'
            '57ad02e420f54e9d3403a0bd66a1d86a3fc94856922bc22da9cf6d9aa906699e'
            '493ef7009c2f4d103ed5b283fcc5dd900ff13cfb1d494052227bf7760fe0f7c7')
depends=(wine unionfs-fuse util-linux)
makedepends=(icoutils "lgogdownloader>=2.25")

# Register lgogdownloader as a download agent
DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

if [[ ${INCLUDE_HD_MOD} = true ]]; then
  # source+=("http://vm914332.had.yt/HoMM3_HD_Latest_setup.exe"
  source+=("http://h3hota.com/HD/HoMM3_HD_Latest_setup.exe"
           gog-heroes-of-might-and-magic-3-complete-edition-hd-mod
           gog-heroes-of-might-and-magic-3-complete-edition-hd-mod.desktop)
fi

if [[ ${INCLUDE_HOTA} = true ]]; then
  source+=("http://heroes3towns.com/HotA/HotA_1.6.1_setup.exe"
           gog-heroes-of-might-and-magic-3-complete-edition-hota
           gog-heroes-of-might-and-magic-3-complete-edition-hota.desktop)
fi

build() {
  export WINEDEBUG=-all
  export WINEPREFIX="$srcdir"/tmp/env
  export XDG_DATA_HOME="$srcdir"/tmp/local

  install -m755 -d "$srcdir"/tmp "$srcdir"/tmp/env "$srcdir"/tmp/local

  msg "Running GOG installer"
  wine "${srcdir}/setup_homm3_complete_${pkgver}.exe" /Log=$(tty) /Dir="${srcdir}/${pkgname#gog-}" /NoIcons=0 /verysilent # /LANG=english /?

  if [[ ${INCLUDE_HD_MOD} = true ]]; then
    msg "Installing HD Mod"
    WINEDEBUG="" wine "${srcdir}/HoMM3_HD_Latest_setup.exe" /Log=${srcdir}/tmp/hd_mod_install.log /Dir="${srcdir}/${pkgname#gog-}" /verysilent /suppressmsgboxes
    cat ${srcdir}/tmp/hd_mod_install.log
  fi

  if [[ ${INCLUDE_HOTA} = true ]]; then
    msg "Installing HotA"
    wine "${srcdir}/HotA_1.6.1_setup.exe" /verysilent /LOG=$(tty) /Dir="${srcdir}/${pkgname#gog-}"
  fi

  msg "Extracting HKEY_LOCAL_MACHINE registry"
  regedit -e ${srcdir}/local_machine.reg "HKEY_LOCAL_MACHINE\Software\New World Computing"
  sed -i 's,C:\\\\GOG Games\\\\homm 3 complete,Z:\\\\opt\\\\gog\\\\homm 3 complete,g' ${srcdir}/local_machine.reg

  msg "Generating Icons"
  mkdir -p "${srcdir}"/icons
  wrestool -x -t14 -o "${srcdir}"/icons "${srcdir}/${pkgname#gog-}/"{Heroes3,h3maped,h3ccmped}.exe
  if [[ ${INCLUDE_HD_MOD} = true ]]; then
    wrestool -x -t14 -o "${srcdir}"/icons "${srcdir}/${pkgname#gog-}/"HD_Launcher.exe
    rm ${srcdir}/icons/HD_Launcher.exe_14_103_1049.ico
  fi
  if [[ ${INCLUDE_HOTA} = true ]]; then
    wrestool -x -t14 -o "${srcdir}"/icons "${srcdir}/${pkgname#gog-}/"HotA_launcher.exe
    rm ${srcdir}/icons/HotA_launcher.exe_14_103_1049.ico
  fi
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
  if [[ ${INCLUDE_HD_MOD} = true ]]; then
    install -Dm644 "${srcdir}/${pkgname}-hd-mod.desktop"         ${pkgdir}/usr/share/applications/${pkgname}-hd-mod.desktop
  fi
  if [[ ${INCLUDE_HOTA} = true ]]; then
    install -Dm644 "${srcdir}/${pkgname}-hota.desktop"           ${pkgdir}/usr/share/applications/${pkgname}-hota.desktop
  fi

  for res in 16 32 48 64; do
    install -Dm644 ${srcdir}/icons/h3maped.exe*${res}x${res}x8.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}-map-editor.png
    install -Dm644 ${srcdir}/icons/h3ccmped.exe*${res}x${res}x8.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}-campaign-editor.png
    install -Dm644 ${srcdir}/icons/Heroes3.exe*${res}x${res}x8.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png
  done
  for res in 16 32 48 128; do
    if [[ ${INCLUDE_HD_MOD} = true ]]; then
      install -Dm644 ${srcdir}/icons/HD_Launcher.exe*${res}x${res}x32.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}-hd-mod.png
    fi
    if [[ ${INCLUDE_HOTA} = true ]]; then
      install -Dm644 ${srcdir}/icons/HotA_launcher.exe*${res}x${res}x32.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}-hota.png
    fi
  done
  
  # Install startup scripts
  install -m755 -d ${pkgdir}/usr/bin
  for file in ${pkgname} ${pkgname}-map-editor ${pkgname}-campaign-editor
  do
    install -m755 ${srcdir}/${file} ${pkgdir}/usr/bin
  done

  if [[ ${INCLUDE_HD_MOD} = true ]]; then
    install -m755 ${srcdir}/${pkgname}-hd-mod ${pkgdir}/usr/bin
  fi
  if [[ ${INCLUDE_HOTA} = true ]]; then
    install -m755 ${srcdir}/${pkgname}-hota ${pkgdir}/usr/bin
  fi
}

# vim:set ts=2 sw=2 et:
