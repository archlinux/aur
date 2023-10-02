# Maintainer: Sylvester Keil <sylvester@keil.or.at>

pkgname='tropy-bin'
pkgver='1.14.0'
pkgrel=2
pkgdesc='Explore your research photos'
arch=('x86_64')
url='https://tropy.org'
license=('AGPL3' 'custom')
depends=(
  'electron25'
  'gcc-libs'
  'glib2'
  'glibc'
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
            'a78f1d725d526bd40f9101c3576e007a41ddc8002776715a332e867cb30bb2b8')

package() {
  install -dm755 "${pkgdir}/usr/lib/tropy"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons"
  install -dm755 "${pkgdir}/usr/share/mime"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}"
  install -Dm755 tropy.sh "${pkgdir}/usr/bin/tropy"
  install -m644 -t "${pkgdir}/usr/share/applications" tropy.desktop

  cd resources
  install -m644 -t "${pkgdir}/usr/lib/tropy/" app.asar
  cp -r app.asar.unpacked "${pkgdir}/usr/lib/tropy"

  find "${pkgdir}/usr/lib/tropy" -type d -print0 | xargs -I {} -0 chmod 755 "{}"
  find "${pkgdir}/usr/lib/tropy" -type f -print0 | xargs -I {} -0 chmod 644 "{}"

  cp -r mime "${pkgdir}/usr/share/" 
  cp -r icons "${pkgdir}/usr/share/" 

  find "${pkgdir}/usr/share" -type d -print0 | xargs -I {} -0 chmod 755 "{}"
  find "${pkgdir}/usr/share" -type f -print0 | xargs -I {} -0 chmod 644 "{}"

  cd app.asar.unpacked
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
    LICENSE LICENSE.chromium.html LICENSE.third-party.txt
}
