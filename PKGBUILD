# Maintainer: L <alaviss0 at gmail dot com>

pkgbase=gridcoinresearch-git
pkgname=('gridcoinresearch-daemon-git' 'gridcoinresearch-qt-git' 'gridcoinresearch-upgrader-git')
pkgver=3.4.2.5.r443.78d83b2
pkgrel=1
arch=('i686' 'x86_64')
url="http://gridcoin.us"
license=('custom:gridcoin')
makedepends=('boost' 'git' 'qt4' 'openssl' 'qrencode' 'db' 'curl'
             'protobuf' 'miniupnpc')
source=('gridcoinresearch::git+https://github.com/gridcoin/Gridcoin-Research.git'
        'fix-upnp.patch'
        'gridcoinresearch-qt.desktop')

sha1sums=('SKIP'
          '46006c634ef57189b9a9e6607ca392cb17b933b4'
          '931e82ce57cf9099d73534f969f49ba4e524e671')

pkgver() {
  cd "$srcdir/${pkgbase%-git}"

  printf "%s.r%s.%s" \
    "$(grep CLIENT_VERSION src/clientversion.h | awk '{print $NF}' | sed ':a;N;$!ba;s/\n/./g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgbase%-git}"

  # Fix miniupnpc header path
  patch -Np1 -i "$srcdir"/fix-upnp.patch

  mkdir -p src/obj/zerocoin
}

build() {
  cd "$srcdir/${pkgbase%-git}"

  cd src
  make ${MAKEFLAGS} -f makefile.unix DEBUGFLAGS="" USE_UPNP=1

  make ${MAKEFLAGS} -f makefile_upgrader.unix DEBUGFLAGS=""

  cd ..
  qmake-qt4 "USE_QRCODE=1 USE_UPNP=1"
  make ${MAKEFLAGS}
}

package_gridcoinresearch-daemon-git() {
  pkgdesc="GridCoin is a PoS-based cryptocurrency - Daemon"
  depends=('boost-libs' 'libzip' 'miniupnpc' 'curl' 'boinc')
  install=gridcoin.install

  cd "$srcdir/${pkgbase%-git}/src"
  install -Dm755 gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearch-qt-git() {
  pkgdesc="GridCoin is a PoS-based cryptocurrency - Qt"
  depends=('boost-libs' 'qrencode' 'qt4' 'libzip' 'miniupnpc' 'curl' 'boinc')
  install=gridcoin.install

  cd "$srcdir/${pkgbase%-git}"
  install -Dm755 gridcoinresearch "$pkgdir/usr/bin/gridcoinresearch"

  install -Dm644 "${srcdir}/gridcoinresearch-qt.desktop" "$pkgdir/usr/share/applications/gridcoinresearch-qt.desktop"

  install -Dm644 share/pixmaps/grc-small.png "$pkgdir/usr/share/pixmaps/grc-small.png"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_gridcoinresearch-upgrader-git() {
  pkgdesc="Stub program for Gridcoin Daemon"
  depends=('curl' 'boost-libs' 'libzip')

  cd "${srcdir}/${pkgbase%-git}/src"
  install -Dm755 gridcoinupgrader "${pkgdir}/usr/bin/gridcoinupgrader"

  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
