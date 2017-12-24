# Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>
# Contributor: Guillaume Friloux <guillaume@friloux.me>

_pkgbase='movim'
_tagname=v0.13
pkgname=movim
pkgver=v0.13.63440788
pkgrel=1
pkgdesc="Movim is a decentralized social network, written in PHP and HTML5 and based on the XMPP standard protocol."
arch=('any')
url='https://movim.eu'
license=('AGPL3')
provides=('movim')
depends=('php-gd' 'php-imagick' 'php-zmq')
optdepends=('postgresql: to use the postgresql database backend'
            'php-pgsql: php bindings for postgresql'
            'mariadb: to use the mysql database backend'
            'nginx: reverse proxy'
            'apache: reverse proxy'
            'php-fpm: PHP FactCGI process manager')
makedepends=('git' 'composer')
source=("$_pkgbase::git+https://github.com/movim/movim#tag=$_tagname"
        movim.env
        movim.service)
install=movim.install
sha256sums=('SKIP'
            '5dfff91dd4a54f3d3713530e204370a96d37898b670a61123d8cad42f92da306'
            '793b85ca2080d92d9663af1750d0be9d1cbd20de9c828cb0ce0cc91ad5510f11')
backup=("etc/webapps/$_pkgbase/db.inc.php"
        "etc/default/movim")

pkgver() {
  cd $srcdir/$_pkgbase
  echo "${_tagname}.$(git rev-parse --short HEAD)"
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

  cp -r app lib locales src themes vendor "$pkgdir/usr/share/webapps/$_pkgbase"
  install -Dm644 VERSION CHANGELOG.md INSTALL.md README.md index.php \
    linker.php manifest.webapp "$pkgdir/usr/share/webapps/$_pkgbase"
  install -Dm755 daemon.php mud.php "$pkgdir/usr/share/webapps/$_pkgbase"

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

  # Systemd unit file
  install -m755 -d "$pkgdir/etc/default"
  install -g http -Dm640 "$srcdir/movim.env" "$pkgdir/etc/default/$_pkgbase"
  install -Dm644 "$srcdir/movim.service" "$pkgdir/usr/lib/systemd/system/movim.service"

  # Easy access to mud.php
  install -d "$pkgdir/usr/bin"
  ln -s "/usr/share/webapps/$_pkgbase/mud.php" "$pkgdir/usr/bin/mud"
}
