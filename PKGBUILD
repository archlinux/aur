# Maintainer: LS-Shandong < ls-shandong at outlook dot com >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Aditya Naik <nikeadilfc at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=1.2.2
pkgrel=5
pkgdesc="A fast monolithic web-framework of Scheme"
url="https://artanis.dev/"
depends=('guile>=3.0.5' 'guile-curl' 'guile-redis' 'guile-json' 'nss' 'texinfo')
optdepends=('guile-dbi: A simple, generic, easy-to-use guile scheme interface to SQL databases, such as Postgres, MySQL or SQLite3'
            'guile-dbd-sqlite3: The dbd plugin connects to an actual SQLite database server.'
            'guile-dbd-postgresql: The dbd plugin connects to an actual PostgreSQL database server.'
            'guile-dbd-mysql: The dbd plugin connects to an actual MySQL database server.')
arch=('x86_64' 'aarch64')
license=('GPL3' 'LGPL3')
source=(https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('F8EA894C28F8D69A747485D083CAAB8B4FF06C97C64122905BAB1C3084D17904' '1B93C0C6A0B6FD579CA57DAC2B4D24D6966E1E4313447A19421733B34E7C1628')
validpgpkeys=(F53B4C5695B5E4D56093432484696772846A0058)
options=('!strip')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh –no-configure
  ./configure --prefix=/usr
  make
  sed -i -e '219,220s/^/#/' -e "227s/^#/$(echo -e '\t')/" Makefile
  sed -i '64,67!b;66b;s/true/false/g' build-aux/gendocs.sh
  make docs
}

check() {
  cd $pkgname-$pkgver
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm755 "$pkgdir"/bin/art "$pkgdir"/usr/bin/art
  rm -rf "$pkgdir"/bin
}
