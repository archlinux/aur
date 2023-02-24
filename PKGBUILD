# Maintainer: Polarian <polarian@polarian.dev>
# Co-Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>
# Contributor: Guillaume Friloux <guillaume@friloux.me>

pkgname=movim
pkgver=0.20
pkgrel=1
pkgdesc="Movim is a decentralized social network, written in PHP and HTML5 and based on the XMPP standard protocol."
arch=('any')
url='https://movim.eu'
license=('AGPL3')
depends=('php-gd' 'php-imagick')
optdepends=('postgresql: to use the postgresql database backend'
            'php-pgsql: php bindings for postgresql'
            'php-sqlite: php bindings for sqlite'
            'mariadb: to use the mysql database backend'
            'sqlite3: to use the sqlite database backend'
            'nginx: reverse proxy'
            'apache: reverse proxy'
            'php-fpm: PHP FactCGI process manager')
makedepends=('composer')
source=("$pkgname.tar.gz::https://github.com/movim/movim/archive/refs/tags/v$pkgver.tar.gz"
        'movim.env'
        'movim.service'
        'sysuser.conf'
        'tmpfiles.conf')
install=movim.install
backup=("etc/webapps/$pkgname/db.inc.php"
        "etc/movim.env")
sha256sums=('SKIP'
            '4b698a623d29172e7526b9b07bc18d691a68e513f464be9793273a43c086e541'
            'bd4d1a1700c0cbc5dee23a600b00f0eb6dad271aebb5d1f0c111b11b81687ccb'
            'c8b569f1eafb97d8d03bbaabb9b4d6ed3415f922a05a52bd865942676368f4c5'
            '79c738b22f5a4417b9f63ac15010ad2195ea8eb5be78535fee60a481ba3e6ac1')

build() {
    cd "$movim-$pkgver"
    XDG_CACHE_HOME="$srcdir/cache" composer install \
        --no-interaction --no-dev
}

package() {
    # Systemd files
    install -Dm640 "$srcdir/movim.env" "$pkgdir/etc/movim.env"
    install -Dm644 "$srcdir/movim.service" "$pkgdir/usr/lib/systemd/system/movim.service"
    install -Dm644 "$srcdir/sysuser.conf" "$pkgdir/usr/lib/sysusers.d/movim.conf"
    install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/movim.conf"

    install -m755 -d "$pkgdir/usr/share/webapps/$pkgname"

    cp -r app database lib locales public src vendor \
        "$pkgdir/usr/share/webapps/$pkgname"
    install -Dm644 CHANGELOG.md doap.xml INSTALL.md linker.php phinx.php \
        README.md VERSION "$pkgdir/usr/share/webapps/$pkgname"
    install -Dm755 daemon.php "$pkgdir/usr/share/webapps/$pkgname"

    # Configuration file
    install -m750 -d "$pkgdir/etc/webapps/$pkgname"
    install -Dm640 config/db.example.inc.php "$pkgdir/etc/webapps/$pkgname/db.inc.php"
}
