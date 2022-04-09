# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2
pkgver=2.10.1
pkgrel=1
pkgdesc="Icinga Web 2 Interface"
license=('GPL')
arch=('any')
depends=('php' 'icinga-php-library>=0.8.0' 'icinga-php-thirdparty>=0.10.0')
makedepends=('patchutils')
optdepends=('php-gd: export data to PDF'
            'php-imagick: graphs in PDF exports'
            'php-intl: support for internationalization'
            'php-pgsql: for PostgreSQL backend')
url="https://icinga.com/"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Icinga/icingaweb2/archive/v$pkgver.tar.gz"
        'https://github.com/Icinga/icingaweb2/pull/4640.patch')
install='icingaweb2.install'
sha256sums=('96eea821a02b9fe5b2cfd193c25d7eef50483c56d26cbeffa028cbaf906f3d5e'
            'bf664e5aa4d1c8e4f09eb6f0e02dac5805432118bbcf06ec078943910ee3de22')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  filterdiff -p1 -x '.github/*' < "$srcdir/4640.patch" | patch -p1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #mkdir -p "$pkgdir/etc/webapps/icingaweb2"
  mkdir -p "$pkgdir/etc/icingaweb2"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2"
  mkdir -p "$pkgdir/var/log/icingaweb2"

  cp -r application bin doc library modules public "$pkgdir/usr/share/webapps/icingaweb2"
  cp -r --parents etc/schema "$pkgdir/usr/share/webapps/icingaweb2"
  ln -s /usr/share/webapps/icingaweb2/bin/icingacli "$pkgdir/usr/bin/icingacli"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/icingaweb2/LICENSE"
  install -Dm644 etc/bash_completion.d/icingacli "$pkgdir/etc/bash_completion.d/icingacli"

  #chmod 2770 "$pkgdir/etc/webapps/icingaweb2"
  chmod 2770 "$pkgdir/etc/icingaweb2"
  chmod 2770 "$pkgdir/var/log/icingaweb2"
}
