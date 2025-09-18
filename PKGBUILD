# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=wiso-steuer-2025
pkgver=32.10.2810
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

_updater_name="WISOSteuer2025Update$(
  awk <<< "${pkgver}" -F . '{ print $1$3 }'
)"

source=(
  'https://update1.buhl-data.com/ESD/Steuer/2025/WISOSteuer2025.exe'
  'https://update1.buhl-data.com/Steuer/2025/Handbuch_WISO_Steuer_Win.pdf'
  "https://download.buhl.de/hotline/db/9/${_updater_name}.exe"
  'wiso-steuer-2025.bash'
  'wiso-steuer-2025.desktop'
)

sha512sums=('SKIP'
            'SKIP'
            '7b6cf5f9977a78c7e33faa3ec0ac9799a148f3a658bde0e14a74ea633e4eda790cd29b102195f84d0c564ffa9f912e6f2831753f60c9f236caecb50e38cecf69'
            '5a4f740a89c70c2dfd721142dd8b0135ee1e503686d4efcf6b59f9a0984d0a9f4d9780a3261988a51c068ef1ede2e4c98803095fd44ba52f1cb08b0f4f47e2dd'
            'ede44188da134d5d120c6c8c4d619d91e998a1b9f28497e82307a99a65a7791e492d9c3e7ae2d6c297ef7a12e87a5579cd86bd36b805a5bc0ad1ff7197addaaa')

prepare() {
  _extract_original_installer \
    "${srcdir}/WISOSteuer2025.exe" \
    "${srcdir}/${pkgname}" "${srcdir}/${pkgname}-support"
  _stage_original_app \
    "${srcdir}/${pkgname}" \
    "${srcdir}/${pkgname}-staging"
  _run_updater_in_place \
    "${srcdir}/${_updater_name}.exe" \
    "${srcdir}/${pkgname}-staging"
}

_extract_original_installer() {
  local _original_exe _extracted_installer _extracted_support_files
  _original_exe="${1?}"
  _extracted_installer="${2?}"
  _extracted_support_files="${3?}"

  echo >&2 'Extracting original installer'
  mkdir -p "${srcdir}/${pkgname}-cab"
  7z x -o"${srcdir}/${pkgname}-cab" "${_original_exe}"
  unshield -d "${_extracted_installer}" x \
    "${srcdir}/${pkgname}-cab/data1.cab"
  mkdir -p "${_extracted_support_files}"
  cp -R --preserve=mode "${srcdir}/${pkgname}-cab/ISSetupPrerequisites" \
    "${_extracted_support_files}/"
}

