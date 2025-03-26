# Maintainer: ShoreNinth <shoreninth@outlook.com>

_pkgname=goby
pkgname=goby-community
pkgver=2.9.14
pkgrel=1
pkgdesc="Goby 社区版 | Goby Community Edition"
arch=("x86_64")
url="https://gobies.org/"
license=('unknown')
options=("!strip" "!debug")
depends=("gtk3" "libpcap")
source=(
	"https://$_pkgname-storage-public.oss-cn-beijing.aliyuncs.com/$pkgver/$_pkgname-linux-x64-$pkgver-Community.zip"
	"$pkgname.desktop"
	"$pkgname.png"
)
sha256sums=(
	'e9b67996be4c16ae9cf168db515d39d00678f108f0e08a603c7f7b2a7f736bce'
	'0624f9c1aa7377ccb5bd6b6a54a3dbea3cdd1a1e838a154c73bd01d22ff5fc3f'
	'11e10dc114bd6cd8ecfe018b277798f1c7727f113c15ebc09090682f8575bb1f'
)
prepare() {
	cd "${srcdir}"
	bsdtar -xpf $_pkgname-linux-x64-$pkgver-Community.zip
}

package() {

	install -d $pkgdir/{opt/$pkgname,usr/bin}
	mv ./$_pkgname-linux-x64-$pkgver/* $pkgdir/opt/$pkgname
	ln -s /opt/$pkgname/goby $pkgdir/usr/bin/$pkgname
	ln -s /opt/$pkgname/goby/golib/goby-cmd-linux $pkgdir/usr/bin/$pkgname-cmd

	install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
	chmod -R ugo+rwX $pkgdir/opt/$pkgname
	setcap 'CAP_NET_RAW+eip CAP_NET_ADMIN+eip' $pkgdir/opt/$pkgname/golib/goby-cmd-linux

	echo '可使用goby-community-cmd启动goby-cmd'
	echo 'Use goby-cmd by running goby-community-cmd'
}
