# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=connective-http
pkgver=1.0.0

pkgrel=31
pkgdesc="Connective -- Lightweight Java HTTP Server"
arch=( 'any' )
url=""
license=('GPL2')
groups=( "connective-server" )
depends=( 'java-environment>=15.0' 'authbind' )
makedepends=( 'gradle>=6.7' )
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=main.install
changelog=
source=("git+https://aerialworks.ddns.net/ASF/ConnectiveStandalone.git" "scripts-and-configs.tar.gz")
noextract=()
md5sums=('SKIP' 'ae6c8a62f6b863a86b7981883351f0dd')

build() {
    cd ConnectiveStandalone
    gradle build
}

package() {
    chmod +x credtool.sh
    chmod +x start.sh
    
    mkdir "$pkgdir/usr/bin" -p
    mkdir "$pkgdir/usr/lib/connective-http" -p
    mkdir "$pkgdir/usr/lib/connective-http/libs" -p
    mkdir "$pkgdir/usr/lib/systemd/system" -p
    mkdir "$pkgdir/etc/connective-http" -p
    mkdir "$pkgdir/etc/connective-http/credentials" -p
    
    cp -rf "$srcdir/ConnectiveStandalone/build/Installations/"*.jar "$pkgdir/usr/lib/connective-http"
    cp -rf "$srcdir/ConnectiveStandalone/build/Installations/libs" "$pkgdir/usr/lib/connective-http"
    rm -rf "$srcdir/ConnectiveStandalone/build"
    
    chmod 775 "$pkgdir/etc/connective-http"
    chmod 770 "$pkgdir/etc/connective-http/credentials"
    
    cp config.props "$pkgdir/etc/connective-http"
    
    cp start.sh "$pkgdir/usr/bin/connective-http"
    cp credtool.sh "$pkgdir/usr/bin/credtool"
    
    cp service.service "$pkgdir/usr/lib/systemd/system/connective-http.service"
}