_stage_original_app() {
  local _extracted _staging
  _extracted="${1?}"
  _staging="${2?}"

  echo >&2 'Staging app directory'
  cd "${_extracted}"
  install -D -t "${_staging}/plugins2" \
    elster.plugins2/*
  find . \
    -regex './letstrade5\|./\(dokumente\|elster\.\|letstrade5\.scraper\|qt\.files\.\|starter\|_Support_\).*' \
    -prune -o \
    -type f -exec install -t "${_staging}" '{}' ';'
  install -D -t "${_staging}/letstrade5" \
    letstrade5/*
  install -D -t "${_staging}/letstrade5/Scraper" \
    letstrade5.scraper/*
  install -D -t "${_staging}/letstrade5/Scraper/Plugins" \
    letstrade5.scraper.plugins/*
  install -D -t "${_staging}/letstrade5/Scraper/extensions/GeckoScraper" \
    letstrade5.scraper.extensions.geckoscraper/*
  install -D -t "${_staging}/letstrade5/Scraper/extensions/GeckoScraper/chrome/content" \
    letstrade5.scraper.extensions.geckoscraper.chrome.content/*
  install -D -t "${_staging}/letstrade5/Scraper/extensions/GeckoScraper/components" \
    letstrade5.scraper.extensions.geckoscraper.components/*
  install -D -t "${_staging}/letstrade5/Scraper/extensions/GeckoScraper/defaults/preferences" \
    letstrade5.scraper.extensions.geckoscraper.defaults.preferences/*
  install -D -t "${_staging}/letstrade5/Scraper/xulrunner" \
    letstrade5.scraper.xulrunner/*
  install -DT \
    '_Support_Language_Independent_OS_Independent_Files/lic_steuer_win_mac.txt' \
    "${_staging}/lizenztext.txt"
  #shellcheck disable=SC2016
  find . -maxdepth 1 -regex './qt.files.[^_]*' -printf '%f\n' \
    | cut -d . -f 3 \
    | xargs -r -L 1 \
      bash -c 'install -D -t "${1}/${2}" "qt.files.${2}"/*' _ "${_staging}"
  install -D -t "${_staging}/translations/qtwebengine_locales" \
    qt.files.translations_qtwebengine_locales/*
  install -D -t "${_staging}/sqldrivers" \
    qt.files.sqldrivers/*
  install -DT -m 755 starter.sparbuch.dl/wisodl2025.exe "${_staging}/WISO2025.EXE"
}

_run_updater_in_place() {
  local _updater_exe _staging
  local _exitstatus _patchlog _restoretrap WINEARCH WINEDEBUG WINEPREFIX
  _updater_exe="${1?}"
  _staging="${2?}"

  export WINEARCH WINEDEBUG WINEPREFIX
  WINEARCH=win64
  WINEDEBUG=fixme-all
  WINEPREFIX="$(mktemp -dt tmp.XXXXXXXX.wine.pkgbuild)"

  cd "${_staging}"

  echo >&2 'Extracting updater'
  wine "${_updater_exe}" \
    "/extract_all:$(winepath -w "${srcdir}/${pkgname}-updater-cab")"
  unshield -d "${srcdir}/${pkgname}-updater" x \
    "${srcdir}/${pkgname}-updater-cab/Disk1/data1.cab"

  echo >&2 'Staging updater'
  install -D -t . \
    "${srcdir}/${pkgname}-updater/_Support_Language_Independent_OS_Independent_Files/btspatcher.exe" \
    "${srcdir}/${pkgname}-updater/_Support_Language_Independent_OS_Independent_Files"/*.inf \
    "${srcdir}/${pkgname}-updater/_Support_Language_Independent_OS_Independent_Files"/*.rtp

  echo >&2 'Running updater in place'
  _restoretrap=$(trap -p ERR)
  trap - ERR
  set +e
  wine btspatcher.exe -test
  _exitstatus=$?
  set -e
  eval "${_restoretrap}"

  echo >&2 'Cleaning up temporary Wine prefix'
  wineserver -w
  rm -rf "${WINEPREFIX}"

  echo >&2 'Checking updater result'
  if [[ $_exitstatus -ne 51 ]]; then
    _patchlog="$(
      find . -maxdepth 1 -name '*.patch.log' -exec realpath '{}' + \
        | sort -R | head -1
    )"
    printf >&2 'Unexpected exit status: %d\n' "${_exitstatus}"
    if [[ -n "${_patchlog}" ]]; then
      printf >&2 'See full patch log for details: %s\n' "${_patchlog}"
    fi
    exit 1
  fi

  echo >&2 'Cleaning up staging directory'
  rm -fv -- btspatcher.log *.inf *.rtp
}

package() {
  cd "${pkgname}"

  echo >&2 'Packaging the licenses'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'files.lizenz.fremd/fremdlizenz.pdf'
  iconv -f cp1252 -t utf-8 \
    '_Support_Language_Independent_OS_Independent_Files/lic_steuer_win_mac.txt' \
    > "${pkgdir}/usr/share/licenses/${pkgname}/lic_steuer_win_mac.txt"

  echo >&2 'Packaging program files'
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -R --preserve=mode "../${pkgname}-staging" \
    "${pkgdir}/usr/lib/${pkgname}/app"

  echo >&2 'Packaging support files'
  install -D -t "${pkgdir}/usr/lib/${pkgname}/support" \
    "../${pkgname}-support"/ISSetupPrerequisites/*/VC_redist.x64.exe

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
  install -D -m 755 -T "../${pkgname}.bash" \
    "${pkgdir}/usr/bin/${pkgname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -t "${pkgdir}/usr/share/applications" \
    "../${pkgname}.desktop"
}
