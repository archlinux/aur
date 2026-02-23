# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=smartcrop-cli
pkgver=2.0.3
pkgrel=1
pkgdesc="Command line interface for the smartcrop library to provide content aware image cropping"
arch=('any')
url="https://github.com/jwagner/smartcrop-cli"
license=('MIT')
depends=('nodejs' 'imagemagick')
makedepends=('npm')
optdepends=('opencv: Face detection support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jwagner/${pkgname}/archive/${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/jwagner/${pkgname}/master/LICENSE")
sha256sums=('6b62aed4d339068dfbefa47c865beca6ca4aa79670b88bdebb863fe9ef94ae96'
            '01951c4f7d8e7ce92540c4f575a2aec39738b39d25a06a96059d82ed83fb594e')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  # Install dependencies locally
  npm install --production --cache "${srcdir}/npm-cache"
  
  # Create installation directories
  install -dm755 "${pkgdir}/usr/lib/node_modules/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"
  
  # Copy the application files
  cp -r package.json smartcrop-cli.js node_modules "${pkgdir}/usr/lib/node_modules/${pkgname}/"
  
  # Create symlink for the binary
  ln -s "../lib/node_modules/${pkgname}/smartcrop-cli.js" "${pkgdir}/usr/bin/smartcrop"
  
  # Ensure the CLI script is executable
  chmod +x "${pkgdir}/usr/lib/node_modules/${pkgname}/smartcrop-cli.js"
  
  # Install license (downloaded separately as it's not in the release tarball)
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
