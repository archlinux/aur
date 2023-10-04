# Maintainer: Sylvester Keil <sylvester@keil.or.at>

pkgname='tropy-bin'
pkgver='1.15.1'
pkgrel=1
pkgdesc='Explore your research photos'
arch=('x86_64')
url='https://tropy.org'
license=('AGPL3' 'custom')
depends=(
  'electron25'
  'gcc-libs'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'sh'
  'xdg-utils')
optdepends=()
makedepends=()
provides=('tropy')
conflicts=('tropy' 'tropy-appimage')
options=(!strip)

source=(
  'tropy.sh'
  "https://github.com/tropy/tropy/releases/download/v${pkgver}/tropy-${pkgver}-x64.tar.bz2")

sha256sums=('0fdf0fcaa4676bc3a2835a7ef6b4a9f6b809a37e48775f62d9f4fab52da43901'
            'e70c36afe58f0deeec0625c427330a2f5b6fc2577e81f142becd4525f81b2785')

package() {
  install -dm755 "${pkgdir}/usr/lib/tropy"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons"
  install -dm755 "${pkgdir}/usr/share/mime"
  install -dm755 "${pkgdir}/usr/share/metainfo"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}"
  install -Dm755 tropy.sh "${pkgdir}/usr/bin/tropy"
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
    LICENSE LICENSE.chromium.html LICENSE.third-party.txt
}
