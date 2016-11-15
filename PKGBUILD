# Maintainer: Guillaume Friloux <guillaume@friloux.me>
# Co-Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='movim'
pkgname=movim-git
pkgver=r5097.478c963
pkgrel=1
pkgdesc="Movim is a decentralized social network, written in PHP and HTML5 and based on the XMPP standard protocol."
arch=('any')
url='https://movim.eu'
license=('AGPL3')
provides=('movim')
depends=('php-gd' 'php-imagick')
optdepends=('postgresql: to use the postgresql database backend'
            'php-pgsql: php bindings for postgresql'
            'mariadb: to use the mysql database backend'
            'nginx: reverse proxy'
            'apache: reverse proxy'
            'php-fpm: PHP FactCGI process manager')
makedepends=('git' 'composer')
source=("$_pkgbase::git://github.com/movim/movim"
        movim.env
        movim.service)
install=movim.install
sha256sums=('SKIP'
            '5c36a52a410a61f9af9daf9cd12e63b1ef7bab10dab9541b5d3cc8aa4805880c'
            'f7d88cd405c06cdd65174763e3cf503067d5cb26742a9961fb3368596b84208b')
backup=("etc/webapps/$_pkgbase/db.inc.php"
        "etc/default/movim")

pkgver() {
  cd $srcdir/$_pkgbase
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgbase
  XDG_CACHE_HOME="$srcdir/cache" composer install \
    --no-interaction --no-dev --no-suggest
  rm -rf "$srcdir/cache"
}

package() {
  cd "$srcdir/$_pkgbase"

  install -m755 -d "$pkgdir/usr/share/webapps/$_pkgbase"

  # Movim-editable directories
  install -o http -m755 -d "$pkgdir/usr/share/webapps/$_pkgbase"/{cache,users}

  cp -r app lib locales src system themes vendor "$pkgdir/usr/share/webapps/$_pkgbase"
  install -Dm644 VERSION INSTALL.md README.md index.php linker.php manifest.webapp \
    "$pkgdir/usr/share/webapps/$_pkgbase"
  install -Dm755 daemon.php mud.php "$pkgdir/usr/share/webapps/$_pkgbase"

  # Configuration file
  install -m750 -d "$pkgdir/etc/webapps/$_pkgbase"
  install -Dm750 config/db.example.inc.php "$pkgdir/etc/webapps/$_pkgbase/db.inc.php"
  chown -R http:root "$pkgdir/etc/webapps/$_pkgbase"
  chmod -R u+rwX,g+rwX,o-rwx "$pkgdir/etc/webapps/$_pkgbase"
  ln -s "/etc/webapps/$_pkgbase" "$pkgdir/usr/share/webapps/$_pkgbase/config"

  # Log files
  install -m770 -d "$pkgdir/var/log/webapps/$_pkgbase"
  chown -R http:root "$pkgdir/var/log/webapps/$_pkgbase"
  ln -s "/var/log/webapps/$_pkgbase" "$pkgdir/usr/share/webapps/$_pkgbase/log"

  # Systemd unit file
  install -m755 -d "$pkgdir/etc/default"
  install -o http -Dm640 "$srcdir/movim.env" "$pkgdir/etc/default/$_pkgbase"
  install -Dm644 "$srcdir/movim.service" "$pkgdir/usr/lib/systemd/system/movim.service"
}
