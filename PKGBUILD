# Maintainer: Yen Chi Hsuan <yan12125 at gmail.com>

_pkgname=macports-base
pkgname=$_pkgname-git
pkgver=2.4.0.beta1.r195.gb22cb0f0
pkgrel=3
pkgdesc='The MacPorts command-line client'
url='https://www.macports.org/'
arch=('i686' 'x86_64')
license=('BSD')
# man is used for `port help`
depends=('curl' 'man' 'nmtree' 'openssl' 'sqlite')
# tcl: MacPorts comes with its own vendored tclsh, while a system interpreter
# is still needed to build tcllib
# rsync: ./configure checks for `rsync` in $PATH and saves the value in
# macports_autoconf.tcl, so this should be in makedepends, too
makedepends=('git' 'tcl' 'rsync')
optdepends=(
    'rsync: for syncing sources via rsync'
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
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"

  ./configure
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir" install

  install -Ddm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
