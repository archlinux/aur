# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=xqwizard
pkgver=5.52
pkgrel=2
pkgdesc="A super powerful Chinese chess teaching, computer game and chess score editing software"
arch=('i686' 'x86_64')
url="https://www.xqbase.com"
license=('custom:xqwizard')
makedepends=('icoutils')
depends=('bash' 'wine' 'hicolor-icon-theme')
source=(
  "https://www.xqbase.com/download/xqwizard_portable.7z"
  "https://download.microsoft.com/download/5/a/d/5ad868a0-8ecd-4bb0-a882-fe53eb7ef348/VB6.0-KB290887-X86.exe"
  "file://xqwizard.desktop"
  "file://xqarena.desktop"
  "file://xqschool.desktop"
)
noextract=(
  "xqwizard_portable.7z"
)

_launchers=(
  "xqarena"
  "xqschool"
  "xqwizard"
)

_launcher_icon_names=(
  "XQARENA"
  "XQSCHOOL"
  "XQWIZARD"
)

_launcher_exe_paths=(
  "XQARENA.EXE"
  "XQSCHOOL.EXE"
  "XQWIZARD.EXE"
)

_default_env_wineprefix='$HOME/.wine-game'
_default_env_winearch='win32'
_default_env_winedebug='-all'
_wine_env_file="/etc/wine/appenv/${pkgname}"
_application_path_root="/opt"

backup=("${_wine_env_file#/*}")
install="${pkgname}.install"

prepare() {
  cd "${srcdir}"
  mkdir -p "pkg"
  cd "pkg"
  bsdtar xf ../xqwizard_portable.7z
  bsdtar xf ../vbrun60sp6.exe msvbvm60.dll
}

_create_launcher(){
  # $1 Path of position
  # $2 Relative path to executable in $1 (Windows path format)
  # $3 Parameters of wine
  printf '#!/bin/bash
source '"${_wine_env_file}"'

apphome='"${_application_path_root}/${pkgname}"'
wine_appdir="$WINEPREFIX/drive_c/Program Files"
wine_workhome="$wine_appdir/'"${pkgname}"'"

if [ ! -e "${wine_workhome}" ]; then
  mkdir -p "${wine_appdir}"
  cp -rs "${apphome}" "${wine_workhome}"
fi

exec wine "C:\\\\Program Files\\\\'"${pkgname}\\\\$2"'" '"$3"'
' > "$1"
}

build() {
  cd "${srcdir}"
  
  # Build icons
  mkdir -p icons
  wrestool -v -x -t 14 -o "icons" "pkg/XQWIZARD.EXE"
  wrestool -v -x -t 14 -o "icons" "pkg/XQARENA.EXE"
  wrestool -v -x -t 14 -o "icons" "pkg/XQSCHOOL.EXE"
  icotool -x -o "icons" "icons/XQWIZARD.EXE_14_1.ico"
  icotool -x -o "icons" "icons/XQARENA.EXE_14_1.ico"
  icotool -x -o "icons" "icons/XQSCHOOL.EXE_14_1.ico"
  
  # Build launchers
  _create_launcher "xqwizard" "XQWIZARD.EXE" '$*'
  _create_launcher "xqarena" "XQARENA.EXE" '$*'
  _create_launcher "xqschool" "XQSCHOOL.EXE" '$*'
  
  # Build env file
  printf "export WINEPREFIX=${_default_env_wineprefix}
export WINEARCH=${_default_env_winearch}
export WINEDEBUG=${_default_env_winedebug}
" > "${pkgname}.env"
}

package() {
  cd "${srcdir}"
  
  # Install icons
  for n in XQWIZARD XQARENA XQSCHOOL; do
    for s in 16 32 48; do
      install -Dm644 icons/$n*${s}x${s}*.png "${pkgdir}/usr/share/icons/hicolor/"${s}x${s}/apps/$n.png
    done
  done
  
  # Install licenses
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  touch "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Install desktop files
  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 *.desktop "${pkgdir}/usr/share/applications/"
  
  # Install launchers
  install -d "${pkgdir}/usr/bin"
  install -Dm755 xqarena xqschool xqwizard "${pkgdir}/usr/bin/"
  
  # Install env file
  install -Dm644 "${pkgname}.env" "${pkgdir}${_wine_env_file}"
  
  # Install application files
  install -d "${pkgdir}${_application_path_root}"
  cp -rf 'pkg' "${pkgdir}${_application_path_root}/${pkgname}"
}

# vim:set ts=2 sw=2 et:
sha256sums=('45f1d1b99056dc382c241d4e01bacc9ec085891ca6c3983a159352aa476f57d5'
            '467b5a10c369865f2021d379fc0933cb382146b702bbca4bcb703fc86f4322bb'
            'SKIP'
            'SKIP'
            'SKIP')
