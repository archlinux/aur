# Maintainer: Guillaume Friloux <guillaume@friloux.me>
# Co-Maintainer: Maxime "pep" Buquet <archlinux@bouah.net>

_pkgbase='movim'
pkgname=movim-git
pkgver=r7476.b0934832f
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
            'php-sqlite: php bindings for sqlite'
            'mariadb: to use the mysql database backend'
            'sqlite3: to use the sqlite database backend'
            'nginx: reverse proxy'
            'apache: reverse proxy'
            'php-fpm: PHP FactCGI process manager')
makedepends=('git' 'composer')
source=("$_pkgbase::git+https://github.com/movim/movim"
        movim.env
        movim.service
        sysuser.conf
        tmpfiles.conf)
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

  # Systemd files
  install -m755 -d "$pkgdir/etc/default"
  install -Dm640 "$srcdir/movim.env" "$pkgdir/etc/default/$_pkgbase"
  install -Dm644 "$srcdir/movim.service" "$pkgdir/usr/lib/systemd/system/movim.service"
  install -Dm644 "$srcdir/sysuser.conf" "$pkgdir/usr/lib/sysusers.d/movim.conf"
  install -Dm644 "$srcdir/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/movim.conf"

  install -m755 -d "$pkgdir/usr/share/webapps/$_pkgbase"

  cp -r app database lib locales public src vendor \
    "$pkgdir/usr/share/webapps/$_pkgbase"
  install -Dm644 CHANGELOG.md doap.xml INSTALL.md linker.php phinx.php \
    README.md VERSION "$pkgdir/usr/share/webapps/$_pkgbase"
  install -Dm755 daemon.php "$pkgdir/usr/share/webapps/$_pkgbase"

  # Configuration file
  install -m750 -d "$pkgdir/etc/webapps/$_pkgbase"
  install -Dm640 config/db.example.inc.php "$pkgdir/etc/webapps/$_pkgbase/db.inc.php"
}

sha256sums=('SKIP'
            '5dfff91dd4a54f3d3713530e204370a96d37898b670a61123d8cad42f92da306'
            '813d580300ee5bb7f1f9603db2404f5af67fd02f49017708d4adb919d4422045'
            'c8b569f1eafb97d8d03bbaabb9b4d6ed3415f922a05a52bd865942676368f4c5'
            'd7847c2b5d9897122168c66493bc72200432c2b15317e38afbfb06a8500257a2')
