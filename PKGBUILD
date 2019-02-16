# Maintainer: Austcool Walker <0ajwalker@gmail.com>

pkgname=rtl8192cu-fixes-git
pkgver=r81.756f2ec
pkgrel=1
pkgdesc="This is a repackaging of Realtek's own 8192CU USB WiFi driver for Ubuntu 13.10 and later. This packages fixes the issues with the Dlink 131 wifi usb stick revison B"
arch=('any')
url="https://github.com/pvaret/rtl8192cu-fixes"
license=('GPL')
depends=('dkms')
makedepends=('git')
replaces=('rtl8192cu-fixe')
conflicts=("8192cu" "rt8192cu" "dkms-8192cu")
options=(!strip)
source=("${pkgname}::git+https://github.com/pvaret/rtl8192cu-fixes.git"
        "dkms.conf"
        "blacklist-native-rtl8192.conf")
sha256sums=('SKIP'
            'a7248049e140aff9f84263f5b520b43086dbf4187270677877d6752d94af6b50'
            '68ade9eaf1018b73cb3a6acd68f42ac3714c654527dc63ea664b9664ea5332ea')

pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
       
        _installDir="$pkgdir/usr/src/$pkgname-$pkgver"
       
        install -dm755 "$_installDir"
        install -m644 "$srcdir/dkms.conf" "$_installDir"
        install -dm755 "$pkgdir/etc/modprobe.d"
        install -m644 "$srcdir/blacklist-native-rtl8192.conf" "$pkgdir/etc/modprobe.d/blacklist-native-rtl8192.conf"
       
        cd "${srcdir}/${pkgname}/"

	rm -fr .git*

	# Disable power saving
	sed -i 's/^CONFIG_POWER_SAVING \= y/CONFIG_POWER_SAVING = n/' Makefile

        for d in `find . -type d`
        do
                install -dm755  "$_installDir/$d"
        done
       
        for f in `find . -type f ! -name 'README.md' ! -name '.gitignore'`
        do
                install -m644 "${srcdir}/${pkgname}/$f" "$_installDir/$f"
        done
       
}
