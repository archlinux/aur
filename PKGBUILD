# Maintainer: J. King <jking@jkingweb.ca>
pkgname="arsse"
pkgver=0.9.2
pkgrel=1
epoch=
pkgdesc="Multi-protocol RSS/Atom newsfeed synchronization server"
arch=("any")
url="https://thearsse.com/"
license=("MIT")
depends=()
makedepends=()
checkdepends=()
optdepends=("nginx: HTTP server"
            "apache>=2.4: HTTP server"
            "percona-server: Alternate database"
            "postgresql>=10: Alternate database"
            "php-pgsql>=7.1: PostgreSQL database support")
backup=("etc/webapps/arsse/config.php"
        "etc/php/php-fpm.d/arsse.conf"
        "etc/webapps/arsse/nginx/example.conf"
        "etc/webapps/arsse/nginx/arsse.conf"
        "etc/webapps/arsse/nginx/arsse-loc.conf"
        "etc/webapps/arsse/nginx/arsse-fcgi.conf"
        "etc/webapps/arsse/apache/example.conf"
        "etc/webapps/arsse/apache/arsse.conf"
        "etc/webapps/arsse/apache/arsse-loc.conf")
source=("$pkgname-$pkgver.tar.gz::https://thearsse.com/releases/$pkgver")
md5sums=('4cf5fbe6e0a303b09ea4659c1b0ae7ed')

package() {
    # define runtime dependencies
    depends=("php>=7.1" "php-intl>=7.1" "php-sqlite>=7.1" "php-fpm>=7.1")
    # create most directories necessary for the final package
    cd "$pkgdir"
    mkdir -p "usr/share/webapps/arsse" "usr/share/doc/arsse" "usr/share/licenses/arsse" "usr/lib/systemd/system" "usr/lib/sysusers.d" "usr/lib/tmpfiles.d" "etc/php/php-fpm.d/" "etc/webapps/arsse" "etc/webapps/arsse/nginx"
    #copy requisite files
    cd "$srcdir/arsse"
    cp -r lib locale sql vendor www CHANGELOG UPGRADING README.md arsse.php "$pkgdir/usr/share/webapps/arsse"
    cp -r manual/* "$pkgdir/usr/share/doc/arsse"
    cp LICENSE AUTHORS "$pkgdir/usr/share/licenses/arsse"
    cp dist/systemd/* "$pkgdir/usr/lib/systemd/system"
    cp dist/sysuser.conf "$pkgdir/usr/lib/sysusers.d/arsse.conf"
    cp dist/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/arsse.conf"
    cp dist/php-fpm.conf "$pkgdir/etc/php/php-fpm.d/arsse.conf"
    cp -r dist/nginx dist/apache config.defaults.php "$pkgdir/etc/webapps/arsse"
    cd "$pkgdir"
    # copy files requiring special permissions
    cd "$srcdir/arsse"
    install -Dm755 dist/arsse "$pkgdir/usr/bin/arsse"
    install -Dm640 dist/arch/config.php "$pkgdir/etc/webapps/arsse"
    # patch generic configuration files to use Arch-specific paths and identifiers
    sed -i -se 's/\/\(etc\|usr\/share\)\/arsse\//\/\1\/webapps\/arsse\//g' "$pkgdir/etc/webapps/arsse/nginx/"* "$pkgdir/etc/webapps/arsse/apache/"* "$pkgdir/usr/lib/tmpfiles.d/arsse.conf" "$pkgdir/usr/lib/systemd/system/"* "$pkgdir/usr/bin/"*
    sed -i -se 's/\/var\/run\/php\//\/run\/php-fpm\//g' "$pkgdir/etc/webapps/arsse/nginx/"* "$pkgdir/etc/webapps/arsse/apache/"* "$pkgdir/etc/php/php-fpm.d/arsse.conf"
    sed -i -se 's/www-data/http/g' "$pkgdir/etc/php/php-fpm.d/arsse.conf"
    sed -i -e 's/^WorkingDirectory=.*$/WorkingDirectory=\/usr\/share\/webapps\/arsse/g' -e 's/^ConfigurationDirectory=.*$/ConfigurationDirectory=webapps\/arsse/g' "$pkgdir/usr/lib/systemd/system/arsse-fetch.service"
}
