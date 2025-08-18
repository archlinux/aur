# Maintainer: yifwon <wyf9661 [at] gmail.com>
pkgname=('wps-office-bin')
pkgver=12.1.2.22570
pkgrel=2
pkgdesc="WPS Office, is an office productivity suite."
arch=('x86_64')
url="https://linux.wps.cn"
# considering https://github.com/microcai/gentoo-zh/blob/996092a2363f05082ccc4297896a3e82a5bb7680/app-office/wps-office/wps-office-12.1.0.17900.ebuild#L12C58-L12C79
_srcurl="https://dogfood.gnupg.uk/wps302"
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
conflicts=(${pkgname%-bin})
provides=(${pkgname%-bin})
options=(!strip !zipman !debug)

source_x86_64=("${pkgname%-bin}_${pkgver}_amd64.deb::${_srcurl}/${pkgver}/amd64")
sha1sums_x86_64=('2c96e17f862e033662ce598ad0b9472fcb4f68cc')

package(){
  xz -df data.tar.xz
  tar --no-same-owner -C "${pkgdir}" -xf data.tar --exclude './usr/share/fonts'\
  --exclude './usr/share/desktop-directories' ./opt/kingsoft ./usr

  cd "${pkgdir}"
  # use system lib
  rm opt/kingsoft/wps-office/office6/lib{jpeg,stdc++}.so*

  # fix desktop icons group
  for _application in usr/share/applications/*.desktop; do
    sed -i '/^Categories=/s/Qt;/Office;/' "${_application}"
  done

  # fix python2 call
  sed -i "s/python -c 'import sys, urllib; print urllib\.unquote(sys\.argv\[1\])'/\
  python -c 'import sys, urllib.parse; print(urllib.parse.unquote(sys.argv[1]))'/" usr/bin/wps
}


