# Maintainer: J. King <jking@jkingweb.ca>
pkgname="arsse-git"
pkgver=0.11.0
pkgrel=1
epoch=
pkgdesc="Multi-protocol RSS/Atom newsfeed synchronization server, bugfix-testing version"
arch=("any")
url="https://thearsse.com/"
license=("MIT")
provides=("arsse")
conflicts=("arsse")
depends=()
makedepends=("composer")
checkdepends=()
optdepends=("nginx: HTTP server"
            "apache>=2.4: HTTP server"
            "percona-server: Alternate database"
            "postgresql>=10: Alternate database"
            "php-pgsql-interpreter>=7.3: PostgreSQL database support")
backup=("etc/webapps/arsse/config.php"
        "etc/webapps/arsse/systemd-environment"
        "etc/php/php-fpm.d/arsse.conf"
        "etc/php-legacy/php-fpm.d/arsse.conf"
        "etc/webapps/arsse/nginx/example.conf"
        "etc/webapps/arsse/nginx/arsse.conf"
        "etc/webapps/arsse/nginx/arsse-loc.conf"
        "etc/webapps/arsse/nginx/arsse-fcgi.conf"
        "etc/webapps/arsse/apache/example.conf"
        "etc/webapps/arsse/apache/arsse.conf"
        "etc/webapps/arsse/apache/arsse-fcgi.conf"
        "etc/webapps/arsse/apache/arsse-loc.conf")
source=("git+https://code.mensbeam.com/MensBeam/arsse/")
md5sums=("SKIP")

pkgver() {
  cd "arsse"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/arsse"
    composer install --ignore-platform-reqs
    ./robo manual
    composer install --ignore-platform-reqs --no-dev -o --no-scripts
    php arsse.php conf save-defaults config.defaults.php
    rm -r vendor/bin
}

package() {
    # define runtime dependencies
    depends=("php-interpreter>=7.3" "php-sqlite-interpreter>=7.3" "php-fpm-interpreter>=7.3")
    # create most directories necessary for the final package
    cd "$pkgdir"
    mkdir -p "usr/share/webapps/arsse" "usr/share/doc/arsse" "usr/share/licenses/arsse" "usr/lib/systemd/system" "usr/lib/sysusers.d" "usr/lib/tmpfiles.d" "etc/php/php-fpm.d" "etc/php-legacy/php-fpm.d" "etc/webapps/arsse"
    # copy requisite files
    cd "$srcdir/arsse"
    cp -r lib locale sql vendor www CHANGELOG UPGRADING README.md arsse.php "$pkgdir/usr/share/webapps/arsse"
    cp -r manual/* "$pkgdir/usr/share/doc/arsse"
    cp LICENSE AUTHORS "$pkgdir/usr/share/licenses/arsse"
    cp dist/sysuser.conf "$pkgdir/usr/lib/sysusers.d/arsse.conf"
    cp dist/tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/arsse.conf"
    cp dist/php-fpm.conf "$pkgdir/etc/php/php-fpm.d/arsse.conf"
    cp -r dist/man "$pkgdir/usr/share"
    cp -r dist/nginx dist/apache config.defaults.php "$pkgdir/etc/webapps/arsse"
    # copy files requiring special permissions
    install -Dm640 dist/config.php "$pkgdir/etc/webapps/arsse"
    # patch generic configuration files to use Arch-specific paths and identifiers
    sed -i -se 's/\/\(etc\|usr\/share\)\/arsse\//\/\1\/webapps\/arsse\//g' "$pkgdir/etc/webapps/arsse/nginx/"* "$pkgdir/etc/webapps/arsse/apache/"* "$pkgdir/usr/lib/tmpfiles.d/arsse.conf"
    sed -i -se 's/\/var\/run\/php\//\/run\/php-fpm\//g' "$pkgdir/etc/webapps/arsse/nginx/"* "$pkgdir/etc/webapps/arsse/apache/"* "$pkgdir/etc/php/php-fpm.d/arsse.conf"
    sed -i -se 's/www-data/http/g' "$pkgdir/etc/php/php-fpm.d/arsse.conf"
    # make a duplicate PHP-FPM pool for php-legacy
    sed -se 's/php-fpm/php-fpm-legacy/' "$pkgdir/etc/php/php-fpm.d/arsse.conf" > "$pkgdir/etc/php-legacy/php-fpm.d/arsse.conf"
    # copy Arch-specific versions of files
    install -Dm755 dist/arch/arsse "$pkgdir/usr/bin/arsse"
    cp dist/arch/nginx-arsse-fcgi.conf "$pkgdir/etc/webapps/arsse/nginx/arsse-fcgi.conf"
    cp dist/arch/apache-arsse-fcgi.conf "$pkgdir/etc/webapps/arsse/apache/arsse-fcgi.conf"
    cp dist/arch/*.service "$pkgdir/usr/lib/systemd/system"
    cp dist/arch/systemd-environment "$pkgdir/etc/webapps/arsse/systemd-environment"
}

