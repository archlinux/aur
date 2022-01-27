# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Contributor: locked_sh <locked.sh@disroot.org>
# Contributor: Nicholas Wang <me@nicho1as.wang>

pkgname=emercoin-git
_pkgname=emercoin
pkgver=0.7.11
pkgrel=8
pkgdesc="Digital currency and blockchain service platform"
arch=('i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('GPL')
depends=('boost-libs' 'miniupnpc' 'qt5-base' 'protobuf' 'qrencode' 'libevent')
makedepends=('boost' 'qt5-tools')
provides=('emercoin')
conflicts=('emercoin')
install='emercoin.install'
source=("git+${url}.git" #branch=${BRANCH:-0.7.11}"
"emercoin.install"
"emercoind.service"
"emc48.png"
"com.emercoin.Emercoin.desktop")
sha256sums=('SKIP'
            '9ab66d1537081746f5eec016628bc810d216ed393f062368decbeea3756bca35'
            '9e0832225a161a0c2694890e4d1791eedf943f96556db153e3cd5e40906ef5ed'
            '99d13ec06eb0d09662632e9eb6309ee38e03162f09513b23747f189602552132'
            'dfa7a4c2f717bbc29ba4273d65f80e0ee5853379e0632e458ae12df1ace72fcf')

build() {
  cd ${srcdir}/${_pkgname}
  #git pull -f
  git checkout ${pkgver}
  git pull --tags -f
	./autogen.sh
  ./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --with-openssl --with-libressl=no --enable-tests=no --disable-dependency-tracking --disable-tests --disable-util-tx --disable-gui-tests --enable-bip70 --disable-hardening --disable-debug
  make
  mkdir -p ${srcdir}/usr
  make DESTDIR=${srcdir}/usr install
}

package() {
  install -Dm644 ${srcdir}/emercoind.service ${pkgdir}/usr/lib/systemd/system/emercoind.service
  install -Dm644 ${srcdir}/com.emercoin.Emercoin.desktop ${pkgdir}/usr/share/applications/com.emercoin.Emercoin.desktop
  install -Dm644 ${srcdir}/emc48.png ${pkgdir}/usr/share/icons/hicolor/48x48/apps/emercoin.png
  install -Dm755 ${srcdir}/usr/usr/bin/emercoind $pkgdir/usr/bin/emercoind
  install -Dm755 ${srcdir}/usr/usr/bin/emercoin-qt $pkgdir/usr/bin/emercoin-qt
  install -Dm755 ${srcdir}/usr/usr/bin/emercoin-cli $pkgdir/usr/bin/emercoin-cli
}
