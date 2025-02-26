# Maintainer: Jove Yu <yushijun110 [at] gmail.com>
# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>
pkgbase=wps-office-365
pkgname=('wps-office-365' 'wps-office-365-xiezuo' 'wps-office-365-fonts')
pkgver=12.8.2.19831
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
source_x86_64=("https://wps-linux-365.wpscdn.cn/wps/download/ep/Linux365/${pkgver: -5}/wps-office_${pkgver}.AK.preload.sw_amd64.deb")
source_aarch64=("https://wps-linux-365.wpscdn.cn/wps/download/ep/Linux365/${pkgver: -5}/wps-office_${pkgver}.AK.preload.sw_arm64.deb")
source_loong64=("https://wps-linux-365.wpscdn.cn/wps/download/ep/Linux365/${pkgver: -5}/wps-office_${pkgver}.AK.preload.sw_loongarch64.deb")
sha256sums_x86_64=('016afa12da8f360bc693106de12dfa155e55f224673b8158b83b9bb13fda27b1')
sha256sums_aarch64=('293cc93a2ae27e40a557b06a49dd97bb147fee7892a70a67190cff0c181b85fb')
sha256sums_loong64=('92ea37416fa236f99feafce94b6fa960b851f965af681a20f1db400b74aa106b')

prepare() {
  xz -df data.tar.xz
}

_install(){
  tar --no-same-owner -C "${pkgdir}" -xf data.tar "$@"
}

package_wps-office-365(){
  conflicts=('wps-office')
  provides=('wps-office')

  _install --exclude ./usr/*xiezuo* --exclude ./usr/share/fonts \
    --exclude ./usr/share/desktop-directories \
    ./opt/kingsoft/wps-office/office6 ./usr

  # to save typing pkgdir 
  cd "${pkgdir}"

  # remove file
  rm usr/bin/{wps_uninstall.sh,wps_xterm} \
    usr/share/applications/wps-office-uninstall.desktop

  # use system lib
  rm opt/kingsoft/wps-office/office6/lib{jpeg,stdc++}.so*
  if [[ "$CARCH" = "aarch64" ]]; then
    # more stuffs are broken on ALARM, force these to use system library
    rm opt/kingsoft/wps-office/office6/addons/cef/libm.so*
    rm opt/kingsoft/wps-office/office6/libfreetype.so*
  fi

  # fix python2 call
  sed -i "s/python -c 'import sys, urllib; print urllib\.unquote(sys\.argv\[1\])'/\
python -c 'import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]))'/" usr/bin/wps

  # fix template path
  sed -i 's|URL=.*|URL=/opt/kingsoft/wps-office/office6/mui/zh_CN/templates/newfile.docx|' \
    usr/share/templates/wps-office-wps-template.desktop
  sed -i 's|URL=.*|URL=/opt/kingsoft/wps-office/office6/mui/zh_CN/templates/newfile.xlsx|' \
    usr/share/templates/wps-office-et-template.desktop
  sed -i 's|URL=.*|URL=/opt/kingsoft/wps-office/office6/mui/zh_CN/templates/newfile.pptx|' \
    usr/share/templates/wps-office-wpp-template.desktop

  # fix menu category
  sed -i 's|Categories=.*|&Office;|' usr/share/applications/*.desktop
  sed -i '$a Categories=Office;' usr/share/applications/wps-office-officeassistant.desktop

  # fix background process
  sed -i '2i [[ $(ps -ef | grep -c "office6/$(basename $0)") == 1 ]] && export gOptExt=-multiply' usr/bin/{wps,wpp,et,wpspdf}

  # fix input method
  sed -i '2i [[ "$XMODIFIERS" == "@im=fcitx" ]] && export QT_IM_MODULE=fcitx' usr/bin/{wps,wpp,et,wpspdf}

  # allow custom fontconfig
  sed -i '2i [[ -f ~/.config/Kingsoft/fonts/fonts.conf ]] && export FONTCONFIG_FILE=~/.config/Kingsoft/fonts/fonts.conf' usr/bin/{wps,wpp,et,wpspdf}

  # fix xxx Njk0QkYtWVVEQkctRUFSNjktQlBSR0ItQVRRWEgK
  sed -i 's|YUA..=NsbhfV4nLv_oZGENyLSVZA..|YUA..=WHfH10HHgeQrW2N48LfXrA..|' \
    opt/kingsoft/wps-office/office6/cfgs/oem.ini
  install -dm777 opt/kingsoft/.auth/
}

package_wps-office-365-xiezuo(){
  _install --wildcards ./opt/xiezuo ./usr/*xiezuo*
}

package_wps-office-365-fonts(){
  conflicts=('wps-office-fonts')
  provides=('wps-office-fonts')
  _install ./etc/fonts ./usr/share/fonts
}
