# Original contributors:
#   Tobias Powalowski <tpowa@archlinux.org>
#   Thomas Baechler <thomas@archlinux.org>
#   graysky <graysky@archlinux.us>

pkgname=(linux-lts318-ck linux-lts318-ck-headers)
pkgver=3.18.30
pkgrel=1
arch=(i686 x86_64)
url="https://www.kernel.org/"
license=(GPL2)
makedepends=(kmod inetutils bc)
options=(!strip)
source=(
    "https://www.kernel.org/pub/linux/kernel/v3.x/linux-${pkgver}.tar.xz"

    "https://www.kernel.org/pub/linux/kernel/v3.x/linux-${pkgver}.tar.sign"
    "http://ck.kolivas.org/patches/3.0/3.18/3.18-ck1/patch-3.18-ck1.bz2"
    "http://repo-ck.com/source/gcc_patch/enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch.gz"
    "linux-lts318-ck.preset"
    "change-default-console-loglevel.patch"

    "config"
    "config.x86_64"

    "http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.18.0-v7r8/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r8-3.18.0.patch"
    "http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.18.0-v7r8/0002-block-introduce-the-BFQ-v7r8-I-O-sched-for-3.18.0.patch"
    "http://algo.ing.unimo.it/people/paolo/disk_sched/patches/3.18.0-v7r8/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r8-for-3.18.0.patch"
)

sha512sums=(
    "54bd3a2a9271e74a6b0e4c749e3f3d2630ef9aeef639bc2449f2dc5ad46dbdd404069e0b620a6a5567e832cc2d405cb39f2330bdaf72cadb39bf75f5b6803600"

    "SKIP"
    "c1ffbbc641cf9ef3c666a1fe5ddff1ab9ed02eb2d8d229d5ce4c11487609ef81beee456c211a658355c2061a108042929b9ad62914395a22077754ade4eb6a23"
    "62fdd5c0a060a051b64093d71fbb028781061ccb7a28c5b06739a0b24dac0945740d9b73ff170784f60005a589774bcc14f56523ec51557eb3a677f726ec34cf"
    "5877f717c7a6eb9add32fd877394d7e6dd5b9238e4407a9ede18c3dc39be3fa0307c17fbd2bf3cc42dabe0756bf870934399c4150b20c9082f77749ef3ef49c3"
    "d9d28e02e964704ea96645a5107f8b65cae5f4fb4f537e224e5e3d087fd296cb770c29ac76e0ce95d173bc420ea87fb8f187d616672a60a0cae618b0ef15b8c8"

    "dc25f38431aa48379d9362e9c847ff3bae6c685c4a0ed3637059e8ae02c40200c5b02793d3a6d882cc28eee88537fcd9e6058ad0c3f447e70cb9fa920995c37a"
    "9d172d12fd9f227c17da1e98c3acf4b13b12b83a4061c1907e4975a690058df6b615982710cb28636d4949a95cb0e9fe9bcbe2d072c282a081746be7e6ee6b6d"

    "d3178ffbe2fc35b1b2bfccef587a658d5bd148a691bc9d6e3a0adfa7b6729f755278f638cd1e615fbfb96a1b847c660b24418df38710e3aee86ddaa378ad0c82"
    "29123cad496e9df7a6babb0afbc77af9990b22b08d8e8867139586fdf1be2b198c1400b05761d68cf1264df57f567ae745cf6024d1f4a744a21cae664e8bc4e1"
    "54aa608ec24289b219a1dc4290f0e77a8cd92213ff2b08292239a9ca839b613868519ed270c27c59b4d0b85c6cc1d088e6785ac40defbcf2188266ac12314c3f"
)

validpgpkeys=(
    "ABAF11C65A2970B130ABE3C479BE3E4300411886" # Linux Torvalds
    "647F28654894E3BD457199BE38DBBDC86092693E" # Greg Kroah-Hartman
)

