# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=sunrise
pkgver=v1.0.0
pkgrel=2
pkgdesc="Sunrise and sunset calculation D-Bus service"
arch=('i686' 'x86_64')
url="https://github.com/laCour/sunrise"
license=('GPL')
depends=('libdbus')
makedepends=('git' 'gcc' 'make')
install="${pkgname}.install"
provides=('sunrise')
source=("$pkgname"::'git+https://github.com/laCour/sunrise.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags $(git rev-list --tags --max-count=1) | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  git cat-file blob maintainer-pgp-pub | gpg --import
  git verify-tag $pkgver
  make
}

package() {
  install -Dm644 "$srcdir/$pkgname/data/systemd/me.lacour.Sunrise1.conf" "$pkgdir/etc/dbus-1/system.d/me.lacour.Sunrise1.conf"
  install -Dm644 "$srcdir/$pkgname/data/systemd/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

  install -Dm 755 "$srcdir/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
