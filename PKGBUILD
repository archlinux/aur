# Maintainer: 5hridhyan <shridhyanh at gmail dot com>
# Contributer: LS-Shandong < ls-shandong at outlook dot com >
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Aditya Naik <nikeadilfc at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de> 

pkgname=artanis
pkgver=1.3.0
pkgrel=6
pkgdesc="A fast monolithic web-framework of Scheme"
url="https://artanis.dev/"
depends=('guile>=3.0.5' 'guile-curl' 'guile-redis' 'guile-json' 'nss' 'texinfo')
makedepends=('texinfo')
optdepends=('guile-dbi: A simple, generic, easy-to-use guile scheme interface to SQL databases, such as Postgres, MySQL or SQLite3'
            'guile-dbd-sqlite3: The dbd plugin connects to an actual SQLite database server.'
            'guile-dbd-postgresql: The dbd plugin connects to an actual PostgreSQL database server.'
            'guile-dbd-mysql: The dbd plugin connects to an actual MySQL database server.')
arch=('x86_64')
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
source=(https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz{,.sig})
sha256sums=('f1532564383fedb7dcd47c43c0b803ec126f66543c7fb6f7c9e64f0fa8979c99'
            'SKIP')
validpgpkeys=(F53B4C5695B5E4D56093432484696772846A0058)
options=('!strip')

build() {
  cd "$pkgname-$pkgver"
  
  # Use the existing configure script
  ./configure --prefix=/usr
  make
  
  # Fix documentation generation issues
  sed -i -e '219,220s/^/#/' -e "227s/^#/$(printf '\t')/" Makefile
  sed -i '64,67!b;66b;s/true/false/g' build-aux/gendocs.sh
  make docs
}

check() {
  cd "$pkgname-$pkgver"
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm755 "$pkgdir"/bin/art "$pkgdir"/usr/bin/art
  rm -rf "$pkgdir"/bin
}
