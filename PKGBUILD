# Maintainer: Alexandre Bouvier <contact@amb.tf>
pkgname=(mn8847{2,3}-firmware)
_pkgver=170427
pkgver=6.427.2017
pkgrel=2
arch=('any')
url="http://www.astrometa.com.tw/"
license=('LicenseRef-proprietary')
groups=('dvb-firmware')
makedepends=('p7zip' 'zstd')
source=("https://dl.dropbox.com/s/ffckhetzp3vmjio/AMDVBT2_Setup_$_pkgver.exe")
b2sums=('b8027cd4715b3c9c08827dd30e99b69b6b2b8cd45ccd35ac01bac527eaa5cbf09219dc4b2515b1635ada690d4b845db0b12d12aaf1be57117b6a8222f81464c1')

prepare() {
	7z x AMDVBT2_Setup_$_pkgver.exe
	tail -c +220369 X64/AMDVBT2BDA.sys | head -c 2005 > dvb-demod-mn88472-02.fw
	tail -c +222385 X64/AMDVBT2BDA.sys | head -c 2271 > dvb-demod-mn88473-01.fw
	zstd -19 -- *.fw
}

check() {
	echo 088b891ac9273ff8c6818fca27b24d81 dvb-demod-mn88472-02.fw | md5sum -c
	echo bdb15b2311581db4c8411fca5e4ce3ce dvb-demod-mn88473-01.fw | md5sum -c
}

package_mn88472-firmware() {
	pkgdesc="Firmware for Panasonic MN88472 DVB-T/T2/C demodulator"

	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir"/usr/lib/firmware dvb-demod-mn88472-02.fw.zst
}

package_mn88473-firmware() {
	pkgdesc="Firmware for Panasonic MN88473 DVB-T/T2/C demodulator"

	install -Dm644 -t "$pkgdir"/usr/lib/firmware dvb-demod-mn88473-01.fw.zst
}
