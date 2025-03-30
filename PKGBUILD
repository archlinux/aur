# Maintainer: Giorgi Taba K'obakhidze <t@gtk.ge>
# Contributor: Polarian <polarian@polarian.dev>
# Contributor: Maxime "pep" Buquet <archlinux@bouah.net>
# Contributor: Guillaume Friloux <guillaume@friloux.me>

pkgname=movim
pkgver=0.29.2
pkgrel=4
pkgdesc="Movim is a decentralized social network, written in PHP and HTML5 and based on the XMPP standard protocol."
arch=('any')
url='https://movim.eu'
license=('AGPL3')
options=('!strip')
depends=('php-gd' 'php-imagick')
optdepends=('postgresql: to use the postgresql database backend'
            'php-pgsql: php bindings for postgresql'
            'mariadb: to use the mysql database backend'
            'nginx: reverse proxy'
            'apache: reverse proxy'
            'php-fpm: PHP FactCGI process manager')
makedepends=('composer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/movim/movim/archive/refs/tags/v$pkgver.tar.gz"
        'movim-service.patch'
        'apache-movim-conf.patch'
        'movim-env.patch'
        'sysuser.conf'
        'tmpfiles.conf')
install=movim.install
backup=("etc/$pkgname.env"
        etc/apache2/conf-available/movim.conf)
sha256sums=('c461440598c2d5306260eeebf90b857c2e146f36692bbe2b2127b83a7701135b'
            'bfb75340e78c05354200763e077c7d1abca3a2b1f45ad141e6a7193cacc234d9'
            '7011ad7c667b4fc4b46f382fa5170fd8eff5796304b5eadcce1ef085d0aa3e36'
            'f5d49e7ddc42650ef8651075320cce16a4a81735efa12dc433276b3518979331'
            'c8b569f1eafb97d8d03bbaabb9b4d6ed3415f922a05a52bd865942676368f4c5'
            '66ebe7994ad74d268d17a743eb0c265332b51dddec01391f7cf1e8923d9aab04')

build() {
        cd "$pkgname-$pkgver" && XDG_CACHE_HOME="$srcdir/cache" composer install \
        --no-interaction --no-dev
}

package() {
    # Systemd files
    install -Dm644 "sysuser.conf" "$pkgdir/usr/lib/sysusers.d/movim.conf"
    #TODO: root as group? webapps subdir (https://gitlab.archlinux.org/archlinux/packaging/packages/nextcloud/-/blob/main/nextcloud.tmpfiles?ref_type=heads)?
    install -Dm644 "tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/movim.conf"

    install -m755 -d "$pkgdir/usr/share/webapps/$pkgname"
    cd "$pkgname-$pkgver"

    cp -r app config database locales public src vendor \
        "$pkgdir/usr/share/webapps/$pkgname"
    install -Dm644 CHANGELOG.md doap.xml linker.php phinx.php composer.json composer.lock \
        VERSION "$pkgdir/usr/share/webapps/$pkgname"
    install -Dm755 daemon.php "$pkgdir/usr/share/webapps/$pkgname"

    #TODO: package nginx thing
    patch -Np1 < "${srcdir}/apache-movim-conf.patch"
    install -Dm644 etc/apache2/conf-available/movim.conf "$pkgdir/etc/apache2/conf-available/movim.conf"
    patch -Np1 < "${srcdir}/movim-service.patch"
    install -Dm644 etc/systemd/system/movim.service "$pkgdir/etc/systemd/system/movim.service"

    # Configuration file
    patch -Np0 < "${srcdir}/movim-env.patch"
    install -Dm644 .env.example "$pkgdir/etc/$pkgname.env"
    ln -s "$pkgdir/usr/share/webapps/$pkgname/.env" "/etc/$pkgname.env"
}
