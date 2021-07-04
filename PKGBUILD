# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2021-07-04.

_year='21'
_prevyear="$(( ${_year} - 1 ))"

_pkgname=idos-timetable-browser-license-installer
pkgname="${_pkgname}-latest"
epoch=1
_pkgver="20${_prevyear}_20${_year}"
pkgver="${_pkgver}"
pkgrel=1
pkgdesc="If you purchased IDOS for Windows by CHAPS, then this installs the license. You need to enter your ZIP-extraction-code and your setup-code during installation. Runs an interactive GUI software via wine during installation."
arch=('i686' 'x86_64')
url="http://www.chaps.cz/eng/order"
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
  "idos-timetable-browser"
)

makedepends=(
  "unzip"
  "wine"
)

optdepends=()

provides=(
  "${_pkgname}=${pkgver}"
  "idos-timetable-browser-license=${pkgver}"
)

conflicts=(
  "${_pkgname}"
  "idos-timetable-browser-license"
)

replaces=("${_pkgname}<=${pkgver}")

_target="iwin.zip"

source=(
  "${_target}::ftp://ttakt.chaps.cz/TTAktual/Win/Zip/IWIN.ZIP"
  "IDOS-Licence.pdf::http://chaps.cz/files/idos/IDOS-Licence.pdf"
  "copying.txt"
  "installer_settings.inf"
  "idos-timetable-browser-license.install"
)

sha256sums=(
  "SKIP"
  "SKIP"
  "6382fff14035c4ec7387e7f0d20d7494e05da3d4c24155090fb39196fa944041"
  "1cdffacf6b199b9a16bb6fedd9a4e08f7e3f897bebb5d891b27601f400f5dffb"
  "f692f387815e7980b418e6e6b2c2965d79f7f9dfe0fc962f6ed3bbfe5f99570a"
)

build() {
  cd "${srcdir}"
  
  WINEPREFIX="${srcdir}/.wine"
  export WINEPREFIX
  
  if locale -a | grep -qE '^cs_CZ'; then
    if locale -a | grep -qE '^cs_CZ' | grep -qi utf8; then
      LC_CTYPE="$(locale -a | grep -E '^cs_CZ' | grep -i utf8 | head -n 1)"
    else
      LC_CTYPE="$(locale -a | grep -E '^cs_CZ' | tail -n 1)"
    fi
    export LC_CTYPE
  fi
  
  _gui_inst="${srcdir}/IDOS"
  
  msg ""
  msg "== Important, please read. =="
  msg ""
  msg "Launching installer GUI."
  msg "Please DO NOT CHANGE INSTALLATION DIRECTORY!"
  msg ""
  msg "If you purchased only a local license, not a network license,"
  msg "please MAKE SURE that the wine-drive we are going to install to"
  msg "is NOT A NETWORK DRIVE but a LOCAL HARDDISK. If necessary,"
  msg "abort, run"
  msg "  WINEPREFIX=${WINEPREFIX} winecfg"
  msg "to reconfigure, and then resume installation (e.g. with makepkg)"
  msg "from where you aborted, without deleting and re-creating"
  msg "${srcdir} and ${WINEPREFIX}."
  msg ""
  msg "Also, do not change the other settings during installation. Only" 
  msg "at the very end, you can uncheck to view the ReadMe.txt."
  msg ""
  msg "Note: The GUI performs a full installation into a temporary"
  msg "directory, but after that only the license file will be"
  msg "extracted and copied to the proper location where the IDOS"
  msg "timetable browser should already be installed."
  msg ""
  
  wine "./Setup.exe" /LOADINF="installer_settings.inf" /DIR="${_gui_inst}"
}


package() {
  _gui_inst="${srcdir}/IDOS"
  
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  
  install -D -m644 "${_gui_inst}/TT.ttk" "${_instdir}/TT.ttk"
  
  install -D -m644 "${srcdir}/IDOS-Licence.pdf"            "${pkgdir}/usr/share/licenses/${pkgname}/IDOS-Licence.pdf"
  install -D -m644 "${srcdir}/copying.txt"            "${pkgdir}/usr/share/licenses/${pkgname}/copying.txt"
}
