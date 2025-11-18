# Maintainer: Kaleb <vitor.guttler@edu.pucrs.br>
pkgname=cognito-local-git
pkgver=5.1.0.r0.g4b2c4c5
pkgrel=1
pkgdesc="Local emulator for Amazon Cognito (git version)"
arch=('x86_64')
url="https://github.com/jagregory/cognito-local"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git' 'npm')
provides=('cognito-local')
conflicts=('cognito-local')
source=("git+https://github.com/jagregory/cognito-local.git")
sha256sums=('SKIP')

pkgver() {
    cd "cognito-local"
    # Get the latest tag version and combine with revision count and short hash
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "cognito-local"
    npm install --cache "${srcdir}/npm-cache"
    npm run build
}

package() {
    cd "cognito-local"
    
    # Install to /usr/lib/cognito-local
    install -dm755 "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r lib node_modules package.json "${pkgdir}/usr/lib/${pkgname%-git}/"
    
    # Create symlink for the binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname%-git}/lib/bin/start.js" "${pkgdir}/usr/bin/cognito-local"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
