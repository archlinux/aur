# Maintainer: Jove Yu <yushijun110@gmail.com>
# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>
pkgbase=wps-office-365
pkgname=('wps-office-365' 'wps-office-365-xiezuo' 'wps-office-365-fonts')
pkgver=12.1.2.23578
pkgrel=4
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
source_x86_64=("${source_base}_542884_amd64.deb")
source_aarch64=("${source_base}_542882_arm64.deb")
source_loong64=("${source_base}_542880_loongarch64.deb")
sha256sums_x86_64=('cfb4ae150512e2cfaf11b8528685152a57dbffda113a67fc2168f9aa4c6a01ec')
sha256sums_aarch64=('4991d3356cafefa4d160fa0f0ddb582bccdc4b975127a8d9868c05d889e5d52c')
sha256sums_loong64=('2fb2f9f488cf5349fad0fa4e42398acb6048d8665069463addb5697324c457dd')

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
