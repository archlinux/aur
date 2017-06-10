# Maintainer: William Gathoye <william + aur at gathoye dot be> (4.17-now)
# Contributor: Moritz Lipp <mlq at pwmt dot org>

pkgname=asix-ax88179-dkms
pkgver=1.18.0
pkgrel=4
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

_filename="AX88179_178A_LINUX_DRIVER_v${pkgver}_SOURCE"
_modname='ax88179_178a'
source=(
    "http://www.asix.com.tw/FrootAttach/driver/${_filename}.tar.bz2"
    "${pkgname}.conf"
    "0001-No-date-time.patch"
    "0002-b2b128.patch"
)
sha512sums=(
    '1fb871aca533eeac9476f647a9e6bebcc2151f9327240d31fcc8cdb4d566006386685b77a437924ca05785ec23d82d82d8c485fede5edac70a81742ea82fdf22'
    'c22d3ec8bea598580681c6a9e2ae6b3d2118547a739ee717d4576653426ace7ec2406012d162ec6424244c360a2b9b7a185dbf3eebba6c0065efedfb54de23ba'
    '74a730f2ccfabf54c600391ee9a54ad3977b730c141c9ca9e7b1740c0d93161595a71312b4e3067411bde2f7d7f2a1cb9fb9e982a6ccfc0a4fbfa86829f6c346'
    'a31cab0b3e0fa027acbf629aec7294d591d6dd01928de800bd915e78c75be7be0fe7603b6c69ed90f5a6fefe30ecf6a953fa154cccb03b9cb3e070e7566394f8'
)

prepare() {
    cd "${srcdir}/${_filename}"

    # Adds -Wno-date-time to the CFLAGS used in the Makefile in order to
    # disable warnings (which might be considered as errors by make if -Werror
    # is used) when __DATE__ and __TIME__ are used in the source code.
    patch -p1 < "${srcdir}/0001-No-date-time.patch"

    # Adds some patches brought by upstream (kernel.org) in order to support
    # devices based on the same ASIX chipset as this one or to solve bugs with
    # specific versions of the kernel.
    patch -p1 < "${srcdir}/0002-b2b128.patch"
}

package() {
	installDir="${pkgdir}/usr/src/${_modname}-dkms-${pkgver}"
	
	install -dm755 "${installDir}"

    # The kernel from kernel.org does provide an outdated module ax88179_178a.
    # Arch Linux packages that module in their default kernel (normal + lts).
    # We need to blacklist this module. This makes sure it is not loaded as
    # ours will be conflicting with the default module.
	install -dm755 "${pkgdir}/etc/modprobe.d"
	install -m644 /dev/null \
        "${pkgdir}/etc/modprobe.d/blacklist-${_modname}.conf"
	printf "blacklist ${_modname}\n" \
        > "${pkgdir}/etc/modprobe.d/blacklist-${_modname}.conf"

    # Load ax88179_178a-dkms automatically at boot
	install -dm755 "${pkgdir}/etc/modules-load.d"
    install -m644 /dev/null \
        "${pkgdir}/etc/modules-load.d/${_modname}-dkms.conf"
	printf "${_modname}-dkms\n" \
        > "${pkgdir}/etc/modules-load.d/${_modname}-dkms.conf"

    # Patch dkms file and rename it to the mandatory dkms.conf filename.
    install -m644 "${pkgname}.conf" "${installDir}/dkms.conf"
    sed -e "s/@PKGVER@/${pkgver}/" \
        -i "${installDir}/dkms.conf"

    # Install module source
    cd "${srcdir}/${_filename}"

    # We could use a simple 'cp' here as even if we have a custom umask,
    # makepkg is redefining his own umask value 0022.
    # src.: https://git.archlinux.org/pacman.git/tree/scripts/makepkg.sh.in?id=4f2fea240d3039294f6614003206a3dd1f67cfc5#n1255
    # Also, if we were using a simple 'cp', we would have relied upon upstream
    # providing a tar archive with the rights we want (755 for folders and 644
    # for files). While this is currently the case for now, if upstream does
    # not respect these rights, here, we are making sure we have the rights we
    # want.
    # And use a 'while' loop with 'read' and process substitution to harden
    # this script when special chars are used.
    # src.: http://mywiki.wooledge.org/BashPitfalls#line-92
    while IFS= read -r -d '' d; do
        install -dm755 "${installDir}/$d"
    done < <(find . -type d -print0)

    while IFS= read -r -d '' f; do
        install -m644  "${srcdir}/${_filename}/$f" "${installDir}/$f"
    done < <(find . -type f -print0)
}
