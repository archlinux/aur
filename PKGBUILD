# Maintainer: Xan Manning <git@xan-manning.co.uk>
pkgname=fake-hwclock-git
pkgver=0.0.0
pkgrel=9
pkgdesc="Save/restore system clock on machines without working RTC hardware."
arch=('any')
url="https://github.com/xanmanning/alarm-fake-hwclock"
license=('custom:Coffeeware')
groups=()
depends=()
optdepends=('ntp: network time support')
makedepends=('git')
provides=('fake-hwclock')
conflicts=('fake-hwclock')
replaces=()
backup=()
options=()
source=("$pkgname"::'git://github.com/xanmanning/alarm-fake-hwclock.git')
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/lib/systemd/system/"
  cp "$srcdir/$pkgname/systemd/fake-hwclock.service" "$pkgdir/usr/lib/systemd/system/"
}

post_install() {
  echo "**********************************************************************"
  echo "To keep fake-hwclock up to date in case of a power failure, add the"
  echo "following job to root crontab: "
  echo "*/15 * * * * /usr/bin/fake-hwclock"
  echo "**********************************************************************"
}

post_upgrade() {
  post_install
}

# vim:set ts=2 sw=2 et:
