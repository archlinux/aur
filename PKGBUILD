# Maintainer: Sylvester Keil <sylvester@keil.or.at>

pkgname='tropy'
pkgver='1.16.2'
pkgrel=2
pkgdesc='Explore your research photos'
arch=('x86_64')
url='https://tropy.org'
license=('AGPL-3.0-or-later')
depends=(
  'electron34'
  'gcc-libs'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'libvips'
  'sh'
  'xdg-utils')
optdepends=(
  'libheif: for heif support'
  'imagemagick: for loading loading images via imagemagick'
  'poppler-glib: for pdf support')
makedepends=(
  'nodejs'
  'python3')

provides=('tropy')
conflicts=('tropy-bin' 'tropy-appimage')

source=(
  'tropy.sh'
  "https://github.com/tropy/tropy/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('080928f5d2ca7e5e5db55e959f1dc62e15e2906fe2f5838b150d1814263b6fd0'
            '03cad845625f6ae8e44cba1add522090212bf1c4607f51b234b375eda56054de')

build() {
  cd "${srcdir}/tropy-${pkgver}"
  npm clean-install --no-progress 2&> /dev/null
  npm run rebuild -- --force --global-libvips
  npm run build
}

package() {
  install -dm755 "${pkgdir}/usr/lib/tropy"
  install -dm755 "${pkgdir}/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/icons"
  install -dm755 "${pkgdir}/usr/share/mime"
  install -dm755 "${pkgdir}/usr/share/metainfo"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}"
  install -Dm755 tropy.sh "${pkgdir}/usr/bin/tropy"

  cd "tropy-${pkgver}/dist/Tropy-linux-x64"
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
