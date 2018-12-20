# Maintainer: Guillaume Friloux <guillaume@friloux.me>
# Co-Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='movim'
pkgname=movim-git
pkgver=r7188.b56065d1
pkgrel=1
pkgdesc="Movim is a decentralized social network, written in PHP and HTML5 and based on the XMPP standard protocol."
arch=('any')
url='https://movim.eu'
license=('AGPL3')
provides=('movim')
conflicts=('movim')
depends=('php-gd' 'php-imagick')
optdepends=('postgresql: to use the postgresql database backend'
            'php-pgsql: php bindings for postgresql'
            'mariadb: to use the mysql database backend'
            'sqlite3: to use the sqlite database backend'
            'nginx: reverse proxy'
            'apache: reverse proxy'
            'php-fpm: PHP FactCGI process manager')
makedepends=('git' 'composer')
source=("$_pkgbase::git+https://github.com/movim/movim"
        movim.env
        movim.service
        sysuser.conf)
install=movim.install
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
}

package() {
  cd "$srcdir/$_pkgbase"

  install -m755 -d "$pkgdir/usr/share/webapps/$_pkgbase"

  # Cache
  install -m750 -d "$pkgdir/var/cache/webapps/$_pkgbase/cache"\
    "$pkgdir/var/cache/webapps/$_pkgbase/users"
  chown -R root:http "$pkgdir/var/cache/webapps/$_pkgbase"
  chmod -R u+rwX,g+rwX,o-rwx "$pkgdir/var/cache/webapps/$_pkgbase"
  # XXX: Symlinks created post_upgrade. Waiting for upstream to fix
  # https://github.com/movim/movim/issues/509.

  cp -r app database lib locales src themes vendor \
    "$pkgdir/usr/share/webapps/$_pkgbase"
  install -Dm644 VERSION CHANGELOG.md INSTALL.md README.md index.php \
    linker.php phinx.php "$pkgdir/usr/share/webapps/$_pkgbase"
  install -Dm755 daemon.php "$pkgdir/usr/share/webapps/$_pkgbase"

  # Configuration file
  install -m750 -d "$pkgdir/etc/webapps/$_pkgbase"
  install -Dm750 config/db.example.inc.php "$pkgdir/etc/webapps/$_pkgbase/db.inc.php"
  chown -R root:http "$pkgdir/etc/webapps/$_pkgbase"
  chmod -R u+rwX,g+rwX,o-rwx "$pkgdir/etc/webapps/$_pkgbase"
  ln -s "/etc/webapps/$_pkgbase" "$pkgdir/usr/share/webapps/$_pkgbase/config"

  # Log files
  install -m770 -d "$pkgdir/var/log/webapps/$_pkgbase"
  chown -R root:http "$pkgdir/var/log/webapps/$_pkgbase"
  ln -s "/var/log/webapps/$_pkgbase" "$pkgdir/usr/share/webapps/$_pkgbase/log"

  # Systemd files
  install -m755 -d "$pkgdir/etc/default"
  install -g http -Dm640 "$srcdir/movim.env" "$pkgdir/etc/default/$_pkgbase"
  install -Dm644 "$srcdir/movim.service" "$pkgdir/usr/lib/systemd/system/movim.service"
  install -Dm644 "$srcdir/sysuser.conf" "$pkgdir/usr/lib/sysuser.d/movim.conf"
}

sha256sums=('SKIP'
            '5dfff91dd4a54f3d3713530e204370a96d37898b670a61123d8cad42f92da306'
            '813d580300ee5bb7f1f9603db2404f5af67fd02f49017708d4adb919d4422045'
            'a0aae072d9ee93d270fec602a3fe65bfc63e0de8814f3af6ddebb8ed223391fc')
