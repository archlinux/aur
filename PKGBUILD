# Maintainer: LS-Shandong < ls-shandong at outlook dot com >
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=artanis-git
pkgver=1.2.2.r0.g21ceb29
pkgrel=5
pkgdesc="A fast monolithic web-framework of Scheme"
url="https://gitlab.com/hardenedlinux/artanis"
depends=('guile>=3.0.5' 'guile-curl' 'guile-redis' 'guile-json' 'nss' 'texinfo')
makedepends=('git')
optdepends=('guile-dbi: A simple, generic, easy-to-use guile scheme interface to SQL databases, such as Postgres, MySQL or SQLite3'
            'guile-dbd-sqlite3: The dbd plugin connects to an actual SQLite database server.'
            'guile-dbd-postgresql: The dbd plugin connects to an actual PostgreSQL database server.'
            'guile-dbd-mysql: The dbd plugin connects to an actual MySQL database server.')
arch=('x86_64' 'aarch64')
license=('GPL3' 'LGPL3')
source=(${pkgname}::git+$url.git)
sha256sums=('SKIP')
options=('!strip')
conflicts=('artanis')
provides=('artanis')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  ./autogen.sh –no-configure
  ./configure --prefix=/usr
  make
  sed -i -e '219,220s/^/#/' -e "227s/^#/$(echo -e '\t')/" Makefile
  sed -i '64,67!b;66b;s/true/false/g' build-aux/gendocs.sh
  make docs
}

check() {
  cd "$pkgname"
  export GUILE_LOAD_PATH=$GUILE_LOAD_PATH:.
  guile -c '(display (@ (artanis artanis) artanis-version))'
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm755 "$pkgdir"/bin/art "$pkgdir"/usr/bin/art
  rm -rf "$pkgdir"/bin
}
