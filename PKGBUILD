# Maintainer: William Gathoye <william + aur at gathoye dot be> (4.17-now)
# Contributor: Andre Ericson <de dot ericson at gmail dot com> (4.6-4.17)
# Contributor: madmack <ali at devasque dot com> (x-4.6)

pkgname=asix-dkms
pkgver=4.23.0
pkgrel=4
pkgdesc="A kernel module for ASIX AX88760 AX88772 AX88772A AX88772B AX88772C AX88178 USB 2.0 network adapters"
arch=('i686' 'x86_64')

# Browse the pages for USB-to-Ethernet devices and see which devices are
# comatible with this driver.
# https://www.asix.com.tw/download.php?sub=driverdetail&PItemID=84
url="http://www.asix.com.tw/"
license=('GPL')

depends=('dkms')
provides=('asix-dkms' 'asix-module')
conflicts=("asix-module")

_filename="AX88772C_772B_772A_760_772_178_Linux_Driver_v${pkgver}_Source"
source=(
    "https://www.asix.com.tw/FrootAttach/driver/${_filename}.tar.bz2"
    'asix-dkms.conf'
    '0001-linux-4.20.patch'
)
sha512sums=(
    '7c43eed69e948f2d921b758c2dab1236540832c7ce48b7308b6e3fa5ee1e4f4bc9f190e1497ea85d7a953959bd86f00461ae81c0bbd710959c7dafba6c4c2688'
    'ded1bed08f61ce207e394fc4f49345f0ea50639f53fb797907402b3503feecc485ba85fb799f2b3bc9c22cd4a250509c5eb99d4b36d42228a9475a9e7d67b293'
    'e9e7025e8157d6950200a45a07d35de99c1342a60f02fa1701753e589cfa1964de86c136e8ce26f51d284cd716f75fe9953b1ee09381e9f1599aa89c8e61db8f'
)

prepare() {
    cd "${srcdir}/${_filename}"

    # Linux kernel internals changed since Linux 4.20.
    patch -p1 < "${srcdir}/0001-linux-4.20.patch"

    # Use a DKMS build against the right kernel release
    sed -i "${srcdir}/${_filename}/Makefile" \
        -e 's/^KDIR.*/KDIR   = \/lib\/modules\/$(KERNELRELEASE)\/build/g' \
        -e 's/SUBDIRS/M/g'
}

package() {
    # We are in the source directory ./src/
    # Please note the source of the driver are in a subfolder:
    # i.e.: src/AX88772C_772B_772A_760_772_178_Linux_Driver_v<version>_Source/
    installDir="${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"
    install -dm755 "${installDir}"

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

    # Install module sources
    cd "${srcdir}/${_filename}"

    # 'cp' would have the same effect as 'install' here, because, even if we
    # had defined a custom umask in our shell startup scripts, makepkg is
    # redefining his own umask value 0022.
    # src.: https://git.archlinux.org/pacman.git/tree/scripts/makepkg.sh.in?id=4f2fea240d3039294f6614003206a3dd1f67cfc5#n1255
    # Also, if we were using a simple 'cp', we would have to rely on upstream
    # providing the correct rights for us. While this is technically the case
    # for now, using 'install' ensures we are using the correct rights even if
    # upstream weren't.
    # We are using a 'while' loop with 'read' and process substitution in order to harden this
    # script in the event special chars were to be used.
    # src.: http://mywiki.wooledge.org/BashPitfalls#line-92
    while IFS= read -r -d '' directory; do
        install -dm755 "${installDir}/${directory}"
    done < <(find . -type d -print0)

    while IFS= read -r -d '' file; do
        install -m644  "${srcdir}/${_filename}/${file}" "${installDir}/${file}"
    done < <(find . -type f -print0)
}
