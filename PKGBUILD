# Maintainer: Runnytu < runnytu at gmail dot com >

pkgname=8192cu-dkms
pkgver=v4.0.2_9000
pkgrel=14
pkgdesc="Driver for Realtek RTL8188CUS (8188C, 8192C) chipset wireless cards"
arch=('any')
url="http://www.realtek.com.tw/"
license=('GPL')
depends=('dkms')
makedepends=('git')
replaces=('dkms-8192cu')
conflicts=("8192cu" "rt8192cu" "dkms-8192cu")
options=(!strip)
_pkgname="8192cu"
source=("$_pkgname::git+https://github.com/Rick-Moba/rtl8192cu.git"
        "dkms.conf"
        "blacklist-8192cu-dkms.conf")
               
sha256sums=('SKIP'
            '22853908c2ae147399ce3847c175a25134db668d36c3141814eafcc8fddacc98'
            '67a7831317d75c3ecdb351cd515b8b980ae17de66ef9f78d8d1aa86820cef5c6')

package() {
       
        installDir="$pkgdir/usr/src/$_pkgname-$pkgver"
       
        install -dm755 "$installDir"
        install -m644 "$srcdir/dkms.conf" "$installDir"
        install -dm755 "$pkgdir/etc/modprobe.d"
        install -m644 "$srcdir/blacklist-8192cu-dkms.conf" "$pkgdir/etc/modprobe.d/blacklist-8192cu-dkms.conf"
       
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
