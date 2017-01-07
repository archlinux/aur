# Maintainer: Dennis <dennis@stengele.me>
# Contributor: Horo <horo@yoitsu.moe>
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>
# Colaborator: Chun Yang <x@cyang.info>
# Colaborator: Jonhoo

pkgname=ghost
pkgver=0.11.3
pkgrel=2
pkgdesc="Free, open, simple blogging platform"
arch=('any')
url="http://ghost.org"
license=('MIT')
makedepends=('unzip')
depends=('nodejs>=0.12' 'npm' 'python')
backup=('etc/webapps/ghost/config.js')
install=ghost.install
source=(https://github.com/TryGhost/Ghost/releases/download/$pkgver/Ghost-$pkgver.zip
        ghost.service
        ghost.install
        ghost.config.js
       )
noextract=('Ghost-$pkgver.zip')
sha512sums=('380effec7433c92bc1b3c73ab321d33c4a1e7053f663c1ba7f58d5f340ba182339812969df6a81c90a53238d323265e00e398fd0acf457d69784500784e68d4b'
            '6d3b6a3dad615cca370666cd2b78971889d83c6a0789c061d06194d103ce17c7ec314862344250e1d8dbe8d6a41f14aad35a74c519fbcb25b024a8dce48049fe'
            '749bf64dcea81e2586daa865e4684f681d5eb5689636b08d6a694dc1be55cd134dd963b5922ef6e84c992ab7d83f730b2a9a97b624b3a68ecd8cfe69a2b380c4'
            '8776a445733d71402311016cb3822a6535e88ff7c9c9c520caa9a26b0ac32ad124cbc56948420942660343ffd60e5ff53ca553c17a640ce2cb41c9fff4156173')

package() {
    # Prepare directories
    install -dm755 "$pkgdir/usr/share/webapps/ghost"
    install -dm755 "$pkgdir/var/lib/ghost"

    cd "$pkgdir/usr/share/webapps/ghost"
    unzip "$srcdir/Ghost-$pkgver.zip"
    echo "Ingoring Ghost's Nodejs version check ......"
    export GHOST_NODE_VERSION_CHECK=false
    npm install --production
    install -Dm644 "$srcdir/ghost.service" "$pkgdir/usr/lib/systemd/system/ghost.service"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ghost/LICENSE"
    rm LICENSE

    # Set Config File
    mkdir -p "$pkgdir/etc/webapps/ghost"
    install -Dm644 "$srcdir/ghost.config.js" "$pkgdir/etc/webapps/ghost/config.js"
    ln -s "/etc/webapps/ghost/config.js" "$pkgdir/usr/share/webapps/ghost/config.js"

    # Install content Directory
    mv "$pkgdir/usr/share/webapps/ghost/content" "$pkgdir/var/lib/ghost/"

    chown -R 738:738 "$pkgdir/var/lib/ghost"
}