prepare() {
    cd "${srcdir}/linux-${pkgver}"

    patch -p1 -i "${srcdir}/change-default-console-loglevel.patch"

    sed -i -re "s/^(.EXTRAVERSION).*$/\1 = /" "${srcdir}/patch-3.18-ck1"

    patch -p1 -i "${srcdir}/patch-3.18-ck1"

    patch -p1 -i "${srcdir}/enable_additional_cpu_optimizations_for_gcc_v4.9+_kernel_v3.15+.patch"

    patch -p1 -i "${srcdir}/0001-block-cgroups-kconfig-build-bits-for-BFQ-v7r8-3.18.0.patch"
    patch -p1 -i "${srcdir}/0002-block-introduce-the-BFQ-v7r8-I-O-sched-for-3.18.0.patch"
    patch -p1 -i "${srcdir}/0003-block-bfq-add-Early-Queue-Merge-EQM-to-BFQ-v7r8-for-3.18.0.patch"

    if [ "$CARCH" = "x86_64" ]; then
        cat "${srcdir}/config.x86_64" > ./.config
    else
        cat "${srcdir}/config" > ./.config
    fi

    sed -ri "s|^(EXTRAVERSION =).*|\1 -${pkgrel}|" Makefile

    sed -i '2iexit 0' scripts/depmod.sh

    make prepare

    #sudo /usr/bin/modprobed_db recall
    #make localmodconfig

    #make nconfig
    #make menuconfig
    #make xconfig
    #make gconfig
}

build() {
    cd "${srcdir}/linux-${pkgver}"

    make LOCALVERSION= bzImage modules
}

package_linux-lts318-ck() {
    pkgdesc="Linux 3.18-lts with Brain Fuck Scheduler"
    depends=(coreutils linux-firmware kmod "mkinitcpio>=0.7")
    optdepends=("crda: to set the correct wireless channels for your country")
    backup=(etc/mkinitcpio.d/linux-lts318-ck.preset)
    install=linux-lts318-ck.install

    cd "${srcdir}/linux-${pkgver}"

    KARCH=x86

    _kernver="$(make LOCALVERSION= kernelrelease)"

    mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
    make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
    cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-linux-lts318-ck"

    sed -e "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/g" \
        -i "${startdir}/${install}"

    install -D -m644 "${srcdir}/linux-lts318-ck.preset" "${pkgdir}/etc/mkinitcpio.d/linux-lts318-ck.preset"

    rm -f "${pkgdir}/lib/modules/${_kernver}/"{source,build}
    rm -rf "${pkgdir}/lib/firmware"

    find "${pkgdir}" -name "*.ko" -exec gzip -9 {} \;

    ln -s "../extramodules-3.18-lts318-ck" "${pkgdir}/lib/modules/${_kernver}/extramodules"
    mkdir -p "${pkgdir}/lib/modules/extramodules-3.18-lts318-ck"
    echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-3.18-lts318-ck/version"

    depmod -b "${pkgdir}" -F System.map "${_kernver}"

    mkdir -p "${pkgdir}/usr"
    mv "${pkgdir}/lib" "${pkgdir}/usr/"

    install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"
}

package_linux-lts318-ck-headers() {
    pkgdesc='Header files and scripts for linux-lts318-ck'
    depends=('linux-lts318-ck')

    install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

    cd "${srcdir}/linux-${pkgver}"
    install -D -m644 Makefile \
        "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
    install -D -m644 kernel/Makefile \
        "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
    install -D -m644 .config \
        "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

    for i in acpi asm-generic config crypto drm generated keys linux math-emu media net pcmcia scsi sound trace uapi video xen; do
        cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
    done

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
    cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

    cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
    cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

    chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

    cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

    if [ "${CARCH}" = "i686" ]; then
        cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
    fi

    cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

    install -D -m644 Documentation/DocBook/Makefile \
        "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
    cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
    cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211"
    cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
    cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"

    if [ -d include/config/dvb/ ]; then
        mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb"
        cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
    fi

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
    cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c"
    cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
    cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
    cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
    cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
    mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"

    for i in $(find . -name "Kconfig*"); do
        mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
        cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
    done

    chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
    find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

    find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
        case "$(file -bi "${binary}")" in
            *application/x-sharedlib*)
                /usr/bin/strip ${STRIP_SHARED} "${binary}";;
            *application/x-archive*)
                /usr/bin/strip ${STRIP_STATIC} "${binary}";;
            *application/x-executable*)
                /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
        esac
    done

    rm -rf "${pkgdir}/usr/src/linux-${_kernver}/arch/"{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
}
