# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=wiso-steuer-2026
pkgver=33.0.2600
pkgrel=2
pkgdesc='File your German tax return for the tax year 2025'
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
  'imagemagick'
  'msitools'
  'p7zip'
  'pev'
)
license=('LicenseRef-custom')
options=('!strip')
install="${pkgname}.install"

_updater_name="WISOSteuer2026Update$(
  awk <<< "${pkgver}" -F . '{ print $1$3 }'
)"

source=(
  'https://update1.buhl-data.com/ESD/Steuer/2026/WISOSteuer2026.exe'
  'https://update1.buhl-data.com/Steuer/2026/Handbuch_WISO_Steuer_Win.pdf'
  # Uncomment once upstream has published the first updater
  # "https://download.buhl.de/hotline/db/9/${_updater_name}.exe"
  'wiso-steuer-2026.bash'
  'wiso-steuer-2026.desktop'
)

sha512sums=(
  'SKIP'
  'SKIP'
  # Uncomment once upstream has published the first updater
  # '7b6cf5f9977a78c7e33faa3ec0ac9799a148f3a658bde0e14a74ea633e4eda790cd29b102195f84d0c564ffa9f912e6f2831753f60c9f236caecb50e38cecf69'
  'a5c60dcf26a22cf151caf32ad293ea1ac9ddac0e5c93cc14f25b5aa1fd886d4c4f149654d8498e3a0335c30ff178c7ad5b936141f0a01c3bd853836790997480'
  'f49b6c1d54c907253d2ad378c248f21da0ee98053b4bd090a9b92363c574902eb8364b0b8e2e759bdd09fcab315672c8d22fc06d9915207fb91170d9a7ef04ba'
)

prepare() {
  _extract_original_installer \
    "${srcdir}/WISOSteuer2026.exe" \
    "${srcdir}/${pkgname}-staging"
  # Uncomment once upstream has published the first updater
  # _run_updater_in_place \
  #   "${srcdir}/${_updater_name}.exe" \
  #   "${srcdir}/${pkgname}-staging"
}

_extract_original_installer() {
  local _original_exe _staging
  _original_exe="${1?}"
  _staging="${2?}"

  echo >&2 'Extracting original installer'
  mkdir -p "${srcdir}/${pkgname}-msi"
  7z x -o"${srcdir}/${pkgname}-msi" "${_original_exe}"
  # Use a symlink to strip the first three path elements
  mkdir -p "${_staging}" \
    "${srcdir}/${pkgname}-tmpextract/PFiles64/WISO"
  ln -fns \
    "${_staging}" \
    "${srcdir}/${pkgname}-tmpextract/PFiles64/WISO/Steuersoftware 2026"
  msiextract -C "${srcdir}/${pkgname}-tmpextract" \
    "${srcdir}/${pkgname}-msi/sparbgtst.msi"
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
  cd "${pkgname}-staging"

  echo >&2 'Packaging the licenses'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    'fremdlizenz.pdf'

  echo >&2 'Packaging program files and documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    ../Handbuch_WISO_Steuer_Win.pdf
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}/dokumente" \
    dokumente/*
  rm -rf dokumente
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -R --preserve=mode "../${pkgname}-staging" \
    "${pkgdir}/usr/lib/${pkgname}/app"
  ln -fns "/usr/share/doc/${pkgname}/dokumente" "${pkgdir}/usr/lib/${pkgname}/app/"

  echo >&2 'Packaging app icon'
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  magick 'wisoakt.ico' \
    -delete 1,2,3,4,5,6,7,8 "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  echo >&2 'Packaging launcher'
  install -D -m 755 -T "../${pkgname}.bash" \
    "${pkgdir}/usr/bin/${pkgname}"

  echo >&2 'Packaging desktop file'
  install -D -m 755 -t "${pkgdir}/usr/share/applications" \
    "../${pkgname}.desktop"
}
