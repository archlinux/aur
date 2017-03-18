# Maintainer: Dennis <dennis@stengele.me>
# Contributor: Horo <horo@yoitsu.moe>
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>
# Colaborator: Chun Yang <x@cyang.info>
# Colaborator: Jonhoo

pkgname=ghost
pkgver=0.11.7
pkgrel=1
pkgdesc="Free, open, simple blogging platform"
arch=('any')
url="http://ghost.org"
license=('MIT')
makedepends=('unzip')
depends=('nodejs-lts-argon' 'npm' 'python')
backup=('etc/webapps/ghost/config.js')
install=ghost.install
source=(https://github.com/TryGhost/Ghost/releases/download/$pkgver/Ghost-$pkgver.zip
        ghost.service
        ghost.install
        ghost.config.js
       )
noextract=('Ghost-$pkgver.zip')
sha512sums=('d57fb60f5ff1abf745ce7d472b0e947ab1caa4aa02b3cbcd45f89fcd023d762ef4e323b6110745371f521db1c2934bff510e1381cc245269187f2892931486df'
            'b051b0aa53009d8fd1f4cbf8835a1c9e4ae63a3233e839c99066f7d230a53702ed2b9373452667f901940f734e490ffbfc58810a550eaba331c9d10578805acf'
            '749bf64dcea81e2586daa865e4684f681d5eb5689636b08d6a694dc1be55cd134dd963b5922ef6e84c992ab7d83f730b2a9a97b624b3a68ecd8cfe69a2b380c4'
            '7ea7c0dbaa01c15b69db48f6b802a2e0a5ebaf9ad59dc120e9530f72e294faa23492c338f7a84fa8ab946767041c43b4a4bb313e7f4d7bc4165059195b14a26e')

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
