# Maintainer: Steven De Bondt <egnappah@gmail.com>
# Copied initial work from icingaweb2-git:
## Maintainer: Julian Brost <julian@0x4a42.net>
## Contributor: Malte Rabenseifner <mail@malte-rabenseifner.de>

pkgname=icingaweb2-latest
_pkgname=icingaweb2
pkgver=2.9.0
iplver=0.6.0
thirdpver=0.10.0
gitver=v"$pkgver"
gitiplver=v"$iplver"
git3pver=v"$thirdpver"
pkgrel=1
pkgdesc="Icinga Web 2 Interface"
license=('GPL')
arch=('any')
depends=('php')
makedepends=('git' 'composer')
optdepends=('php-gd: export data to PDF'
            'php-intl: support for internationalization'
            'php-pgsql: for PostgreSQL backend')
provides=('icingaweb2')
conflicts=('icingaweb2')
url="http://www.icinga.org"
source=("git+https://github.com/Icinga/icingaweb2/#tag=$gitver"
        "git+https://github.com/Icinga/icinga-php-library/#tag=$gitiplver"
	"git+https://github.com/Icinga/icinga-php-thirdparty/#tag=$git3pver"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')


package() {
msg "Configuring icingaweb2 core"
  cd "$srcdir/$_pkgname"

  mkdir -p "$pkgdir/etc/icingaweb2"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/webapps/icingaweb2"
  mkdir -p "$pkgdir/var/log/icingaweb2"

  cp -r application doc library modules public bin "$pkgdir/usr/share/webapps/icingaweb2"
  ln -s /usr/share/webapps/icingaweb2/bin/icingacli "$pkgdir/usr/bin/icingacli"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/icingaweb2/LICENSE"
  install -Dm644 etc/bash_completion.d/icingacli "$pkgdir/etc/bash_completion.d/icingacli"
  cp -r etc/schema "$pkgdir/usr/share/icingaweb2"

  chmod 2770 "$pkgdir/etc/icingaweb2"
  chmod 750 "$pkgdir/var/log/icingaweb2"

msg "Configuring icingaweb2 PHP librariy"

  msg2 "Making sure gettext is enabled in php instance, editing php.ini"
  sudo sed -i 's/;extension=gettext/extension=gettext/g' /etc/php/php.ini

  msg2 "installing version $iplver of icinga-php libraries to usr/share/icinga-php/ipl"
  mkdir -p "$pkgdir/usr/share/icinga-php/"
  cp -r "$srcdir/icinga-php-library" "$pkgdir/usr/share/icinga-php/ipl"

msg "Configuring icingaweb2 Thirdparty PHP Libraries"
  cp -r "$srcdir/icinga-php-thirdparty" "$pkgdir/usr/share/icinga-php/vendor"
}
