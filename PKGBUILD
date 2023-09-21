# Maintainer: Sylvester Keil <sylvester@keil.or.at>

pkgname='tropy'
pkgver='1.14.0'
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

sha256sums=('0d9f2694407bd54552097fb620c4f7ca9fd885a8adc0a21a5ea63e368a8c672e'
            'b85d83fd8e28b8ed93f28f022366b1152bc83184dacaedd373ea7f911fbc7fb1')

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
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${srcdir}"
  install -Dm755 tropy.sh "${pkgdir}/usr/bin/tropy"

  cd "tropy-${pkgver}/dist/Tropy-linux-x64"
  install -m644 -t "${pkgdir}/usr/share/applications" tropy.desktop

  cd resources
  install -m644 -t "${pkgdir}/usr/lib/tropy/" app.asar
  cp -r app.asar.unpacked "${pkgdir}/usr/lib/tropy"

  find "${pkgdir}/usr/lib/tropy" -type d -print0 | xargs -I {} -0 chmod 755 "{}"
  find "${pkgdir}/usr/lib/tropy" -type f -print0 | xargs -I {} -0 chmod 644 "{}"

  cp -r mime "${pkgdir}/usr/share/" 
  cp -r icons "${pkgdir}/usr/share/" 

  find "${pkgdir}/usr/lib/tropy" -type d -print0 | xargs -I {} -0 chmod 755 "{}"
  find "${pkgdir}/usr/share" -type f -print0 | xargs -I {} -0 chmod 644 "{}"

  cd app.asar.unpacked
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
    LICENSE LICENSE.chromium.html LICENSE.third-party.txt
}
