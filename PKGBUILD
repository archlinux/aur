# Maintainer: qaz <fkxxyz@163.com>
# Contributor: qaz <fkxxyz@163.com>

pkgname=thunder-mini
pkgver=1.5.3.288
pkgrel=3
pkgdesc="Xunlei officially released a compact download tool with dedicated download function."
arch=("i686" "x86_64")
url="https://dl.xunlei.com/"
license=('custom')
makedepends=('p7zip' 'icoutils')
depends=('bash' 'wine' 'hicolor-icon-theme')
source=(
  "http://down.sandai.net/mini/ThunderMini_dl1.5.3.288.exe"
  "license.txt"
  "file://${pkgname}.desktop"
)
noextract=('ThunderMini_dl1.5.3.288.exe')

_default_env_wineprefix='$HOME/.wine-tool'
_default_env_winearch='win32'
_default_env_winedebug='-all'
_wine_env_file="/etc/wine/appenv/${pkgname}"
_application_path_root="/opt"

backup=("${_wine_env_file#/*}")
install="${pkgname}.install"

prepare() {
  mkdir -p "${srcdir}/pkg"
  cd "${srcdir}/pkg"
  7z x -y ../ThunderMini_dl1.5.3.288.exe
  rm ./Bin/UnInstallClean.exe
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
  # Build icon
  mkdir -p "${srcdir}/ico"
  wrestool -x -o "${srcdir}/ico" -t14 "${srcdir}/pkg/Bin/ThunderMini.exe"
  icotool -x -o "${srcdir}/ico" "${srcdir}/ico/ThunderMini.exe_14_116_2052.ico"
  
  # Build launcher
  _create_launcher "thunder-mini" "Bin\\ThunderMini.exe" '$*'
  
  # Build env file
  printf "export WINEPREFIX=${_default_env_wineprefix}
export WINEARCH=${_default_env_winearch}
export WINEDEBUG=${_default_env_winedebug}
" > "${pkgname}.env"
}

package() {

  # Install application files
  install -d "${pkgdir}${_application_path_root}/$pkgname"
  cp -r "$srcdir/pkg/"{Bin,bho,Skin} "${pkgdir}${_application_path_root}/$pkgname/"
  cp "$srcdir/pkg/\$WINDIR/system32/"* "${pkgdir}${_application_path_root}/$pkgname/Bin/"
  find "${pkgdir}${_application_path_root}/$pkgname/" -type d -exec chmod 755 {} \;
  
  # Install env file
  install -Dm644 "${pkgname}.env" "${pkgdir}${_wine_env_file}"
  
  # Install launcher
  install -Dm755 "$srcdir/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  # Install licenses
  install -Dm644 "license.txt" "${pkgdir}/usr/share/licenses/$pkgname/license.txt"
  
  # Install icon
  for size in 16x16 32x32 48x48; do
    install -Dm644 "${srcdir}/ico/ThunderMini.exe_14_116_2052_"?"_${size}x32.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/${pkgname}.png"
  done
  
  # Install desktop file
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
md5sums=('95118524fa7d7e457c7bed4abcb5bbfc'
         'a04a22f2def04dd4f030de7fc3e83666'
         '227afd0034719425b6d69379efd6558a')

