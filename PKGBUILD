pkgname=cognito-local
pkgver=5.3.0
pkgrel=1
pkgdesc="Local emulator for Amazon Cognito"
arch=('x86_64')
url="https://github.com/jagregory/cognito-local"
license=('MIT')
depends=('nodejs' 'npm')
provides=('cognito-local')
conflicts=('cognito-local-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jagregory/cognito-local/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52a1f2b14dbe2e6906585d89aecc8f9dd99d6a96ffa3a115e314ab5c2cc7a03d')

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
