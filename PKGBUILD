# Maintainer: ShoreNinth <shoreninth@outlook.com>

_pkgname=goby
pkgname=goby-community
pkgver=2.9.5
pkgrel=1
pkgdesc="Attack surface mapping"
arch=("x86_64")
url="https://gobies.org/"
license=('unknown')
options=("!strip" "!debug")
depends=(
	"atk"
	"gtk3"
	"libpcap"
)
makedepends=(
	"libcap"
	)
source=(
	"https://$_pkgname-storage-public.oss-cn-beijing.aliyuncs.com/$pkgver/$_pkgname-linux-x64-$pkgver-Community.zip"
	"$pkgname.desktop"
	"$pkgname.png"
	)
sha256sums=(
	'40b167973300f6ac24d34f68492e32173d356b940a6046bf22e12dca3aff3a6d'
	'0624f9c1aa7377ccb5bd6b6a54a3dbea3cdd1a1e838a154c73bd01d22ff5fc3f'
	'11e10dc114bd6cd8ecfe018b277798f1c7727f113c15ebc09090682f8575bb1f'
)
prepare() {
	cd "${srcdir}"
	bsdtar -xpf $_pkgname-linux-x64-$pkgver-Community.zip
}

package() {
#	cd $srcdir/$pkgname

	install -d $pkgdir/{opt/$pkgname,usr/bin}
	mv ./$_pkgname-linux-x64-$pkgver/* $pkgdir/opt/$pkgname
	ln -s /opt/$pkgname/goby $pkgdir/usr/bin/$pkgname
	ln -s /opt/$pkgname/goby/golib/goby-cmd-linux $pkgdir/usr/bin/$pkgname-cmd

	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	chmod -R ugo+rwX $pkgdir/opt/$pkgname
	setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' $pkgdir/opt/$pkgname/golib/goby-cmd-linux
}
