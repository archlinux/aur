# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>
# Contributor: mrypsilon

pkgbase=gridcoinresearch-git
pkgname=(gridcoinresearch-qt-git gridcoinresearchd-git)
pkgver=4.0.6.5.95fda5b88
pkgrel=1
pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network"
makedepends=('git' 'boost' 'qt5-charts' 'qt5-tools' 'qrencode' 'db')

arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gridcoin.us"
license=('custom:gridcoin')

_sourcename="Gridcoin-Research"

source=("git+https://github.com/gridcoin/Gridcoin-Research.git#branch=testnet")

sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_sourcename"

  printf "%s%s" \
    "$(awk '/define\(_CLIENT_VERSION_MAJOR/ || /define\(_CLIENT_VERSION_MINOR/ || /define\(_CLIENT_VERSION_REVISION/ || /define\(_CLIENT_VERSION_BUILD/ { myversion=$NF; sub(""")""","""""",myversion); print myversion }' ORS='.' configure.ac)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_sourcename"

  ./autogen.sh
  mkdir -p build && cd build
  ../configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --disable-tests
  make DESTDIR="$srcdir/$_sourcename" install
}

package_gridcoinresearch-qt-git() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Qt GUI)"
  depends=('boost-libs' 'db' 'miniupnpc' 'qrencode' 'qt5-base' 'qt5-charts')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"
  cp -r ${srcdir}/${_sourcename}/usr/share ${pkgdir}/usr/share/
  install -Dm644 doc/gridcoinresearch.1 "$pkgdir/usr/share/man/man1/gridcoinresearch.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearchd-git() {
  pkgdesc="A cryptocurrency that rewards users for participating on the BOINC network (Daemon/CLI)"
  depends=('boost-libs' 'db' 'miniupnpc')
  optdepends=('boinc: to earn Gridcoin rewards by doing computational research')
  replaces=('gridcoinresearch-daemon')
  conflicts=('gridcoinresearch-daemon')

  cd "$srcdir/$_sourcename"

  install -Dm755 usr/bin/gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"
  install -Dm644 doc/gridcoinresearchd.1 "$pkgdir/usr/share/man/man1/gridcoinresearchd.1"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
