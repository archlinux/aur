# Maintainer: yifwon <wyf9661 [at] gmail.com>
pkgbase=wps-office-bin
pkgname=('wps-office-bin')
pkgver=12.1.0.17900
pkgrel=1
pkgdesc="WPS Office, is an office productivity suite."
arch=('x86_64')
url="https://linux.wps.cn"
license=('LicenseRef-WPS-EULA')
makedepends=(
  'tar')
depends=(
  'fontconfig' 'libxrender' 'xdg-utils' 'glu'
  'libpulse' 'libxss' 'sqlite' 'libtool' 'libtiff'
  'libxslt' 'freetype2')
optdepends=(
  'wps-office-fonts: FZ TTF fonts provided by wps office'
  'cups: for printing support'
  'libjpeg-turbo: JPEG image codec support'
  'libpng12: PNG image codec support'
  'ttf-wps-fonts: Symbol fonts required by wps-office'
  'ttf-ms-fonts: Microsft Fonts recommended for wps-office')
conflicts=('wps-office')
provides=('wps-office')
options=(!strip !zipman !debug)

# https://gitlab.com/cwittlut/wps-tsk/-/blob/main/tsk.sh?ref_type=heads by Ryan Tsien
# https://pastebin.com/29TeRUMj by Asuka Minato
_get_source_url() {
    url="https://wps-linux-personal.wpscdn.cn/wps/download/ep/Linux2023/${pkgver##*.}/wps-office_${pkgver}_$1.deb"
    uri="${url#https://wps-linux-personal.wpscdn.cn}"
    secrityKey='7f8faaaa468174dc1c9cd62e5f218a5b'
    timestamp10=$(date '+%s')
    md5hash=$(echo -n "${secrityKey}${uri}${timestamp10}" | md5sum)
    url+="?t=${timestamp10}&k=${md5hash%% *}"
    echo "$url"
}

source_x86_64=("wps-office_${pkgver}_amd64.deb::$(_get_source_url amd64)")
sha1sums_x86_64=('a245fe88c25d0992fb6d2b1e37ba99dc15fe2a5f')

package(){
  xz -df data.tar.xz
  tar --no-same-owner -C "${pkgdir}" -xf data.tar --exclude './usr/share/fonts'\
  --exclude './usr/share/desktop-directories' ./opt/kingsoft ./usr

  cd "${pkgdir}"
  # use system lib
  rm opt/kingsoft/wps-office/office6/lib{jpeg,stdc++}.so*

  # fix python2 call
  sed -i "s/python -c 'import sys, urllib; print urllib\.unquote(sys\.argv\[1\])'/\
  python -c 'import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]))'/" usr/bin/wps
}


