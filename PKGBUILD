# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icingaweb2
pkgver=2.5.3
pkgrel=1
pkgdesc="Icinga Web 2 Interface"
license=('GPL')
arch=('any')
depends=('php')
optdepends=('php-gd: export data to PDF'
            'php-intl: support for internationalization'
            'php-pgsql: for PostgreSQL backend')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz"
        '3315-dont-call-session_start-after-ini_set.patch'
        'HTMLPurifier-autoload-deprecation-warning.diff')
install='icingaweb2.install'
sha256sums=('da9953045895ed26d002ce3d6115af9a5b8012cce9a2667a389c8b9d80cd6592'
            'c40f0608e110fefa2b85b452c416019ff9453722964278fee2128290e467f165'
            '69aa5ebf5ab234c2caad879199dfbaef85d867d701280ef05b50083cc0efffde')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Support for PHP 7.2 in Icinga Web 2
  # https://github.com/Icinga/icingaweb2/issues/3185
  # https://github.com/Icinga/icingaweb2/pull/3315
  patch -Np1 -i "${srcdir}/3315-dont-call-session_start-after-ini_set.patch"

  # Fix deprecation warning in HTMLPurifier
  # https://github.com/ezyang/htmlpurifier/commit/bb7ad665265a29303ec59918f0c1832528bdc509
  patch -Np1 -i "${srcdir}/HTMLPurifier-autoload-deprecation-warning.diff"
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
