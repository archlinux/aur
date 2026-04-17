# Maintainer: Jove Yu <yushijun110@gmail.com>
# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>
pkgbase=wps-office-365
pkgname=('wps-office-365' 'wps-office-365-xiezuo' 'wps-office-365-fonts')
pkgver=12.1.2.25882
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
  'libxslt' 'libjpeg-turbo' 'libpng' 'freetype2')
optdepends=(
  'wps-office-365-fonts: FZ TTF fonts provided by wps office 365'
  'cups: for printing support')
options=(!strip !zipman !debug)
source_base="https://pubwps-wps365-obs.wpscdn.cn/download/Linux/${pkgver: -5}/wps-office_${pkgver}.AK.preread.sw.365"
source_x86_64=("${source_base}_667345_amd64.deb")
source_aarch64=("${source_base}_667348_arm64.deb")
source_loong64=("${source_base}_667352_loongarch64.deb")
sha256sums_x86_64=('a5e54fc657b50fee4d7c08f44da2a12080d1acea9857a1db4877eb3355dd2631')
sha256sums_aarch64=('5e8834f9325a623a8f540a29b4a3b31cd24fadf5dd34a0c4734a988117119f20')
sha256sums_loong64=('a08c83a9340b8fd27bbf20c5912dbc1a57cb8b2ca0e4099d384b981f69226c26')

prepare() {
  xz -df data.tar.xz
}

_install() {
  tar --no-same-owner -C "${pkgdir}" -xf data.tar "$@"
}

package_wps-office-365() {
  conflicts=('wps-office')
  provides=('wps-office')

  _install --exclude ./usr/*xiezuo* \
          --exclude ./usr/share/fonts \
          --exclude ./usr/share/desktop-directories \
          --exclude ./usr/share/templates \
          ./opt/kingsoft/wps-office/office6 \
          ./usr

  # to save typing pkgdir
  cd "${pkgdir}"

  # use system lib
  rm opt/kingsoft/wps-office/office6/lib{jpeg,stdc++}.so*
  if [[ "$CARCH" = "aarch64" ]]; then
    # more stuffs are broken on ALARM, force these to use system library
    rm opt/kingsoft/wps-office/office6/addons/cef/libm.so*
    rm opt/kingsoft/wps-office/office6/libfreetype.so*
  fi

  # fix menu category
  sed -i 's|Categories=.*|&Office;|' usr/share/applications/*.desktop

  # fix input method
  sed -i '2i [[ "$XMODIFIERS" == "@im=fcitx" ]] && export QT_IM_MODULE=fcitx' \
    usr/bin/{wps,wpp,et,wpspdf}

  # allow custom fontconfig
  sed -i '2i [[ -f ~/.config/Kingsoft/fonts/fonts.conf ]] && export FONTCONFIG_FILE=~/.config/Kingsoft/fonts/fonts.conf' \
    usr/bin/{wps,wpp,et,wpspdf}

  # disable force login
  sed -i '2i sed -i "s/enableForceLogin=true/enableForceLogin=false/" $HOME/.config/Kingsoft/Office.conf' \
    usr/bin/{wps,wpp,et,wpspdf}

  # fix bsdtar warning
  export LC_ALL=en_US.UTF-8
}

package_wps-office-365-xiezuo() {
  _install --wildcards ./opt/xiezuo ./usr/*xiezuo*
}

package_wps-office-365-fonts() {
  conflicts=('wps-office-fonts')
  provides=('wps-office-fonts')
  _install ./etc/fonts ./usr/share/fonts
}
