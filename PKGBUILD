# Maintaincer: Horo <horo@yoitsu.moe>
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>
# Colaborator: Chun Yang <x@cyang.info>
# Colaborator: Jonhoo

pkgname=ghost
pkgver=0.8.0
pkgrel=1
pkgdesc="Free, open, simple blogging platform"
arch=('any')
url="http://ghost.org"
license=('MIT')
makedepends=('unzip')
depends=('nodejs>=0.12' 'npm' 'python')
backup=('srv/ghost/config.js')
install=ghost.install
source=(https://ghost.org/zip/$pkgname-$pkgver.zip
        ghost.service
        ghost.install
        package.json.patch
        npm-shrinkwrap.json.patch
       )
noextract=($pkgname-$pkgver.zip)
sha512sums=('b707c411a014d6aeb9de6bd297ba446e4c16fbd8077f6fd1cb03baf357f0d7a24449a66d75b956978bbb966ea7027664488761b2de82ff07686b3e29d2c686df'
            '9028de4621c38bf83a22c1cbfa0529d6538516838d641730226fcc24487d654a7d8dcb0b45e455a0a697bd0a9dd80dfdbce6ca8ec1d2e895683ab35846dac10c'
            'c4cbd918bf050dbf4b77d5ff016836947351fb1f575359b19e0d6c0343275a253f0922e3be952a9e672c3d2659e67327f92c19573ff5e5fde7f68826afec6d8f'
            '17e9c5572f4976af6e129ca20e66b8ef9aeb626b037d1d4b3de19a1dfa9d8feb7854d84dbfeba0e2056ed18cd05215fab5b7a0e05e4c1d67c17e4b58c4fe0483'
            'be732d99fd2326d103f67cc502eb4ea0ae3bc4b2b2b4d2a713eb1dac7ee5357e01cc05ec9f73762b687a44b39370cb0f05d362d560a5b06e2f6e1b65c3ccaf4e')

# Note: You may need to log into ghost.org and download the zip file manually
# and place it inside the same directory as the PKGBUILD

package() {
    install -dm755 "$pkgdir/srv/ghost"
    cd "$pkgdir/srv/ghost"
    unzip "$srcdir/$pkgname-$pkgver.zip"
    echo "Fixing sqlite3 to 3.1.4 ......"
    patch npm-shrinkwrap.json < $srcdir/npm-shrinkwrap.json.patch
    patch package.json < $srcdir/package.json.patch
    echo "Ingoring Ghost's Nodejs version check ......"
    export GHOST_NODE_VERSION_CHECK=false
    cp config.example.js config.js
    npm install --production
    install -Dm644 "$srcdir/ghost.service" "${pkgdir}/usr/lib/systemd/system/ghost.service"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/ghost/LICENSE"
    rm LICENSE

    chmod -R g=u "$pkgdir/srv/ghost"
    find "$pkgdir/srv/ghost" -type d -exec chmod g+s {} \;

    cat <<-EOF

	Upgrading Ghost involves replacing old files with the new files, and
	restarting the server. However, as the database, image uploads and
	custom themes are stored alongside Ghost in the content directory,
	care should be taken to only replace the necessary files as explained at
	http://support.ghost.org/how-to-upgrade/ .

	It is highly recommended that you make a backup of your data before
	upgrading. To backup all the data from your database, log into your
	Ghost install and go to /ghost/debug/. Press the export button to
	download a JSON file containing all of your data.

	EOF

    chown -R 738:738 "$pkgdir/srv/ghost"
}
