# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
# Maintainer: Jove Yu <yushijun110 [at] gmail.com>
# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>
pkgbase=wps-office-365-edu
pkgname=('wps-office-365-edu' 'wps-office-365-edu-fonts')
pkgver=12.1.2.23578
pkgrel=1
pkgdesc="WPS Office for education."
arch=('x86_64' 'aarch64' 'loong64')
url="https://365.wps.cn/edu/home"
license=('LicenseRef-WPS-EULA')
makedepends=(
  'tar')
depends=(
  'fontconfig' 'libxrender' 'xdg-utils' 'glu'
  'libpulse' 'libxss' 'sqlite' 'libtool' 'libtiff'
  'libxslt' 'libjpeg-turbo' 'libpng12' 'freetype2'
  'gdk-pixbuf2' 'libxtst' 'gtk3' 'qrencode' 'nspr' 'qt5-base' 'libcups' 'pango' 'cairo' 'fuse3' 'sdl2-compat' 'libusb' 'libxkbcommon-x11' 'libxfixes' 'nss' 'at-spi2-core' 'hicolor-icon-theme' 'libxv' 'libxkbcommon' 'libxrandr' 'libxcomposite' 'libxdamage' 'python' 'gperftools')
optdepends=(
  'wps-office-365-edu-fonts: FZ TTF fonts provided by wps office 365 edu'
  'cups: for printing support')
options=(!strip !zipman !debug)
source_x86_64=("https://pubwps-wps365-obs.wpscdn.cn/download/Linux/365edu/${pkgver}/wps-office_${pkgver}.AK.preload.sw.withsn_amd64.deb")
source_aarch64=("https://pubwps-wps365-obs.wpscdn.cn/download/Linux/365edu/${pkgver}/wps-office_${pkgver}.AK.preload.sw.withsn_arm64.deb")
source_loong64=("https://pubwps-wps365-obs.wpscdn.cn/download/Linux/365edu/${pkgver}/wps-office_${pkgver}.AK.preload.sw.withsn_loongarch64.deb")
sha256sums_x86_64=('e61f94e641d9ae02e1d205ddfd4de150bf4e9ad1e54ede471ff06de273e6ba02')
sha256sums_aarch64=('42335c0c28badf679cb5624b45151442caedfab184410d2527ab89dc9c69d39c')
sha256sums_loong64=('0b55c335043e5bff435ce5566383e56892cef352759f26dd5d081f2f14bae5df')

prepare() {
  xz -df data.tar.xz
}

_install(){
  tar --no-same-owner -C "${pkgdir}" -xf data.tar "$@"
}

package_wps-office-365-edu(){
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
  sed -i '2i [[ $(ps -ef | grep -c "office6/$(basename $0)") == 1 ]] && gOptExt=-multiply' usr/bin/{wps,wpp,et,wpspdf}

  # fix input method
  sed -i '2i [[ "$XMODIFIERS" == "@im=fcitx" ]] && export QT_IM_MODULE=fcitx' usr/bin/{wps,wpp,et,wpspdf}

  # fix xxx Njk0QkYtWVVEQkctRUFSNjktQlBSR0ItQVRRWEgK
  sed -i 's|YUA..=NsbhfV4nLv_oZGENyLSVZA..|YUA..=WHfH10HHgeQrW2N48LfXrA..|' \
    opt/kingsoft/wps-office/office6/cfgs/oem.ini
  install -dm777 opt/kingsoft/.auth/
}

#package_wps-office-365-edu-xiezuo(){
#  _install --wildcards ./opt/xiezuo ./usr/*xiezuo*
#}

package_wps-office-365-edu-fonts(){
  conflicts=('wps-office-fonts')
  provides=('wps-office-fonts')
  _install ./etc/fonts ./usr/share/fonts
}
