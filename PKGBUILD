# Maintainer: William Gathoye <william + aur at gathoye dot be> (4.17-now)
# Contributor: Moritz Lipp <mlq at pwmt dot org>

pkgname=asix-ax88179-dkms
pkgver=1.19.0
pkgrel=3
pkgdesc="A kernel module for ASIX AX88178A AX88179 USB 3.0 network adapters"
arch=('i686' 'x86_64')

_filename="AX88179_178A_LINUX_DRIVER_v${pkgver}_SOURCE"
_modname='ax88179_178a'

# Browse the pages for USB-to-Ethernet devices and see which devices are
# compatible with this driver.
# https://www.asix.com.tw/download.php?sub=driverdetail&PItemID=131
url='http://www.asix.com.tw/'
license=('GPL')

depends=('dkms')

_filename="AX88179_178A_LINUX_DRIVER_v${pkgver}_SOURCE"
_modname='ax88179_178a'
source=(
    "https://www.asix.com.tw/FrootAttach/driver/${_filename}.tar.bz2"
    "${pkgname}.conf"
    '0001-No-date-time.patch'
    '0002-b2b128.patch'
    '0003-linux-4.20.patch'
)
sha512sums=(
    '4868203e7a2574fc1760c604dc0f6d8a6890e4d65912bfc1e47bcef2fd72f422e791441cd65e58737b10edb5e04a40cf1e10585ae8b9f385adc729fb34b7fb8a'
    'c22d3ec8bea598580681c6a9e2ae6b3d2118547a739ee717d4576653426ace7ec2406012d162ec6424244c360a2b9b7a185dbf3eebba6c0065efedfb54de23ba'
    '74a730f2ccfabf54c600391ee9a54ad3977b730c141c9ca9e7b1740c0d93161595a71312b4e3067411bde2f7d7f2a1cb9fb9e982a6ccfc0a4fbfa86829f6c346'
    'a31cab0b3e0fa027acbf629aec7294d591d6dd01928de800bd915e78c75be7be0fe7603b6c69ed90f5a6fefe30ecf6a953fa154cccb03b9cb3e070e7566394f8'
    '74e5b9bfe73e6ff2a4a370ddf690462d3490e4d996ef1fe1f63bf5093ce70f63e309b60256e46d6085b694c2c5a6f8a811556497deba98292cd85708e5066589'
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

    # Linux kernel internals changed since Linux 4.20.
    patch -p1 < "${srcdir}/0003-linux-4.20.patch"

    # Use a DKMS build against the right kernel release
    sed -i "${srcdir}/${_filename}/Makefile" \
        -e '/#KDIR/d' \
        -e 's/^KDIR.*/KDIR   = \/lib\/modules\/$(KERNELRELEASE)\/build/g'
}

package() {
    # We are in the source directory ./src/
    # Please note the source of the driver are in a subfolder:
    # i.e.: src/AX88772C_772B_772A_760_772_178_Linux_Driver_v<version>_Source/
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
