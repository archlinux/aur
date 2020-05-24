# Maintainer: redfish <redfish@galactica.pw>

pkgname=ssb-server
pkgver=15.2.0
pkgrel=2
pkgdesc="The gossip and replication server for Secure Scuttlebutt - a distributed social network"
arch=(any)
url="https://scuttlebut.io"
license=('MIT')
depends=('nodejs' 'npm')
source=(https://github.com/ssbc/ssb-server/archive/v$pkgver.tar.gz
	sodium-native.patch)

options=(!strip)

prepare(){
	cd "$srcdir"
	pushd "$pkgname-$pkgver"
	# sodium-native 2.4.2 fails to build with nodejs 14.2.0, so bump to 2.4.9
	patch -p1 < ../sodium-native.patch
	popd
	# rapackage after patching, because we have to install from tarball
	tar czf v$pkgver.patched.tar.gz "$pkgname-$pkgver/"
}

package(){
  npm install -g --user root --prefix "${pkgdir}/usr" "$srcdir/v${pkgver}.patched.tar.gz"
}

sha256sums=('b5c8ae6c87035e70b1e7031ce396e132665bbcb93206f94b910519db2764c138'
            '6c11a25664a5cd723ba27da52bfb32fa85c8eb017a697b56dea63da1aba051df')
