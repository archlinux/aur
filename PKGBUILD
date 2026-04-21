# Maintainer: Stevezxc <stevezhou586 at gmail dot com>
# Maintainer: Jove Yu <yushijun110 [at] gmail.com>
# Maintainer: Guoxin "7Ji" Pu <pugokushin@gmail.com>
pkgbase=wps-office-365-edu
pkgname=('wps-office-365-edu' 'wps-office-365-edu-fonts')
pkgver=12.1.2.25882
pkgrel=1
pkgdesc="WPS Office for education."
arch=('x86_64' 'aarch64' 'loong64')
url="https://365.wps.cn/edu/home"
license=('LicenseRef-WPS-EULA')
makedepends=(
  'tar')
depends=('qt5-base' 'libxkbcommon-x11' 'libpulse' 'freetype2' 'libxrandr' 'gtk3' 'libxext' 'libxv' 'pango' 'libxcomposite' 'libx11' 'nspr' 'sqlite' 'wayland' 'libsm' 'libxdamage' 'sdl2-compat' 'libglvnd' 'xz' 'python' 'systemd-libs' 'libxtst' 'bzip2' 'curl' 'gcc-libs' 'at-spi2-core' 'gperftools' 'dbus' 'libxrender' 'mesa' 'qrencode' 'expat' 'libdrm' 'libcups' 'glib2' 'hicolor-icon-theme' 'libtool' 'libxfixes' 'nss' 'cairo' 'alsa-lib' 'gdk-pixbuf2' 'libxkbcommon' 'libusb' 'zlib' 'fontconfig' 'util-linux-libs' 'libice' 'libxcb' 'glibc')
optdepends=(
  'wps-office-365-edu-fonts: FZ TTF fonts provided by wps office 365 edu'
  'cups: for printing support')
options=(!strip !zipman !debug)
source_x86_64=("https://edu-download.wpscdn.cn/download/365edu/${pkgver}/wps-office_${pkgver}.AK.preload.sw.withsn.edu_666780_amd64.deb")
source_aarch64=("https://edu-download.wpscdn.cn/download/365edu/${pkgver}/wps-office_${pkgver}.AK.preload.sw.withsn.edu_666841_arm64.deb")
source_loong64=("https://edu-download.wpscdn.cn/download/365edu/${pkgver}/wps-office_${pkgver}.AK.preload.sw.withsn.edu_666842_loongarch64.deb")
sha256sums_x86_64=('da8ca8846b3f0f3bbc0031b15a9a8d3d0efc20f999a67ce006037be3b7d540f4')
sha256sums_aarch64=('fb9c8284dcc7477666732199ff209dd1fdf5a10da12c331ea93d1398c9f52dfa')
sha256sums_loong64=('a9d0ceccf087e853bdebae1d60e62acfa08ae806925aa719963d6c7bb5369a3a')

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
