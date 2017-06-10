# Maintainer: William Gathoye <william + aur at gathoye dot be> (4.17-now)
# Contributor: Moritz Lipp <mlq at pwmt dot org>
#
pkgname=asix-ax88179-dkms
pkgver=1.18.0
pkgrel=1
pkgdesc="Driver for USB ASIX Ethernet model AX88179/AX88178A"
arch=('i686' 'x86_64')

_filename="AX88179_178A_LINUX_DRIVER_v${pkgver}_SOURCE"
_modname='ax88179_178a'

# Browse the pages for USB-to-Ethernet devices and see which devices are
# compatible with this driver.
# http://www.asix.com.tw/products.php?op=pItemdetail&PItemID=131;71;112&PLine=71
url='http://www.asix.com.tw/'
license=('GPL')

depends=('dkms')

install="${_modname}-dkms.install"

_filename="AX88179_178A_LINUX_DRIVER_v${pkgver}_SOURCE"
_modname='ax88179_178a'
source=(
    "http://www.asix.com.tw/FrootAttach/driver/${_filename}.tar.bz2"
    "dkms.conf"
    "blacklist-${_modname}.conf"
    "${_modname}-dkms.conf"
    "${_modname}-dkms.install"
    "0001-No-date-time.patch"
    "0002-b2b128.patch"
)
sha512sums=(
    '1fb871aca533eeac9476f647a9e6bebcc2151f9327240d31fcc8cdb4d566006386685b77a437924ca05785ec23d82d82d8c485fede5edac70a81742ea82fdf22'
    '7fcbb1bda952997151c3f9b647b1770273e3c6a64ff7306232ba4fbc11ede6dd29989b302f823ca9c36932499765a0c61405400440d699b1659841a855fe69c4'
    '23073861698f4cd181b5051c008a047742ec2710e2bf6927f86fd58822d1bb2edb1338460983d09deb3b006cdcb3b1efbfa94fc4ebfeb3f853a60fb467901948'
    '3c76cdd84422ed416c57ee3a93a90d888fca0baa2961f4a428fa6e1e49256a5b2de8164cda5524a3fa90b97e702b85d2da47c1cfc9d07fe450516dcacef187ac'
    '030d641119c90390973eb85b24697bbc1ce1a9785f604110225fdbf4889c857a6282d441e2c0a51acfa99c2f0946a394c546ca3fdea6295f737ba440bab6e6d2'
    '74a730f2ccfabf54c600391ee9a54ad3977b730c141c9ca9e7b1740c0d93161595a71312b4e3067411bde2f7d7f2a1cb9fb9e982a6ccfc0a4fbfa86829f6c346'
    'a31cab0b3e0fa027acbf629aec7294d591d6dd01928de800bd915e78c75be7be0fe7603b6c69ed90f5a6fefe30ecf6a953fa154cccb03b9cb3e070e7566394f8'
)

prepare() {
    cd "${srcdir}/${_filename}"

    patch -p1 < "${srcdir}/0001-No-date-time.patch"
    patch -p1 < "${srcdir}/0002-b2b128.patch"
}

package() {
	installdir="${pkgdir}/usr/src/${_modname}-dkms-${pkgver}"
	
	install -dm755 "${installdir}"
	install -m644 "${srcdir}/dkms.conf" "${installdir}"

	install -dm755 "${pkgdir}/etc/modprobe.d"
	install -m644 "${srcdir}/blacklist-${_modname}.conf" \
        "${pkgdir}/etc/modprobe.d/blacklist-${_modname}.conf"

	install -dm755 "${pkgdir}/etc/modules-load.d"
	install -m644 "${srcdir}/${_modname}-dkms.conf" \
        "${pkgdir}/etc/modules-load.d/${_modname}-dkms.conf"

    sed -e "s/@VERSION@/${pkgver}/" \
        -i "${installdir}/dkms.conf"

    # Install module source
	cd "$srcdir/$_filename"
 	
    for d in $(find . -type d); do
		install -dm755 "${installdir}/$d"
	done
	
    for f in $(find . -type f); do
	  install -m644  "${srcdir}/${_filename}/$f" "${installdir}/$f"
	done
}
