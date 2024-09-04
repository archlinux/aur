# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: a821 <a821 at mail de>
# Contributor: graysky <graysky AT archlinux DOT us>
# Contributor: David Manouchehri <manouchehri@riseup.net>

pkgname='fake-hwclock-git'
pkgver=0.1b.r21.g5b8105b
pkgrel=3
pkgdesc="Save/restore system clock on machines without working RTC hardware"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xanmanning/alarm-${pkgname%-git}"
license=('LicenseRef-Coffeeware')
depends=('glibc')
makedepends=('git')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  # shellcheck disable=SC2016
  sed -i 's/ $(LDFLAGS)/ $(CPPFLAGS) $(CFLAGS) $(LDFLAGS)/' Makefile
}

build() {
  make -C "${pkgname%-git}"
}

package() {
  make -C "${pkgname%-git}" DESTDIR="${pkgdir}" install
  install -Dm644 "${pkgname%-git}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
