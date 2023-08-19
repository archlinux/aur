# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=eudic
pkgver=13.2.7
_date=2023-06-06
_lang=en
_flang=English
pkgrel=2
pkgdesc="Proprietary  ${_flang} dictionary software for linux"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/${pkgname}"
license=('unknown')
depends=(
         'hicolor-icon-theme'
         # 'qt5-speech'
         # 'qt5-webkit'
         )
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/${pkgname}.deb?v=${_date}")
options=('!strip')
sha512sums=('8ad2909a6beb5ad066cf73f8dd9c7160e627fa8b3220fcb6b32ab39d90f77d249042c98a722fa1d9b0a779a6efe67fc3b8950cf519cd2629bafe6ff9c1b9fcd7')

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
  sed -i 's|Name=欧路词典|Name=eudic\nName[zh_CN]=欧路词典|g' ${pkgdir}/usr/share/applications/eusoft-${pkgname}.desktop

  # qt plugin path
  # sed -i '4c Prefix = /usr/lib/qt/' \
  #        ${pkgdir}/usr/share/${_dirname}/qt.conf

  # remove unused files.
  # rm -rf ${pkgdir}/usr/share/${_dirname}/{gstreamer-1.0,lib,libcrypto.so.1.0.0,libssl.so.1.0.0,AppRun,plugins,lib*}
}
# vim: ts=2 sw=2 et:
