# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=wiso-steuer-2025
pkgver=32.6.2330
pkgrel=1
pkgdesc='File your German tax return for the tax year 2024'
arch=('x86_64')
url='https://www.buhl.de/produkte/wiso-steuer'
depends=(
  'bash'
  'coreutils'
  'wine'
  'wine-mono'
  'wine-gecko'
  'winetricks'
  'zenity'
)
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
install="${pkgname}.install"

source=(
  'https://update1.buhl-data.com/ESD/Steuer/2025/WISOSteuer2025.exe'
  'https://update3.buhl-data.com/Steuer/2025/Handbuch_WISO_Steuer_Win.pdf'
  'wiso-steuer-2025.bash'
  'wiso-steuer-2025.desktop'
  'd2d1.dll'
)

sha512sums=(
  'SKIP'
  'SKIP'
  'e9b69ef73f7cb220ebad87d3bc529e788ee28c8a40e8993158ed652c1f8a0b6cca10d81e05f52f6d5ca93cee87b4e9f814aca770ce7f1eeedd827c5fef3d6fad'
  'ede44188da134d5d120c6c8c4d619d91e998a1b9f28497e82307a99a65a7791e492d9c3e7ae2d6c297ef7a12e87a5579cd86bd36b805a5bc0ad1ff7197addaaa'
  '27c641beadf3eabdcb5c8b1510cce340dcd1376f7933b3256256370dd532be34b55f1b4f91d6ff0b654a82e934b1163c93b4de37ed40f6540c5bec804e8acc66'
)

pkgver() {
  peres -v -f csv "${srcdir}/${pkgname}/starter.sparbuch.dl/wisodl2025.exe" \
    | awk -F , '/^Product Version,/ { print $2 }' \
    | cut -d . -f 2-
}

prepare() {
  mkdir -p "${srcdir}/${pkgname}-cab"
  7z x -o"${srcdir}/${pkgname}-cab" \
    "${srcdir}/WISOSteuer2025.exe"

  unshield -d "${srcdir}/${pkgname}" \
    x "${srcdir}/${pkgname}-cab/data1.cab"
}

package() {
  cd "${srcdir}/${pkgname}"

  echo >&2 'Packaging the licenses'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'files.lizenz.fremd/fremdlizenz.pdf'
  iconv -f cp1252 -t utf-8 \
    '_Support_Language_Independent_OS_Independent_Files/lic_steuer_win_mac.txt' \
    > "${pkgdir}/usr/share/licenses/${pkgname}/lic_steuer_win_mac.txt"

  echo >&2 'Packaging program files'
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/plugins2" \
    elster.plugins2/*
  find . \
    -regex './letstrade5\|./\(dokumente\|elster\.\|letstrade5\.scraper\|qt\.files\.\|starter\|_Support_\).*' \
    -prune -o \
    -type f -exec install -t "${pkgdir}/usr/lib/${pkgname}/app" '{}' ';'
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/letstrade5" \
    letstrade5/*
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/letstrade5/Scraper" \
    letstrade5.scraper/*
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/letstrade5/Scraper/Plugins" \
    letstrade5.scraper.plugins/*
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/letstrade5/Scraper/extensions/GeckoScraper" \
    letstrade5.scraper.extensions.geckoscraper/*
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/letstrade5/Scraper/extensions/GeckoScraper/chrome/content" \
    letstrade5.scraper.extensions.geckoscraper.chrome.content/*
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/letstrade5/Scraper/extensions/GeckoScraper/components" \
    letstrade5.scraper.extensions.geckoscraper.components/*
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/letstrade5/Scraper/extensions/GeckoScraper/defaults/preferences" \
    letstrade5.scraper.extensions.geckoscraper.defaults.preferences/*
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/letstrade5/Scraper/xulrunner" \
    letstrade5.scraper.xulrunner/*
  install -DT \
    '_Support_Language_Independent_OS_Independent_Files/lic_steuer_win_mac.txt' \
    "${pkgdir}/usr/lib/${pkgname}/app/lizenztext.txt"
  #shellcheck disable=SC2016
  find . -maxdepth 1 -regex './qt.files.[^_]*' -printf '%f\n' \
    | cut -d . -f 3 \
    | xargs -r -L 1 \
      bash -c 'install -D -t "${1}/app/${2}" "qt.files.${2}"/*' _ \
        "${pkgdir}/usr/lib/${pkgname}"
  install -D -t "${pkgdir}/usr/lib/${pkgname}/app/translations/qtwebengine_locales" \
    qt.files.translations_qtwebengine_locales/*
  install -DT -m 755 \
    starter.sparbuch.dl/wisodl2025.exe \
    "${pkgdir}/usr/lib/${pkgname}/app/WISO2025.EXE"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    ../Handbuch_WISO_Steuer_Win.pdf
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/Dokumente" \
    'dokumente.freibetrag'/*.pdf \
    'dokumente.steuern'/*.pdf
  ln -fns "/usr/share/doc/${pkgname}/Dokumente" "${pkgdir}/usr/lib/${pkgname}/app/"

  echo >&2 'Packaging app icon'
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  magick 'icon.wisoakt/wisoakt.ico' \
    -delete 1,2,3,4,5 "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T "${srcdir}/${pkgname}.bash" \
    "${pkgdir}/usr/bin/${pkgname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -t "${pkgdir}/usr/share/applications" \
    "${srcdir}/${pkgname}.desktop"
}
