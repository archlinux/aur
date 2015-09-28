# Maintainer: Pedro Gabriel <pedrogabriel@dcc.ufmg.br>
# Colaborator: Chun Yang <x@cyang.info>
# Colaborator: Jonhoo

pkgname=ghost
pkgver=0.7.1
pkgrel=1
pkgdesc="Free, open, simple blogging platform"
arch=('any')
url="http://ghost.org"
license=('MIT')
makedepends=('unzip' 'npm' 'java-environment')
depends=('nodejs>=0.12')
backup=('srv/ghost/Gruntfile.js' 'srv/ghost/index.js' 'srv/ghost/package.json')
install=ghost.install
source=(http://ghost.org/zip/$pkgname-$pkgver.zip
  ghost.service
	new-node.patch)
noextract=($pkgname-$pkgver.zip)
sha256sums=('aeae4b83553633df4ef3fe6bd97479b6082e3e6f752a263b61957cca3a365e10'
            'f6ddfd93a839cadcc34b8b5971948aebad2ab3989210ac04c66b8d681e11d3ee'
            '739766e9c0e0b72b7131a3906cacac72e01e0b4aa59f6b17e7f16fa52723583c')

# Note: You may need to log into ghost.org and download the zip file manually
# and place it inside the same directory as the PKGBUILD

package() {
    install -dm755 "$pkgdir/srv/ghost"
    cd "$pkgdir/srv/ghost"

    # bsdtar is giving an error with the package
    #   ./: Can't remove already-existing dir
    #   bsdtar: Error exit delayed from previous errors.
    # bsdtar -xf "$srcdir/$pkgname-$pkgver.zip"
    unzip "$srcdir/$pkgname-$pkgver.zip"
    patch "$pkgdir/srv/ghost/package.json" < "$srcdir/new-node.patch"
    rm "$pkgdir/srv/ghost/npm-shrinkwrap.json"
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
