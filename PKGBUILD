# Maintaincer: Horo <horo@yoitsu.moe>
# Contributor: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>
# Colaborator: Chun Yang <x@cyang.info>
# Colaborator: Jonhoo

pkgname=ghost
pkgver=0.7.9
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
        ghost.install)
noextract=($pkgname-$pkgver.zip)
sha512sums=('bbf4c3bad0350fded36d7f4d5b6bb50e284c3776b1f40756d30eedb202422b7b09ae886c9afbf64951d7ae8152f2d3f67d58f2083b301573159036bd3b394c28'
            '9028de4621c38bf83a22c1cbfa0529d6538516838d641730226fcc24487d654a7d8dcb0b45e455a0a697bd0a9dd80dfdbce6ca8ec1d2e895683ab35846dac10c'
            'c4cbd918bf050dbf4b77d5ff016836947351fb1f575359b19e0d6c0343275a253f0922e3be952a9e672c3d2659e67327f92c19573ff5e5fde7f68826afec6d8f')

# Note: You may need to log into ghost.org and download the zip file manually
# and place it inside the same directory as the PKGBUILD

package() {
    install -dm755 "$pkgdir/srv/ghost"
    cd "$pkgdir/srv/ghost"
    unzip "$srcdir/$pkgname-$pkgver.zip"
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
