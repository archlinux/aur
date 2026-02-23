# Maintainer: SteamedFish <steamedfish@hotmail.com>
#
# NOTE: Face detection (--faceDetection flag) is currently NOT supported due to
# opencv npm module incompatibility with OpenCV 4.x (Arch ships OpenCV 4.13).
# The opencv@6.2.0 npm package requires the legacy OpenCV C API which was removed
# in OpenCV 4.0. Future versions may add support via @u4/opencv4nodejs.
#
pkgname=smartcrop-cli
pkgver=2.0.3
pkgrel=1
pkgdesc="Command line interface for the smartcrop library to provide content aware image cropping"
arch=('any')
url="https://github.com/jwagner/smartcrop-cli"
license=('MIT')
depends=('nodejs' 'imagemagick')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jwagner/${pkgname}/archive/${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/jwagner/${pkgname}/master/LICENSE")
sha256sums=('6b62aed4d339068dfbefa47c865beca6ca4aa79670b88bdebb863fe9ef94ae96'
            '01951c4f7d8e7ce92540c4f575a2aec39738b39d25a06a96059d82ed83fb594e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Install dependencies (opencv is optional and will be skipped)
  npm install --cache "${srcdir}/npm-cache"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Create installation directories
  install -dm755 "${pkgdir}/usr/lib/node_modules/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  
  # Copy the application files (including built node_modules with opencv)
  cp -a --no-preserve=ownership package.json smartcrop-cli.js node_modules \
    "${pkgdir}/usr/lib/node_modules/${pkgname}/"
  
  # Create symlink for the binary
  ln -s "../lib/node_modules/${pkgname}/smartcrop-cli.js" "${pkgdir}/usr/bin/smartcrop"
  
  # Ensure the CLI script is executable
  chmod +x "${pkgdir}/usr/lib/node_modules/${pkgname}/smartcrop-cli.js"
  
  # Fix permissions (npm sets ownership to build user)
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  
  # Install license
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
