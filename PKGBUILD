# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=r8127-dkms
pkgver=11.016.00
pkgrel=1
pkgdesc="Kernel module for Realtek 10GB Ethernet NICs"
arch=(any)
url="https://www.realtek.com/Download/List?cate_id=584"
license=('GPL-2.0-only')
depends=('dkms' 'linux-firmware-realtek')
makedepends=('linux-headers') 
source=("https://github.com/openwrt/rtl8127/releases/download/${pkgver/6/5}/${pkgname::5}-${pkgver/6/5}.tar.bz2"
	"https://patch-diff.githubusercontent.com/raw/openwrt/rtl8127/pull/3.patch"
	"dkms.conf")
sha256sums=('ab21bf69368fb9de7f591b2e81cf1a815988bbf086ecbf41af7de9787b10594b'
            '363a25d013ac0f607479efd7845bcb433b7333021fa6ba7dc6d34bd7519328d2'
            'bb1a6e61f626ca6a8eca449aa9eff18db331c68a2b0c0f27d54f55b853aae181')

prepare() {
	cd "$srcdir/${pkgname::-5}-${pkgver/6/5}/src/"
	patch -Np1 < "$srcdir/3.patch"
}


package() {
	cd "$srcdir/${pkgname::-5}-${pkgver/6/5}"
	install -Dm755 "$srcdir/dkms.conf" "$pkgdir/usr/src/${pkgname::-5}-${pkgver}/dkms.conf"
	cp -a --no-preserve=ownership src "$pkgdir/usr/src/${pkgname::-5}-${pkgver}/src"
	sed -i "s/@_PKGBASE@/${pkgname::-5}/g;s/@PKGVER@/${pkgver}/g;s/@_PKGBASE@/${pkgname::-5}/g" "$pkgdir/usr/src/${pkgname::-5}-${pkgver}/dkms.conf"

	install -dm755 "$pkgdir/usr/lib/modprobe.d"
	cat > "$pkgdir/usr/lib/modprobe.d/$pkgname.conf" <<-EOF
blacklist r8169
EOF
}
