# Maintainer: d0lphin <scrouthtv [at] gmail [dot] com>
# Contributor: Stephen Gregoratto <dev at sgregoratto dot me>
pkgname=doas
pkgver=6.3p2
pkgrel=3
pkgdesc="A port of OpenBSD's doas(1), an alternative to sudo(1)"
license=('BSD')
url="https://github.com/slicer69/doas"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=()
makedepends=('bison')
optdepends=('vi: default editor for vidoas')
backup=('etc/doas.conf'
        'etc/pam.d/doas')
install="doas.install"
changelog="doas.changelog"
conflicts=('opendoas' 'opendoas-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
				'00-Makefile.patch'
        'doas-pam'
				'doas.conf')
sha256sums=('037813a404bfe35289f2c6cb22a8c4de6f636b2a491e546a90d2ae2afa54aa64'
            '600c7686b4c52bb28951e6e0815530d4bc8fec159637ad93d9b0757e750bcabd'
            'b064704fb3448c3511904c3963b0e167ecf6274aea48afb9c42d452447dfd042'
            '1f28802fad6ae0eaa5b94bb8d945ada923631ddfb7ae63e934962dbe41774976')

prepare() {
  patch "$pkgname-$pkgver/Makefile" "${srcdir}/00-Makefile.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  install -Dm644 "doas-pam" "$pkgdir/etc/pam.d/doas"
	install -Dm644 "doas.conf" "$pkgdir/etc/doas.conf"
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

post_install() {
	echo "Edit the configuration in /etc/doas.conf"
	echo "by adding your username or other values"
}
