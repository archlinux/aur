# Maintainer: Michael Clayfield <me@michaelclayfield.com>
# Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-module-director
pkgver=1.9.0
pkgrel=2
pkgdesc="Manage Icinga 2 configuration from Icinga Web 2"
license=('GPL')
arch=('any')
depends=('icingaweb2' 'icingaweb2-module-incubator')
url="http://www.icinga.org"
source=("https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz"
  "$pkgname.sysusers"
  "dashboard.patch")
sha256sums=('65071b98d8c0adf3dfc807cc499590da5d4deb8bdcfc637a07fd7172fb746208'
            '311043f4f4da68e5fcf8ad8593475d8287fe2f681e52940b33d41bc681d74cec'
            '84edc341ef77308b5eed5faafe9d8e9d30c2e90edba33ffa3f47d46af357bef5')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=2 --input="${srcdir}/dashboard.patch"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p "$pkgdir/etc/icingaweb2/modules/director"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  cp -r application contrib doc library public schema test \
    configuration.php module.info run.php run-missingdeps.php register-hooks.php \
    "$pkgdir/usr/share/webapps/icingaweb2/modules/director"

  install -Dm644 "$srcdir/$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "contrib/systemd/icinga-director.service" "$pkgdir/usr/lib/systemd/system/icinga-director.service"
}

