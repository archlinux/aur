# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=macports-base
pkgname=$_pkgname-git
pkgver=2.5.0.beta1.r66.g8434c0ee
pkgrel=3
pkgdesc='The MacPorts command-line client'
url='https://www.macports.org/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('curl' 'openssl' 'sqlite')
# tcl: MacPorts comes with its own vendored tclsh, while a system interpreter
# is still needed to build tcllib
makedepends=('git' 'tcl' 'nmtree')
optdepends=(
  'rsync: for syncing sources via rsync'
  'nmtree: for building ports'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/macports/$_pkgname")
sha256sums=('SKIP')
backup=(opt/local/etc/macports/archive_sites.conf
        opt/local/etc/macports/macports.conf
        opt/local/etc/macports/pubkeys.conf
        opt/local/etc/macports/sources.conf
        opt/local/etc/macports/variants.conf)

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  )
}

build() {
  cd $_pkgname

  # provide paths manually so that these packages are not necessray during building
  MAN=/usr/bin/man \
  MTREE=/usr/bin/mtree \
  RSYNC=/usr/bin/rsync \
  ./configure \
    --enable-readline

  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
