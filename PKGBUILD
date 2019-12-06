# Maintainer: Bruce Zhang
pkgname=rtl88x2ce-dkms
_name=rtl88x2ce
pkgver=5.7.3_35403
_allver="${pkgver}_COEX20190531-0e0e.20191028"
_dver="${pkgver}.20191028_COEX20190531-0e0e"
pkgrel=3
pkgdesc="Realtek RTL88x2CE Driver (DKMS)"
arch=('x86_64' 'i686')
url="https://github.com/alanfox2000/realtek-linux/blob/master/RTL8822CE"
license=('unknown')
depends=('dkms')
optdepends=('linux-headers' 'linux-zen-headers')
provides=('rtl88x2ce')
source=(
	"$pkgname-$pkgver.src.7z::https://github.com/alanfox2000/realtek-linux/blob/master/RTL8822CE/RTL8822CE_WiFi_linux_v$_allver.7z?raw=true"
	dkms.conf
	rtw88_blacklist.conf
)
sha1sums=('a798b10d4f2c962c246f2c1bc695314e2b15e7b3'
          '2e10c6cfc44d93d95c231c78ed2b05c463649ed5'
          '18ecc64076501d396a2fabf4f1f31d3d1945b874')

prepare() {
	cd "$srcdir/RTL8822CE_WiFi_linux_v$_allver/driver"
	tar zxf "rtl88x2CE_WiFi_linux_v$_dver.tar.gz"
	cd "$srcdir/RTL8822CE_WiFi_linux_v$_allver/driver/rtl88x2CE_WiFi_linux_v$_dver"

	# Enable soft ap
	sed -i '/^\/\*#define CONFIG_IOCTL_CFG80211/c\#define CONFIG_IOCTL_CFG80211' include/autoconf.h
	sed -i 's|\/\*\#define RTW_USE_CFG80211_STA_EVENT\*\/|\#define RTW_USE_CFG80211_STA_EVENT|' include/autoconf.h

	# Enable WOWLAN
	sed -i '/^CONFIG_WOWLAN/c\CONFIG_WOWLAN = y' Makefile

	# Enable wifi monitor
	sed -i '/^CONFIG_WIFI_MONITOR/c\CONFIG_WIFI_MONITOR = y' Makefile

	# Disable debug
	sed -i '/^CONFIG_RTW_DEBUG/c\CONFIG_RTW_DEBUG = n' Makefile
}

package() {
	cd "$srcdir/RTL8822CE_WiFi_linux_v$_allver/driver/rtl88x2CE_WiFi_linux_v$_dver"
	mkdir -p "$pkgdir/usr/src/$_name-$pkgver"
	cp -pr * "$pkgdir/usr/src/$_name-$pkgver"
	install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/$_name-$pkgver/dkms.conf"
	install -Dm644 "$srcdir/rtw88_blacklist.conf" "$pkgdir/usr/lib/modprobe.d/rtw88_blacklist.conf"
	sed -e "s/#MODULE_VERSION#/$pkgver/" -i "$pkgdir/usr/src/$_name-$pkgver/dkms.conf"
}
