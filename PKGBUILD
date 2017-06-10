# Maintainer: William Gathoye <william + aur at gathoye dot be> (4.17-now)
# Contributor: Andre Ericson <de dot ericson at gmail dot com> (4.6-4.17)
# Contributor: madmack <ali at devasque dot com> (x-4.6)

pkgname=asix-dkms
pkgver=4.20.0
pkgrel=2
pkgdesc="Driver for USB ASIX Ethernet models AX88760 AX88772 AX88772A AX88772B AX88772C AX88178"
arch=('i686' 'x86_64')

# Browse the pages for USB-to-Ethernet devices and see which devices are
# comatible with this driver.
# http://asix.com.tw/products.php?op=ProductList&PLine=71&PSeries=100
url="http://www.asix.com.tw/"
license=('GPL')

depends=('dkms')
provides=('asix-dkms' 'asix-module')
conflicts=("asix-module")

_filename="AX88772C_772B_772A_760_772_178_LINUX_DRIVER_v${pkgver}_Source"
source=(
    "http://asix.com.tw/FrootAttach/driver/${_filename}.tar.gz"
    'asix-dkms.conf'
)
sha512sums=(
    '1c51cba49481b7a7273019c9ce6fdf988cfbeeb270cef78a5722439f8fd0e07e9e05bc4983b81998724413df803f3aabe5a75d0367a0423751115e4c2f64009d'
    'ded1bed08f61ce207e394fc4f49345f0ea50639f53fb797907402b3503feecc485ba85fb799f2b3bc9c22cd4a250509c5eb99d4b36d42228a9475a9e7d67b293'
)

package() {
    # We are in the source directory ./src/
    # Please note the source of the driver are in a subfolder:
    # i.e.: src/AX88772C_772B_772A_760_772_178_LINUX_DRIVER_v<version>_Source/

    installDir="$pkgdir/usr/src/${pkgname%-dkms}-${pkgver}"

    install -dm755 "$installDir"

    # The kernel from kernel.org does provide an outdated module asix.
    # Arch Linux packages that module in their default kernel (normal + lts).
    # We need to blacklist this module. This makes sure it is not loaded as
    # ours will be conflicting with the default module.
	install -dm755 "${pkgdir}/etc/modprobe.d"
	install -m644 /dev/null \
        "${pkgdir}/etc/modprobe.d/blacklist-asix.conf"
	printf "blacklist asix\n" \
        > "${pkgdir}/etc/modprobe.d/blacklist-asix.conf"

    # Load asix-dkms automatically at boot
	install -dm755 "${pkgdir}/etc/modules-load.d"
    install -m644 /dev/null \
        "${pkgdir}/etc/modules-load.d/asix-dkms.conf"
	printf "${pkgname}\n" \
        > "${pkgdir}/etc/modules-load.d/asix-dkms.conf"

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
