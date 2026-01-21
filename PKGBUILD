# Maintainer: Sylvester Keil <sylvester@keil.or.at>

pkgname='tropy-bin'
pkgver='1.17.3'
pkgrel=1
pkgdesc='Explore your research photos'
arch=('x86_64')
url='https://tropy.org'
license=('AGPL-3.0-or-later')
depends=(
  'electron39'
  'gcc-libs'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'libvips'
  'sh'
  'xdg-utils')
optdepends=(
  'libheif: for heif support'
  'poppler-glib: for pdf support')
optdepends=()
makedepends=()
provides=('tropy')
conflicts=('tropy' 'tropy-appimage')
options=(!strip !debug)

source=(
  'tropy.sh'
  "https://github.com/tropy/tropy/releases/download/v${pkgver}/tropy-${pkgver}-x64-shared.tar.bz2")

sha256sums=('0dc0be3865d11e7f9afa95fb36cf9c18b4947ab83a360a29f55873c291404451'
            '83e131b850c8501e22dff87f5aaddc19b7c93059dd892a96e593702051bf2bff')

package() {
  install -dm755 "${pkgdir}/usr/lib/tropy"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons"
  install -dm755 "${pkgdir}/usr/share/mime"
  install -dm755 "${pkgdir}/usr/share/metainfo"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}"
  install -Dm755 tropy.sh "${pkgdir}/usr/bin/tropy"
  
  cd "tropy-${pkgver}-x64"
  install -m644 -t "${pkgdir}/usr/share/applications" \
    org.tropy.Tropy.desktop
  install -m644 -t "${pkgdir}/usr/share/metainfo" \
    org.tropy.Tropy.metainfo.xml

  cd resources
  install -m644 -t "${pkgdir}/usr/lib/tropy/" app.asar
  cp -r app.asar.unpacked "${pkgdir}/usr/lib/tropy"

  find "${pkgdir}/usr/lib/tropy" -type d -print0 | \
    xargs -I {} -0 chmod 755 "{}"
  find "${pkgdir}/usr/lib/tropy" -type f -print0 | \
    xargs -I {} -0 chmod 644 "{}"

  cp -r mime "${pkgdir}/usr/share/" 
  cp -r icons "${pkgdir}/usr/share/" 

  find "${pkgdir}/usr/share" -type d -print0 | \
    xargs -I {} -0 chmod 755 "{}"
  find "${pkgdir}/usr/share" -type f -print0 | \
    xargs -I {} -0 chmod 644 "{}"

  cd app.asar.unpacked
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
    LICENSE LICENSE.chromium.html
}
