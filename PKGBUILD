# AArch64 multi-platform LTS
#
# Maintainer: Alexander Koch (lynix) <mail@alexanderkoch.net>
# Based on work by: Kevin Mihelich <kevin@archlinuxarm.org>

buildarch=8

pkgbase=linux-aarch64-lts
_srcname=linux-6.1
_kernelname=${pkgbase#linux}
_desc='AArch64 multi-platform LTS'
pkgdesc="The Linux Kernel and modules - ${_desc}"
pkgver=6.1.25
pkgrel=1
arch=('aarch64')
url='https://github.com/lynix/linux-aarch64-lts'
license=('GPL2')
makedepends=(
    'xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc' 'git' 'uboot-tools'
    'dtc'
)
options=('!strip')
source=(
    "https://www.kernel.org/pub/linux/kernel/v6.x/${_srcname}.tar.xz"
    "https://www.kernel.org/pub/linux/kernel/v6.x/patch-${pkgver}.xz"
    '0001-net-smsc95xx-Allow-mac-address-to-be-set-as-a-parame.patch'
    '0002-arm64-dts-rockchip-disable-pwm0-on-rk3399-firefly.patch'
    'config' 'linux.preset' '60-linux.hook' '90-linux.hook'
)
sha256sums=('2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb'
            '6415c1c25f7614d78bf04dae4c172fc2d460ab152dcc710dd8f46990b7a6cd31'
            '013ab7f5bcf2cd486e819fb13fde1f673ac72978984a8befea13938eaf8ddd8e'
            'bcb8a42654df5f9670367950daaa01b165c15618f827d18b7b2a8d53d39227a4'
            'ab85537c61a38a8234b7399095181e136f14b1709f07c2ee2bfbf37d7f854326'
            '6837b3e2152f142f3fff595c6cbd03423f6e7b8d525aac8ae3eb3b58392bd255'
            '452b8d4d71e1565ca91b1bebb280693549222ef51c47ba8964e411b2d461699c'
            '71df1b18a3885b151a3b9d926a91936da2acc90d5e27f1ad326745779cd3759d')

prepare() {
    cd $_srcname
  
    echo "Setting version..."
    scripts/setlocalversion --save-scmversion
    echo "-$pkgrel" > localversion.10-pkgrel
    echo "${pkgbase#linux}" > localversion.20-pkgname
  
    # upstream patch
    patch -Nsp1 < ../patch-${pkgver}
  
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Nsp1 < "../$src"
    done
  
    echo "Setting config..."
    cp ../config .config
    make olddefconfig
    diff -u ../config .config

    make -s kernelrelease > version
    echo "Prepared $pkgbase version $(<version)"
}

build() {
    cd ${_srcname}

    unset LDFLAGS
    make ${MAKEFLAGS} Image Image.gz modules

    # Generate device tree blobs with symbols to support applying
    # device tree overlays in U-Boot
    make ${MAKEFLAGS} DTC_FLAGS="-@" dtbs
}

_package() {
    depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
    optdepends=(
        'wireless-regdb: to set the correct wireless channels of your country'
    )
    provides=("linux=${pkgver}" "WIREGUARD-MODULE")
    conflicts=('linux')
    backup=("etc/mkinitcpio.d/${pkgbase}.preset")
    install=${pkgname}.install
  
    cd $_srcname
    local kernver="$(<version)"
    local modulesdir="$pkgdir/usr/lib/modules/$kernver"
  
    echo "Installing boot image and dtbs..."
    install -Dm644 arch/arm64/boot/Image{,.gz} -t "${pkgdir}/boot"
    make INSTALL_DTBS_PATH="${pkgdir}/boot/dtbs" dtbs_install

    echo "Installing modules..."
    make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 \
        modules_install

    # remove build and source links
    rm "$modulesdir"/{source,build}

    # sed expression for following substitutions
    local _subst="
        s|%PKGBASE%|${pkgbase}|g
        s|%KERNVER%|${kernver}|g
    "

    # install mkinitcpio preset file
    sed "${_subst}" ../linux.preset | install -Dm644 /dev/stdin \
      "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

    # install pacman hooks
    sed "${_subst}" ../60-linux.hook | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
    sed "${_subst}" ../90-linux.hook | install -Dm644 /dev/stdin \
        "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the ${_desc} kernel"
    provides=("linux-headers=${pkgver}")
    conflicts=('linux-headers')
  
    cd $_srcname
    local builddir="$pkgdir/usr/lib/modules/$(<version)/build"
  
    echo "Installing build files..."
    install -Dt "$builddir" -m644 .config Makefile Module.symvers \
        System.map localversion.* version vmlinux
    install -Dt "$builddir/kernel" -m644 kernel/Makefile
    install -Dt "$builddir/arch/arm64" -m644 arch/arm64/Makefile
    cp -t "$builddir" -a scripts
  
    # add xfs and shmem for aufs building
    mkdir -p "$builddir"/{fs/xfs,mm}
  
    echo "Installing headers..."
    cp -t "$builddir" -a include
    cp -t "$builddir/arch/arm64" -a arch/arm64/include
    install -Dt "$builddir/arch/arm64/kernel" -m644 \
        arch/arm64/kernel/asm-offsets.s
    mkdir -p "$builddir/arch/arm"
    cp -t "$builddir/arch/arm" -a arch/arm/include
  
    install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
    install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h
  
    # https://bugs.archlinux.org/task/13146
    install -Dt "$builddir/drivers/media/i2c" -m644 \
        drivers/media/i2c/msp3400-driver.h
  
    # https://bugs.archlinux.org/task/20402
    install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 \
        drivers/media/usb/dvb-usb/*.h
    install -Dt "$builddir/drivers/media/dvb-frontends" -m644 \
        drivers/media/dvb-frontends/*.h
    install -Dt "$builddir/drivers/media/tuners" -m644 \
        drivers/media/tuners/*.h
  
    # https://bugs.archlinux.org/task/71392
    install -Dt "$builddir/drivers/iio/common/hid-sensors" -m644 \
        drivers/iio/common/hid-sensors/*.h
  
    echo "Installing KConfig files..."
    find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;
  
    echo "Removing unneeded architectures..."
    local arch
    for arch in "$builddir"/arch/*/; do
        [[ $arch = */arm64/ || $arch == */arm/ ]] && continue
        echo "Removing $(basename "$arch")"
        rm -r "$arch"
    done
  
    echo "Removing documentation..."
    rm -r "$builddir/Documentation"
  
    echo "Removing broken symlinks..."
    find -L "$builddir" -type l -printf 'Removing %P\n' -delete
  
    echo "Removing loose objects..."
    find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete
  
    echo "Stripping build tools..."
    local file
    while read -rd '' file; do
        case "$(file -bi "$file")" in
            application/x-sharedlib\;*)      # Libraries (.so)
                strip -v $STRIP_SHARED "$file" ;;
            application/x-archive\;*)        # Libraries (.a)
                strip -v $STRIP_STATIC "$file" ;;
            application/x-executable\;*)     # Binaries
                strip -v $STRIP_BINARIES "$file" ;;
            application/x-pie-executable\;*) # Relocatable binaries
                strip -v $STRIP_SHARED "$file" ;;
        esac
    done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)
  
    echo "Adding symlink..."
    mkdir -p "$pkgdir/usr/src"
    ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
    eval "package_${_p}() {
        _package${_p#${pkgbase}}
    }"
done

# vim:set ts=4:sw=4:et:
