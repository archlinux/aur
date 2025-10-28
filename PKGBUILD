pkgname=cognito-local
pkgver=5.1.0
pkgrel=1
pkgdesc="Local emulator for Amazon Cognito"
arch=('x86_64')
url="https://github.com/jagregory/cognito-local"
license=('MIT')
depends=('nodejs' 'npm')
provides=('cognito-local')
conflicts=('cognito-local-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jagregory/cognito-local/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00cf6a89f31ec0c5bb8ccb079aaf412d383cce98939ad2d09ea9ea2ad49f77f2')

build() {
    cd "$pkgname-$pkgver"
    npm install --cache "${srcdir}/npm-cache"
    npm run build
}

package() {
    cd "$pkgname-$pkgver"
    
    # Install to /usr/lib/cognito-local
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r lib node_modules package.json "${pkgdir}/usr/lib/${pkgname}/"
    
    # Create symlink for the binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/lib/bin/start.js" "${pkgdir}/usr/bin/cognito-local"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
