# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=eshelper
pkgver=12.6.7
_date=2021-09-29
_lang=es
_flang=Spanish
pkgrel=1
pkgdesc="Proprietary  ${_flang} dictionary software for linux"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/${pkgname}"
license=('unknown')
depends=(
         'hicolor-icon-theme'
         'qt5-speech'
         'qt5-webkit'
         )
provides=("eudic-${_lang}")
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/${pkgname}.deb?v=${_date}")
sha256sums=('292b356cd6d53b6f450d783ad14b165f8f8fa75b6511e0f8241340f8a4a08f98')

# sometime use curl to download source deb, throws 404 not found. 
# user other UA instead of origion one fixed it.
# https://wiki.archlinux.org/index.php/Nonfree_applications_package_guidelines#Custom_DLAGENTS 
DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

prepare() {
  mkdir -p build

  tar -xf data.tar.xz -C build
}

package() {
  _dirname=eusoft-${pkgname}

  install -dm755 ${pkgdir}/usr/share

  cp -pvr build/usr/share/* ${pkgdir}/usr/share/ 
  
  # link executable
  install -dm755 ${pkgdir}/usr/bin/
  ln -s /usr/share/${_dirname}/${pkgname} \
        ${pkgdir}/usr/bin/${pkgname}

  # desktop entry
  sed -i "s|/usr/share/${_dirname}/AppRun|${pkgname}|g" \
         ${pkgdir}/usr/share/applications/eusoft-${pkgname}.desktop
  
  # qt plugin path
  sed -i '4c Prefix = /usr/lib/qt/' \
         ${pkgdir}/usr/share/${_dirname}/qt.conf
  
  # remove unused files.
  rm -rf ${pkgdir}/usr/share/${_dirname}/{gstreamer-1.0,lib,libcrypto.so.1.0.0,libssl.so.1.0.0,AppRun,plugins,lib*} 
}
# vim: ts=2 sw=2 et:
