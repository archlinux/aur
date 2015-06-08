# Maintainer: Runnytu < runnytu at gmail dot com >
 
pkgname=8192cu-dkms
pkgver=v4.0.2_9000
pkgrel=8
pkgdesc="Driver for Realtek RTL8188CUS (8188C, 8192C) chipset wireless cards"
arch=('any')
url="http://www.realtek.com.tw/"
license=('GPL')
depends=('dkms')
replaces=('dkms-8192cu')
conflicts=("8192cu" "rt8192cu" "dkms-8192cu")
install=${pkgname}.install
options=(!strip)
_pkgname="8192cu"
source=("https://dl.dropboxusercontent.com/u/54784933/$_pkgname-$pkgver.tar.gz"
        "dkms.conf"
        "blacklist-8192cu-dkms.conf"
	"fix_310_proc2.patch"
	"NoDebug.patch"
	"N150MA.patch"
	"ISY.patch"
	"D-link.patch"
	"RTL8192CU-kernel-4.0.patch")
               
sha256sums=('f4b83e4a363985fdd313531b2e5688d739d2b6df45c8f50d4d3568489db95a5e'
            '22853908c2ae147399ce3847c175a25134db668d36c3141814eafcc8fddacc98'
            'c535e5f1990142355587c212e90e3fc2f1d16540eaafbc7fb7fa54581d70ff37'
	    '976394ef3ee5d29023e8c1f3b56b17a6171bf42b6987256c1cda632db4bb19a4'
	    '9220833471c1a64e69cb53ec7d2c6872857e5c1ae396bfa4a6522e60711961cc'
	    '5cf2242e253e1a86d7d4481e87d354f591462f50f37e06ba229c344ebe114eac'
	    'a8098039d910a6e16dbc6fe770551edb108fe784f65e9fd8edd930851e993388'
	    '0170cab166bc3a4775099402ceea245a84500741afb23bd9572f40958c6e7b40'
	    '63c4188d620ad613562a00b635167e4762d5dc3ca909ebc3709cca433d34ffd8')

package() {
       
        installDir="$pkgdir/usr/src/$_pkgname-$pkgver"
       
        install -dm755 "$installDir"
        install -m644 "$srcdir/dkms.conf" "$installDir"
        install -dm755 "$pkgdir/etc/modprobe.d"
        install -m644 "$srcdir/blacklist-8192cu-dkms.conf" "$pkgdir/etc/modprobe.d/blacklist-8192cu-dkms.conf"
       
        cd "${srcdir}/${_pkgname}-${pkgver}/"

        patch -p1 -i "$srcdir/fix_310_proc2.patch"
	patch -p1 -i "$srcdir/N150MA.patch"
	patch -p1 -i "$srcdir/NoDebug.patch"
	patch -p1 -i "$srcdir/ISY.patch"
	patch -p1 -i "$srcdir/D-link.patch"
	patch -p1 -i "$srcdir/RTL8192CU-kernel-4.0.patch"

	# Disable power saving
	sed -i 's/^CONFIG_POWER_SAVING \= y/CONFIG_POWER_SAVING = n/' Makefile

        for d in `find . -type d`
        do
                install -dm755  "$installDir/$d"
        done
       
        for f in `find . -type f`
        do
                install -m644 "${srcdir}/${_pkgname}-${pkgver}/$f" "$installDir/$f"
        done
       
}
