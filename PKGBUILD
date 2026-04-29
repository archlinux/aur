# Maintainer: kumen
# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname="stm32cubemonitor"
_pkgname="STM32CubeMon"
_pkg_file_name="stm32cubemon-lin-v-1-12-0.zip"
pkgver=1.12.0
pkgrel=1
pkgdesc="Monitoring tool to test STM32 applications at run-time"
arch=('x86_64')
url="https://www.st.com/en/development-tools/stm32cubemonitor.html"
license=('custom:SLA0048')
# package stlink provides stlink udev files
depends=('gtk3' 'nss' 'libxss' 'libnotify' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'stlink')
options=('!strip')

if [ ! -f ${PWD}/${_pkg_file_name} ]; then
	echo ""
	echo "Package not found!"
	echo "The ${pkgname} can be downloaded here: ${url}"
	echo "Please remember to put a downloaded package ${_pkg_file_name} into the build directory (${PWD}) before build."
	echo ""
fi

DLAGENTS=("https::/usr/bin/curl -gqb '' --retry 3 --retry-delay 3 -H "@${srcdir}http_headers" -o %o -L --compressed %u")
              
source=("local://${_pkg_file_name}"
      	"http_headers")
sha256sums=('f9596c0d33e5376d7fa0c6f94cd4009cd201f3e67e16f6ee0b96529bc5c22fe1'
            '177c920f68668f7a435e952b265163fe25376ae6332dcb4f924931370b113fed')

prepare() {
  install -dm755 build

  bsdtar -xf ${srcdir}/${pkgname}_${pkgver}_amd64.deb -C build
}

package() {
  tar -xf build/data.tar.zst -C ${pkgdir}
  
  install -dm755 ${pkgdir}/opt
  mv ${pkgdir}/usr/lib/${pkgname} ${pkgdir}/opt
  rm -rf ${pkgdir}/usr/lib
  rm -rf ${pkgdir}/usr/share/lintian

  # soft link
  ln -fs /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

  # license
  for _license in ${srcdir}/licenses/*
  do
    install -Dm644 "${_license}" -t ${pkgdir}/usr/share/licenses/${pkgname}/
  done 
}

#
# makepkg --printsrcinfo > .SRCINFO
#

# vim: set sw=2 ts=2 et:
