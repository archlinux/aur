# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: shahid <helllamer@gmail.com>

pkgbase=litecoin-git
pkgname=('litecoin-daemon-git' 'litecoin-cli-git' 'litecoin-qt-git' 'litecoin-tx-git')
git_branch=0.21
pkgver=0.21.1rc1+0+g3665dadce
pkgrel=1
arch=('x86_64')
url="http://www.litecoin.org/"
license=('MIT')
makedepends=(
	'boost'
	'git'
	'libevent'
	'miniupnpc'
	'protobuf'
	'qrencode'
	'qt5-base'
	'qt5-tools'
	'zeromq'
)
source=(
  "$pkgbase::git+https://github.com/litecoin-project/litecoin.git#branch=$git_branch"
  'litecoin-qt.desktop'
  'litecoind.service'
  'litecoin.sysusers'
  'boost1770.patch'
)
sha256sums=('SKIP'
            'ec2a2669a50fa96147a1d04cacf1cbc3d63238aee97e3b0df3c6f753080dae96'
            '98f5a1b28fe13b9093fa89cfe56bb84af09ff5f0d6e9ca196ec02d6dd826ca88'
            'a722b958a7e9b3468d902efa6c9804e01d78fdf88ead4252c934aee2b1d800db'
            '3ccbff49fef5a7e820168f4c4b75ae9a1e74e81dc08587145aa85599254b85e5')


prepare() {
  cd "$pkgbase"
  autoreconf -fi

  patch -Np1 -i ../boost1770.patch
}

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/-/+/g; s/^v//'
}

build() {
  cd "$pkgbase"
  ./configure --prefix=/usr --with-gui=qt5 --with-incompatible-bdb --disable-gui-tests
  make
}

package_litecoin-qt-git() {
  pkgdesc="Litecoin is a peer-to-peer network based digital currency - Qt"
  depends=(boost-libs desktop-file-utils libevent qt5-base miniupnpc qrencode protobuf zeromq)
  conflicts=(litecoin-qt)
  provides=(litecoin-qt)

  cd "$pkgbase"
  install -Dt "$pkgdir/usr/bin"                     -m755 src/qt/litecoin-qt
  install -Dt "$pkgdir/usr/share/man/man1"          -m644 doc/man/litecoin-qt.1
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
  install -Dt "$pkgdir/usr/share/applications"      -m644 ../litecoin-qt.desktop

  install -Dm644 share/pixmaps/bitcoin128.png "$pkgdir"/usr/share/pixmaps/litecoin128.png
}

package_litecoin-daemon-git() {
  pkgdesc="Litecoin is a peer-to-peer network based digital currency - daemon"
  depends=(boost-libs libevent miniupnpc zeromq)
  conflicts=(litecoin-daemon)
  provides=(litecoin-daemon)

  cd "$pkgbase"
  install -Dt "$pkgdir/usr/bin"                         -m755 src/litecoind
  install -Dt "$pkgdir/usr/share/man/man1"              -m644 doc/man/litecoind.1
  install -Dt "$pkgdir/usr/share/licenses/$pkgname"     -m644 COPYING
  install -Dt "$pkgdir/usr/share/doc/$pkgname/examples" -m644 share/examples/litecoin.conf
  install -Dt "$pkgdir/usr/lib/systemd/system"          -m644 ../litecoind.service

  install -Dm644 ../litecoin.sysusers "$pkgdir"/usr/lib/sysusers.d/litecoin.conf
}

package_litecoin-cli-git() {
  pkgdesc="Litecoin is a peer-to-peer network based digital currency - RPC client"
  depends=(boost-libs libevent)
  conflicts=(litecoin-cli)
  provides=(litecoin-cli)

  cd "$pkgbase"
  install -Dt "$pkgdir/usr/bin"                     -m755 src/litecoin-cli
  install -Dt "$pkgdir/usr/share/man/man1"          -m644 doc/man/litecoin-cli.1
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

package_litecoin-tx-git() {
  pkgdesc="Litecoin is a peer-to-peer network based digital currency - Transaction tool"
  depends=(boost-libs openssl)
  conflicts=(litecoin-tx)
  provides=(litecoin-tx)

  cd "$pkgbase"
  install -Dt "$pkgdir/usr/bin"                     -m755 src/litecoin-tx
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 COPYING
}

# vim:set ts=2 sw=2 et:
