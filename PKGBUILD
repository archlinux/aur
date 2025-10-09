# Maintainer: sukanka <su975853527 at gmail dot com>

pkgname=frhelper
pkgver=13.5.2
_date=2024-08-25
_lang=fr
_flang=French
pkgrel=2
pkgdesc="Proprietary  ${_flang} dictionary software for linux"
arch=('x86_64')
url="https://www.eudic.net/v4/${_lang}/app/${pkgname}"
license=('unknown')
depends=(
  'hicolor-icon-theme'
)
provides=("eudic-${_lang}")
source=("${pkgname}-${pkgver}.deb::https://static.frdic.com/pkg/${pkgname}.deb?v=${_date}")
sha512sums=('cf62206e13afdbce2dd75e9b077ec6a73717138536ac25a64496ba74ba7fb79da3194534cf7e2fe8765f377552a529465f6c922199bf2766cda260346996028a')

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



  # remove unused files.
  rm -rf ${pkgdir}/usr/share/${_dirname}/{gstreamer-1.0,libcrypto.so.1.0.0,libssl.so.1.0.0,AppRun,lib*.so*}
  # keep qt lib and plugins
  pushd ${pkgdir}/usr/share/${_dirname}/lib
    find . -not -name 'libQt*' -not -name 'libicu*' -type f -delete
  popd
}
# vim: ts=2 sw=2 et:
