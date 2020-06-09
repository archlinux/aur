# Maintainer: William Gathoye <william + aur at gathoye dot be> (4.17-now)
# Contributor: Andre Ericson <de dot ericson at gmail dot com> (4.6-4.17)
# Contributor: madmack <ali at devasque dot com> (x-4.6)

pkgname=asix-dkms
_pkgbase=asix
pkgver=4.24.0
pkgrel=1
pkgdesc='A kernel module for ASIX AX88760 AX88772 AX88772A AX88772B AX88772C AX88178 USB 2.0 network adapters'
arch=('i686' 'x86_64')

# Browse the pages for USB-to-Ethernet devices and see which devices are
# compatible with this driver.
# https://www.asix.com.tw/download.php?sub=driverdetail&PItemID=84
url="http://www.asix.com.tw/"
license=('GPL')

depends=('dkms')
provides=('asix-dkms' 'asix-module')
conflicts=("asix-module")

_filename="AX88772C_772B_772A_760_772_178_Linux_Driver_v${pkgver}_Source"
source=(
    "https://www.asix.com.tw/FrootAttach/driver/${_filename}.tar.bz2"
    'dkms.conf'
    '0001-linux-5.5.patch'
)
sha512sums=(
    '039622836e321350476e37120e837885bea070f17782232150c157ee667335952f694b052ebdeb4e7df35d4c342a788dd661066f5b5d7606a2600bdebeb68958'
    'ba2f214bc0baa2b2f8baf480e904ea8ed15dfc24c15d3dd453f9a0db47615b16ff5722fc1384435959b281b4ec322956ba1380fef8146ef019ddc56e304c495d'
    'c2d1c1718b89624a244e0dc697557f9b0f9de08fbb8a85356f836e55b8e6aa2a88630aaa14d28a76cac16ee949153fec2caf427e3b1ecac9fb44cf8519ce2215'
)

prepare() {
    cd "${srcdir}/${_filename}"

    # Linux kernel internals changed since Linux 5.5.
    patch -p1 < "${srcdir}/0001-linux-5.5.patch"

    # Use a DKMS build against the right kernel release
    sed -i "${srcdir}/${_filename}/Makefile" \
        -e 's/^KDIR.*/KDIR   = \/lib\/modules\/$(KERNELRELEASE)\/build/g' \
        -e 's/SUBDIRS/M/g'

    # # Add module version to differenciate with the kernel module from
    # # upstream/Arch Linux kernel.
    # echo "MODULE_VERSION(\"${pkgver}.${pkgrel}\");" >> "${srcdir}/${_filename}/asix.c"
}

package() {
    # We are in the source directory ./src/
    # Please note the source of the driver are in a subfolder:
    # i.e.: src/AX88772C_772B_772A_760_772_178_Linux_Driver_v<version>_Source/
    installDir="${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"
    install -dm755 "${installDir}"

    install -m644 dkms.conf "${installDir}/dkms.conf"

    # Even if upstream (and Arch Linux kernel as well) already have a module
    # named asix, we will put it in the /updates folder. The one placed in
    # updates will automatically supersede the one from upstream, this is
    # simpler as this doesn't require blacklisting.
    sed -i "${installDir}/dkms.conf" \
        -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/"

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
    # We are using a 'while' loop with 'read' and process substitution in order
    # to harden this script in the event special chars were to be used.
    # src.: http://mywiki.wooledge.org/BashPitfalls#line-92
    while IFS= read -r -d '' directory; do
        install -dm755 "${installDir}/${directory}"
    done < <(find . -type d -print0)

    while IFS= read -r -d '' file; do
        install -m644  "${srcdir}/${_filename}/${file}" "${installDir}/${file}"
    done < <(find . -type f -print0)
}
