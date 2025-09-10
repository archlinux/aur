# Maintainer: Jove Yu <yushijun110@gmail.com>
# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>
pkgbase=wps-office-365
pkgname=('wps-office-365' 'wps-office-365-xiezuo' 'wps-office-365-fonts')
pkgver=12.1.2.22550
pkgrel=1
pkgdesc="WPS Office, is an office productivity suite."
arch=('x86_64' 'aarch64' 'loong64')
url="https://365.wps.cn/"
license=('LicenseRef-WPS-EULA')
makedepends=(
  'tar')
depends=(
  'fontconfig' 'libxrender' 'xdg-utils' 'glu'
  'libpulse' 'libxss' 'sqlite' 'libtool' 'libtiff'
  'libxslt' 'libjpeg-turbo' 'libpng12' 'freetype2')
optdepends=(
  'wps-office-365-fonts: FZ TTF fonts provided by wps office 365'
  'cups: for printing support')
options=(!strip !zipman !debug)
source_base="https://pubwps-wps365-obs.wpscdn.cn/download/Linux/${pkgver: -5}/wps-office_${pkgver}.AK.preload.sw"
source_x86_64=("${source_base}_amd64.deb")
source_aarch64=("${source_base}_arm64.deb")
source_loong64=("${source_base}_loongarch64.deb")
sha256sums_x86_64=('2df44881e8f490069fb1f384ff426de8e271bfbf34daf0a0bbb18a55416a6c70')
sha256sums_aarch64=('c1022a5adbed59a65507f83cf681cb54df8d4c911c85b08c14bcfcbf7831f79a')
sha256sums_loong64=('c2907521f594a1acb2a34fe9045bd46c0e0c96ac529edb9de1babcc892041e4e')

prepare() {
  xz -df data.tar.xz
}

_install() {
  tar --no-same-owner -C "${pkgdir}" -xf data.tar "$@"
}

package_wps-office-365() {
  conflicts=('wps-office')
  provides=('wps-office')

  _install --exclude ./usr/*xiezuo* --exclude ./usr/share/fonts \
    --exclude ./usr/share/desktop-directories \
    ./opt/kingsoft/wps-office/office6 ./usr

  # to save typing pkgdir
  cd "${pkgdir}"

  # use system lib
  rm opt/kingsoft/wps-office/office6/lib{jpeg,stdc++}.so*
  if [[ "$CARCH" = "aarch64" ]]; then
    # more stuffs are broken on ALARM, force these to use system library
    rm opt/kingsoft/wps-office/office6/addons/cef/libm.so*
    rm opt/kingsoft/wps-office/office6/libfreetype.so*
  fi

  # disable wpscloudsvr
  chmod -x opt/kingsoft/wps-office/office6/wpscloudsvr

  # fix template path
  sed -i 's|URL=.*|URL=/opt/kingsoft/wps-office/office6/mui/zh_CN/templates/newfile.docx|' \
    usr/share/templates/wps-office-wps-template.desktop
  sed -i 's|URL=.*|URL=/opt/kingsoft/wps-office/office6/mui/zh_CN/templates/newfile.xlsx|' \
    usr/share/templates/wps-office-et-template.desktop
  sed -i 's|URL=.*|URL=/opt/kingsoft/wps-office/office6/mui/zh_CN/templates/newfile.pptx|' \
    usr/share/templates/wps-office-wpp-template.desktop

  # fix menu category
  sed -i 's|Categories=.*|&Office;|' usr/share/applications/*.desktop

  # fix background process
  sed -i '2i [[ $(ps -ef | grep -c "office6/$(basename $0)") == 1 ]] && export gOptExt=-multiply' \
    usr/bin/{wps,wpp,et,wpspdf}

  # fix input method
  sed -i '2i [[ "$XMODIFIERS" == "@im=fcitx" ]] && export QT_IM_MODULE=fcitx' \
    usr/bin/{wps,wpp,et,wpspdf}

  # allow custom fontconfig
  sed -i '2i [[ -f ~/.config/Kingsoft/fonts/fonts.conf ]] && export FONTCONFIG_FILE=~/.config/Kingsoft/fonts/fonts.conf' \
    usr/bin/{wps,wpp,et,wpspdf}

  # fix xxx Njk0QkYtWVVEQkctRUFSNjktQlBSR0ItQVRRWEgK
  #sed -i 's|YUA..=NsbhfV4nLv_oZGENyLSVZA..|YUA..=WHfH10HHgeQrW2N48LfXrA..|' \
  #  opt/kingsoft/wps-office/office6/cfgs/oem.ini
  #install -dm777 opt/kingsoft/.auth/
}

package_wps-office-365-xiezuo() {
  _install --wildcards ./opt/xiezuo ./usr/*xiezuo*
}

package_wps-office-365-fonts() {
  conflicts=('wps-office-fonts')
  provides=('wps-office-fonts')
  _install ./etc/fonts ./usr/share/fonts
}
