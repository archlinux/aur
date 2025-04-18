# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgbase=wiso-steuer-2025
pkgname=(
  "${pkgbase}-docs"
  "${pkgbase}-installer"
  "${pkgbase}-launcher"
)
# peres -v -f csv ~/.local/share/wiso/wine/drive_c/Program\ Files/WISO/Steuersoftware\ 2025/WISO2025.EXE | awk -F , '/^Product Version,/ { print $2 }'
pkgver=2025.32.6.2330
pkgrel=1
pkgdesc='File your German tax return for the tax year 2024'
arch=('x86_64')
url='https://www.buhl.de/produkte/wiso-steuer'
depends=('bash' 'wine' 'wine-mono' 'wine-gecko' 'winetricks')
makedepends=(
  'cabextract'
  'imagemagick'
  'openssl-1.1'
  'p7zip'
  'pev'
  'unshield'
)
license=('LicenseRef-custom')
options=('!strip')

source=(
  'https://update1.buhl-data.com/ESD/Steuer/2025/WISOSteuer2025.exe'
  'wiso-steuer-2025.bash'
  'wiso-steuer-2025.desktop'
  'd2d1.dll'
)

sha512sums=(
  'SKIP'
  '55e4468e0379cf523bfde54dade59f66482bfce42b013a41e053c58225f31aaff674b06b3f61954f42263def8f3663b3aeaed62ff568fe2202607d71237320b0'
  'ede44188da134d5d120c6c8c4d619d91e998a1b9f28497e82307a99a65a7791e492d9c3e7ae2d6c297ef7a12e87a5579cd86bd36b805a5bc0ad1ff7197addaaa'
  '27c641beadf3eabdcb5c8b1510cce340dcd1376f7933b3256256370dd532be34b55f1b4f91d6ff0b654a82e934b1163c93b4de37ed40f6540c5bec804e8acc66'
)

prepare() {
  mkdir -p "${srcdir}/${pkgbase}-cab"
  7z x -o"${srcdir}/${pkgbase}-cab" \
    "${srcdir}/WISOSteuer2025.exe"

  # Extract only groups that contain relevant assets, e.g. license files,
  # icons, PDF files
  for group in \
    'dokumente.freibetrag' \
    'dokumente.steuern' \
    'files.lizenz.fremd' \
    'icon.wisoakt' \
    '<Support>Language Independent OS Independent Files'
  do
    echo >&2 "Extracting: ${group}"
    unshield -d "${srcdir}/${pkgbase}" -g "${group}" \
      x "${srcdir}/${pkgbase}-cab/data2.cab"
  done
}

# shellcheck disable=SC2128
_package_licenses() {
  echo >&2 'Packaging the licenses'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    "${srcdir}/${pkgbase}/files.lizenz.fremd/fremdlizenz.pdf"
  iconv -f cp1252 -t utf-8 \
    "${srcdir}/${pkgbase}/_Support_Language_Independent_OS_Independent_Files/lic_steuer_win_mac.txt" \
    > "${pkgdir}/usr/share/licenses/${pkgname}/lic_steuer_win_mac.txt"
}

# shellcheck disable=SC2128
package_wiso-steuer-2025-docs() {
  arch=('any')
  _package_licenses
  for group in \
    'dokumente.freibetrag' \
    'dokumente.steuern'
  do
    echo >&2 "Packaging the documentation: ${group}"
    install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgbase}/${group}" \
      "${srcdir}/${pkgbase}/${group}"/*.pdf
  done
}

# shellcheck disable=SC2128
package_wiso-steuer-2025-installer() {
  install="${pkgname}.install"
  _package_licenses
  install -D -m 755 -t "${pkgdir}/opt/${pkgname}" \
    "${srcdir}/WISOSteuer2025.exe" \
    "${srcdir}/d2d1.dll"
}

# shellcheck disable=SC2128
package_wiso-steuer-2025-launcher() {
  install="${pkgname}.install"
  _package_licenses

  echo >&2 'Packaging app icon'
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  convert -delete 1,2,3,4,5 \
    "${srcdir}/${pkgbase}/icon.wisoakt"/wisoakt.ico \
    "${pkgdir}/usr/share/pixmaps/wiso-steuer-2025.png"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T "${srcdir}/wiso-steuer-2025.bash" \
    "${pkgdir}/usr/bin/wiso-steuer-2025"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -t "${pkgdir}/usr/share/applications" \
    "${srcdir}/wiso-steuer-2025.desktop"
}
