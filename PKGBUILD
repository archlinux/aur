# Maintainer: Mohamed Hammad <Mohamed 0x2e Hammad 0x40 Steelbore 0x2e com>
# Contributor: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
# Contributor: Stephen Gregoratto <dev at sgregoratto dot me>

pkgname=doas
pkgver=6.4
pkgrel=4
pkgdesc="A port of OpenBSD's doas which runs on FreeBSD, Linux, NetBSD, illumos, macOS and MidnightBSD"
license=('BSD')
url="https://codeberg.org/thejessesmith/doas/"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=() # bash & pam are dependencies of base
makedepends=('bison')
options=(!lto)
optdepends=('vi: default editor for vidoas')
backup=('etc/doas.conf'
        'etc/pam.d/doas')
install="doas.install"
changelog="doas.changelog"
conflicts=('opendoas' 'opendoas-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'doas-pam'
	'doas.conf')
sha256sums=('33e1fba4346db7f3578b1c7ed75c9a42f2b90fe1dfdea60d5af23c248f0997d4'
            'b064704fb3448c3511904c3963b0e167ecf6274aea48afb9c42d452447dfd042'
            '1f28802fad6ae0eaa5b94bb8d945ada923631ddfb7ae63e934962dbe41774976')

build() {
  cd "${pkgname}"
  make
}

package() {
  install -Dm644 "doas-pam" "${pkgdir}/etc/pam.d/doas"
  install -Dm644 "doas.conf" "${pkgdir}/etc/doas.conf"
  mkdir -p ${pkgdir}/usr/local/etc
  ln -s /etc/doas.conf ${pkgdir}/usr/local/etc/doas.conf
  cd "${pkgname}"
  make PREFIX="/usr" DESTDIR="${pkgdir}" MANDIR="${pkgdir}/usr/share/man" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

post_install() {
	echo "Edit the configuration in /etc/doas.conf"
	echo "by adding your username or other values"
}
