# Maintainer: atvknox <atvknox at gmail dot com>
# Contributor: LS-Shandong <ls-shandong at outlook dot com>
# Contributor: Michał Wojdyła <micwoj9292 at gmail dot com>
# Contributor: Aditya Naik <nikeadilfc at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis
pkgver=1.3.0
pkgrel=11
pkgdesc="A fast monolithic web-framework of Scheme"
url="https://artanis.dev/"

depends=('guile>=3.0.5' 'guile-curl' 'guile-redis' 'guile-json' 'nss' 'texinfo')
optdepends=('guile-dbi: A simple, generic, easy-to-use guile scheme interface to SQL databases, such as Postgres, MySQL or SQLite3'
            'guile-dbd-sqlite3: The dbd plugin connects to an actual SQLite database server.'
            'guile-dbd-postgresql: The dbd plugin connects to an actual PostgreSQL database server.'
            'guile-dbd-mysql: The dbd plugin connects to an actual MySQL database server.')

arch=('x86_64' 'aarch64')
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')

source=(https://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('f1532564383fedb7dcd47c43c0b803ec126f66543c7fb6f7c9e64f0fa8979c99')

validpgpkeys=(F53B4C5695B5E4D56093432484696772846A0058)

options=('!strip' '!lto')

build() {
  cd $pkgname-$pkgver

  export GUILE_AUTO_COMPILE=0

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

check() {
  cd $pkgname-$pkgver

  export GUILE_AUTO_COMPILE=0
  export GUILE_LOAD_PATH=".:$GUILE_LOAD_PATH"

  guile -q --no-auto-compile -c \
    "(use-modules (artanis artanis)) (exit 0)"
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  if [ -f "$pkgdir/bin/art" ]; then
    install -Dm755 "$pkgdir/bin/art" "$pkgdir/usr/bin/art"
    rm -rf "$pkgdir/bin"
  fi

  find "$pkgdir" -name "*.go" -exec sed -i \
    "s|$srcdir|/usr/src/debug/$pkgname|g" {} + 2>/dev/null || true
}
