# Maintainer: Austcool Walker <0ajwalker@gmail.com>

pkgname=rtl8192cu-fixes
pkgver=v4.12.1
pkgrel=14
pkgdesc="This is a repackaging of Realtek's own 8192CU USB WiFi driver for Ubuntu 13.10 and later. This packages fixes the issues with the Dlink 131 wifi usb stick revison B."
arch=('any')
url="https://github.com/pvaret/rtl8192cu-fixes"
license=('GPL')
depends=('dkms')
makedepends=('git')
replaces=('rtl8192cu-fixe')
conflicts=("8192cu" "rt8192cu" "dkms-8192cu")
options=(!strip)
_pkgname="8192cu"
source=("$_pkgname::git+https://github.com/pvaret/rtl8192cu-fixes.git"
        "dkms.conf"
        "blacklist-native-rtl8192.conf")
               
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
       
        installDir="$pkgdir/usr/src/$_pkgname-$pkgver"
       
        install -dm755 "$installDir"
        install -m644 "$srcdir/dkms.conf" "$installDir"
        install -dm755 "$pkgdir/etc/modprobe.d"
        install -m644 "$srcdir/blacklist-native-rtl8192.conf" "$pkgdir/etc/modprobe.d/blacklist-native-rtl8192.conf"
       
        cd "${srcdir}/${_pkgname}/"

	rm -fr .git*

	# Disable power saving
	sed -i 's/^CONFIG_POWER_SAVING \= y/CONFIG_POWER_SAVING = n/' Makefile

        for d in `find . -type d`
        do
                install -dm755  "$installDir/$d"
        done
       
        for f in `find . -type f ! -name 'README.md' ! -name '.gitignore'`
        do
                install -m644 "${srcdir}/${_pkgname}/$f" "$installDir/$f"
        done
       
}
