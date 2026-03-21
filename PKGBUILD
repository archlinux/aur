# Maintainer: Jove Yu <yushijun110@gmail.com>
# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>
pkgbase=wps-office-365
pkgname=('wps-office-365' 'wps-office-365-xiezuo' 'wps-office-365-fonts')
pkgver=12.1.2.24730
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
source_base="https://pubwps-wps365-obs.wpscdn.cn/download/Linux/${pkgver: -5}/wps-office_${pkgver}.AK.preread.sw"
source_x86_64=("${source_base}_644359_amd64.deb")
source_aarch64=("${source_base}_644358_arm64.deb")
source_loong64=("${source_base}_625684_loongarch64.deb")
sha256sums_x86_64=('08d56554b77bfef97b8e10d022600708f091e6fb73f7d0d31c2b2eeb27acc11c')
sha256sums_aarch64=('a23dbc832a625fd15c66a091d42cdd9a0f8eaefe6bdde0c4a6b48bbb2e25bb40')
sha256sums_loong64=('d2b1fb745e225dc34e4712b3b29916dc99d76d5d5afd1ba3a559279b2a0b8003')

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
