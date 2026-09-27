# Maintainer: pietagorh <pietagorhh at proton dot me>

pkgname=trackmania-forever
_pkgname=TmForever
pkgver=2.11.26
pkgrel=1
pkgdesc="Retro arcade racing game, standalone edition (United + Nations)"
url="https://www.trackmaniaforever.com/"
license=('custom:commercial')
arch=('x86_64')
depends=(
  xdg-user-dirs # get Documents dir
  wine
)
makedepends=(
  innoextract # extract game files from setup.exe
  cabextract # extract DirectX dll's
  icoutils # extract icons
)
source=(
  tmnf_setup.exe::'https://nadeo-download.cdn.ubi.com/trackmaniaforever/tmnationsforever_setup.exe'
  tmuf_setup.exe::'http://files.trackmaniaforever.com/tmunitedforever_setup.exe'
  'launch-script.sh'
  'nations.desktop'
  'united.desktop'
  'mimetypes.xml'
  'EULA'
  'EULA-fr'
  'EULA-uk'
  'EULA-us'
)
sha256sums=(
  '2f659138ed4409da404970841e18f03d29921beaf6a424824c8312ddb20f6355'
  'f8a4d09c64d65be271c0346f5b0e41529cb25eb8c605d4602d0f34f27fb1355f'
  '0a7833a45d51b13d6c47312f918819535305bcc5bb66e875a8f4273a76259b48'
  '47907d248a8f0252f24c7946e4f700513c5bbc0b1a093935ec226cdb82894a8a'
  '66d70d439739f5a954840e0be53662f16dfb66169fca6aad356759b18a9acdcd'
  '3d056047d0f2d17e65a755c7739fe56aed708904129e2214f602af26e966945e'
  '260266e9e03a08bebc440c79acff0a1619c3ded313a61fc2c17f6d86e2a580ac'
  '894e97e1d6ea9bd1112a12a4c3afa6dee2b08a8565fbd19411976cb28be18e29'
  'cdb8147f2c21155e46c4fef638562ca364a6fa01c7f78e6569946accf2c1fc33'
  'f15c9abc0dd006afde1c649b976914bdab3abceb7a299556ef4ee2b86b5c9bda'
)
backup=("opt/${_pkgname}/Nadeo.United.ini" "opt/${_pkgname}/Nadeo.Nations.ini")

prepare() {
  echo -e "  \e[1;35m->\e[1;37m Extracting game files (Nations) \e[0m"
  innoextract 'TmNationsForever_Setup_Tmp.exe'

  rm -rf 'app/GameData/MenuForever.Green'
  mv 'app/GameData/MenuForever' 'app/GameData/MenuForever.Green'
  mv 'app/Nadeo.ini' 'Nadeo.Nations.ini'
  mv 'app/Tm'{,Nations}'ForeverLauncher.exe'

  echo -e "  \e[1;35m->\e[1;37m Extracting icons (Nations) \e[0m"
  wrestool --extract 'app/TmForever.exe' --type=14 --output='nations.ico'
  icotool --extract 'nations.ico'

  echo -e "  \e[1;35m->\e[1;37m Extracting game files (United) \e[0m"
  innoextract 'TmUnitedForever_Setup_Tmp.exe' \
    --exclude-temp # already extracted from nations

  rm -rf 'app/GameData/MenuForever.Blue'
  mv 'app/Nadeo.ini' 'Nadeo.ini.in'

  echo -e "  \e[1;35m->\e[1;37m Extracting icons (United) \e[0m"
  wrestool --extract 'app/TmForever.exe' --type=14 --output='united.ico'
  icotool --extract 'united.ico'
  icotool --extract 'app/Gbx.ico'

  echo -e "  \e[1;35m->\e[1;37m Extracting libraries \e[0m"
  cabextract 'tmp/DxRedist/Apr2006_d3dx9_30_x86.cab' --filter 'd3dx9_30.dll'
}

build() {
  sed '/^UserSubDir/d' 'Nadeo.ini.in' > 'Nadeo.ini'
  return 0
}

package() {
  local _destdir

  # Game dir
  _destdir="${pkgdir}/opt/${_pkgname}"
  install -dm755 "${_destdir}"
  cp -ar 'app'/* "${_destdir}"
  find "${_destdir}" -type d -exec chmod 755 "{}" \;
  find "${_destdir}" -type f -exec chmod 644 "{}" \;
  install -Dm644 'd3dx9_30.dll' "${_destdir}"

  # Config files
  install -Dm644 'Nadeo'*'.ini' "${_destdir}"

  # Launch script
  _destdir="${pkgdir}/usr/bin"
  install -d -m755 "${_destdir}"
  install -Dm755 'launch-script.sh' "${_destdir}/${pkgname}"

  # Desktop entries
  _destdir="${pkgdir}/usr/share/applications/"
  install -d -m755 "${_destdir}"
  install -Dm644 'united.desktop' "${_destdir}/${pkgname}-united.desktop"
  install -Dm644 'nations.desktop' "${_destdir}/${pkgname}-nations.desktop"

  # Mime association
  _destdir="${pkgdir}/usr/share/mime/packages"
  install -Dm644 'mimetypes.xml' "${_destdir}/${pkgname}.xml"

  # Icon
  for _size in 16 32 48 96 256; do
    _destdir="${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}"
    install -d -m755 "${_destdir}/"{apps,mimetypes}
    for _game in nations united; do
      install -Dm644 "${_game}_"*"_${_size}x${_size}x32.png" \
        "${_destdir}/apps/trackmania-forever-${_game}.png"
    done
    install -Dm644 'Gbx_'*"_${_size}x${_size}x32.png" \
      "${_destdir}/mimetypes/trackmania-forever-gbx.png"
  done

  # EULAs
  _destdir="${pkgdir}/usr/share/licenses/${pkgname}"
  install -d -m755 "${_destdir}"
  install -Dm644 "EULA" "${_destdir}"
  for _country in fr uk us; do
    install -Dm644 "EULA-${_country}" "${_destdir}"
  done

  # Manual
  _destdir="${pkgdir}/usr/share/doc/${pkgname}"
  install -d -m755 "${_destdir}"
  install -Dm644 'app/Manual/'* "${_destdir}"
}
