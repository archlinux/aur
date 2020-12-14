# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgbase=bitcoinhd-git

# qt is broken right now, will add bitcoinhd-qt-git package when build passes
pkgname=('bitcoinhd-daemon-git' 'bitcoinhd-cli-git' 'bitcoinhd-tx-git')
# pkgname=('bitcoinhd-daemon-git' 'bitcoinhd-cli-git' 'bitcoinhd-qt-git' 'bitcoinhd-tx-git')
pkgver=v1.4.3.r26.g00a6bdb8a
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://btchd.org/"
license=('MIT')
# makedepends=('openssl' 'boost' 'boost-libs' 'libevent' 'miniupnpc' 'db4.8' 'qt5-base' 'qt5-tools' 'protobuf' 'qrencode' 'zeromq' 'git' 'python')
makedepends=('openssl' 'boost' 'boost-libs' 'libevent' 'miniupnpc' 'db4.8' 'protobuf' 'qrencode' 'zeromq' 'git' 'python')
conflicts=('bitcoinhd' 'bitcoinhd-daemon' 'bitcoinhd-cli' 'bitcoinhd-tx')
# conflicts=('bitcoinhd' 'bitcoinhd-daemon' 'bitcoinhd-cli' 'bitcoinhd-qt' 'bitcoinhd-tx')
provides=('bitcoinhd' 'bitcoinhd-daemon' 'bitcoinhd-cli' 'bitcoinhd-tx')
# provides=('bitcoinhd' 'bitcoinhd-daemon' 'bitcoinhd-cli' 'bitcoinhd-qt' 'bitcoinhd-tx')
source=("git://github.com/btchd/btchd.git"
        "bitcoinhd-qt.desktop")
sha256sums=('SKIP'
            '4ec2e2a58ee5f44c2bd602536aa3e217062aaba92a638b06fd7d1cf7eb8f2278')

pkgver() {
	cd btchd
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd btchd
	./autogen.sh
	./configure --with-zmq --with-qrencode --without-gui # --with-gui=qt5
	make
}

check() {
	cd btchd
	make check
}

# package_bitcoinhd-qt-git() {
# 	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - Qt"
# 	depends=('boost-libs' 'hicolor-icon-theme' 'libevent' 'miniupnpc' 'protobuf' 'qrencode' 'qt5-base' 'zeromq')
#
# 	install -Dm755 btchd/src/qt/btchd-qt "$pkgdir"/usr/bin/btchd-qt
# 	install -Dm644 btchd/doc/man/btchd-qt.1 "$pkgdir"/usr/share/man/man1/btchd-qt.1
# 	install -Dm644 btchd/share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/btchd128.png
#
# 	if [ ! -f "/usr/share/licenses/btchd/COPYING" ]; then
# 	    install -Dm644 btchd/COPYING "$pkgdir"/usr/share/licenses/btchd/COPYING
# 	fi
# 	install -Dm644 bitcoinhd-qt.desktop "$pkgdir"/usr/share/applications/btchd-qt.desktop
# }

package_bitcoinhd-daemon-git() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - daemon"
	depends=('boost-libs' 'libevent' 'miniupnpc' 'zeromq')
	backup=('etc/btchd/btchd.conf')

	install -Dm755 btchd/src/btchdd "$pkgdir"/usr/bin/btchdd
	install -Dm644 btchd/doc/man/btchdd.1 "$pkgdir"/usr/share/man/man1/btchdd.1
	install -Dm644 btchd/share/examples/btchd.conf "$pkgdir"/etc/btchd/btchd.conf

	if [ ! -f "/usr/share/licenses/btchd/COPYING" ]; then
	    install -Dm644 btchd/COPYING "$pkgdir"/usr/share/licenses/btchd/COPYING
	fi
}

package_bitcoinhd-cli-git() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - RPC client"
	depends=('boost-libs' 'libevent')

	install -Dm755 btchd/src/btchd-cli "$pkgdir"/usr/bin/btchd-cli
	install -Dm644 btchd/doc/man/btchd-cli.1 "$pkgdir"/usr/share/man/man1/btchd-cli.1

	if [ ! -f "/usr/share/licenses/btchd/COPYING" ]; then
	    install -Dm644 btchd/COPYING "$pkgdir"/usr/share/licenses/btchd/COPYING
	fi
}

package_bitcoinhd-tx-git() {
	pkgdesc="BitcoinHD is a peer-to-peer network based digital currency - Transaction tool"
	depends=('boost-libs' 'openssl')

	install -Dm755 btchd/src/btchd-tx "$pkgdir"/usr/bin/btchd-tx
	install -Dm644 btchd/doc/man/btchd-tx.1 "$pkgdir"/usr/share/man/man1/btchd-tx.1

	if [ ! -f "/usr/share/licenses/btchd/COPYING" ]; then
	    install -Dm644 btchd/COPYING "$pkgdir"/usr/share/licenses/btchd/COPYING
	fi
}
