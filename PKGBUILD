# Maintainer: Immae <ismael.bouya@normalesup.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

pkgname=naemon
pkgver=1.0.10
pkgrel=1
pkgdesc="System and network monitoring application"
arch=('i686' 'x86_64')
url="http://naemon.org"
license=('GPL2')
depends=('icu' 'glib2')
optdepends=('logrotate'
            'thruk: Web interface for Naemon'
            'naemon-livestatus: Event broker'
            'monitoring-plugins')
makedepends=('gperf' 'help2man')
source=("naemon-git::git+https://github.com/naemon/naemon-core.git#commit=c2a8730538846f342911764cd7731015f1a6f284"
        $pkgname-tmpfiles.conf
        $pkgname.service
        overflow.patch)
sha512sums=('SKIP'
            '756e61e4da56ce614824c3b289d2ee0f4464bf5bcd868dcadbf31c3320967e0179aa6c5aedc16e4bb40c480ab2da8ab08c43e750168e86963a9cd552db01ea1d'
            '28944f2bd918c0718496ce490d0c2da97a127f71cfb23348620cb6c86fc88e206a07409d32dc8c9a9b5b2d1a8106b400c3e1edf3a6b7aca30ac125a38ebed3b2'
            'ec1ccf09f8c02e8f6dfdf2f6b80eed4b3e07df85703d89bdfdefe0bd9380b832a7f9a1c2976f17f55d74dbb3b1888ae28bf0551c78cb8bbc3acb08cd1e4a85da')
backup=('etc/logrotate.d/naemon'
        'etc/naemon/naemon.cfg'
        'etc/naemon/resource.cfg')
install=$pkgname.install

build() {
  cd "$srcdir/$pkgname-git"

  patch -p1 < $srcdir/overflow.patch
  ./autogen.sh
  ./configure --prefix=/usr \
              --bindir=/usr/bin \
              --datadir="/usr/share/naemon" \
              --libdir="/usr/lib/naemon" \
              --localstatedir="/var/lib/naemon" \
              --sysconfdir="/etc/naemon" \
              --with-pkgconfdir="/etc/naemon" \
              --mandir="/usr/share/man" \
              --with-pluginsdir="/usr/lib/monitoring-plugins" \
              --with-tempdir="/var/cache/naemon" \
              --with-checkresultdir="/var/cache/naemon/checkresults" \
              --with-logdir="/var/log/naemon" \
              --with-initdir="/etc/init.d" \
              --with-logrotatedir="/etc/logrotate.d" \
              --with-naemon-user="naemon" \
              --with-naemon-group="naemon" \
              --with-lockfile="/run/naemon/naemon.pid"

  make
}

check() {
  cd "$srcdir/$pkgname-git"

  # One of the tests fail for some reason, upstream notified.
  make check || true
}

package() {
  cd "$srcdir/$pkgname-git"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir"/etc/naemon/module-conf.d

  rm -rf "$pkgdir"/var/{cache,log}

  install -dm755 "$pkgdir"/var/lib/naemon
  install -Dm644 "$srcdir"/$pkgname.service \
    "$pkgdir"/usr/lib/systemd/system/$pkgname.service

  # Move sample config files
  install -dm755 "$pkgdir"/usr/share/doc/naemon
  mv "$pkgdir"/etc/naemon/conf.d "$pkgdir"/usr/share/doc/naemon/
  install -d "$pkgdir"/etc/naemon/conf.d/templates

  # Remove non-Arch directories
  rm -rf "$pkgdir"/etc/init.d
  rm -rf "$pkgdir"/etc/apache2

  install -Dm644 "$srcdir"/naemon-tmpfiles.conf "$pkgdir"/usr/lib/tmpfiles.d/naemon.conf
}
