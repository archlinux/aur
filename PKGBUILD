# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=r8127-dkms
pkgver=11.015.00
pkgrel=2
pkgdesc="Kernel module for Realtek 10GB Ethernet NICs"
arch=(any)
url="https://www.realtek.com/Download/List?cate_id=584"
license=('GPL-2.0-only')
depends=('dkms' 'linux-firmware-realtek')
makedepends=('linux-headers') 
source=("https://github.com/hurricanepootis/${pkgname::-5}/archive/refs/tags/${pkgver}.tar.gz"
	"dkms.conf")
sha256sums=('7b55b39b8b22d6daac408b9df312b70a8206636aca68eb92b5c69da74170f0c8'
            '179393f5341a4740f94683cd8d9c220f80020c6df14436f2d68cd1c3eabcfd55')

prepare() {
	cd "$srcdir/${pkgname::-5}-$pkgver"
}


package() {
	cd "$srcdir/${pkgname::-5}-$pkgver"
	install -Dm755 "$srcdir/dkms.conf" "$pkgdir/usr/src/${pkgname::-5}-$pkgver/dkms.conf"
	cp -a --no-preserve=ownership src "$pkgdir/usr/src/${pkgname::-5}-${pkgver}/src"
	sed -i "s/@_PKGBASE@/${pkgname::-5}/g;s/@PKGVER@/${pkgver}/g;s/@_PKGBASE@/${pkgname::-5}/g" "$pkgdir/usr/src/${pkgname::-5}-${pkgver}/dkms.conf"

	install -dm755 "$pkgdir/usr/lib/modprobe.d"
	cat > "$pkgdir/usr/lib/modprobe.d/$pkgname.conf" <<-EOF
blacklist r8169
EOF
}
