# Maintainer: Ricardo Band <email@ricardo.band>

pkgbase=linux-rockchip-ayufan
pkgname=('linux-rockchip-ayufan' 'linux-headers-rockchip-ayufan' 'linux-firmware-rockchip-ayufan')
_pkgbase="${pkgbase#linux-}"
_kname="${_pkgbase}-gfd4492386213"
_ver=4.4.202
_build=1237
pkgver="${_ver}.${_build}"
pkgrel=1300
arch=('aarch64')
url="https://github.com/ayufan-rock64/linux-kernel"
license=('GPL2')
makedepends=('binutils')
source=("https://github.com/ayufan-rock64/linux-kernel/releases/download/${_ver}-${_build}-${_pkgbase}/linux-image-${_ver}-${_build}-${_kname}_${_ver}-${_build}-${_pkgbase}_arm64.deb"
        "https://github.com/ayufan-rock64/linux-kernel/releases/download/${_ver}-${_build}-${_pkgbase}/linux-headers-${_ver}-${_build}-${_kname}_${_ver}-${_build}-${_pkgbase}_arm64.deb"
        "https://github.com/ayufan-rock64/linux-kernel/releases/download/${_ver}-${_build}-${_pkgbase}/linux-firmware-image-${_ver}-${_build}-${_kname}_${_ver}-${_build}-${_pkgbase}_arm64.deb"
        "60-linux-rockchip-ayufan.hook"
        "90-linux-rockchip-ayufan.hook"
        "linux-rockchip-ayufan.preset")
noextract=("linux-image-${_ver}-${_build}-${_kname}_${_ver}-${_build}-${_pkgbase}_arm64.deb"
           "linux-headers-${_ver}-${_build}-${_kname}_${_ver}-${_build}-${_pkgbase}_arm64.deb"
           "linux-firmware-image-${_ver}-${_build}-${_kname}_${_ver}-${_build}-${_pkgbase}_arm64.deb")
sha256sums=('eabf8e88a958f46f9a8c68f2a512e700a4550b4931e2092547468b9593c8b261'
            '1927ace8b2dc735937bfee06d2083ee51660680b9d5c8729e9c655cb219b08f2'
            '5a71818035e5ab0294dbf4c0e2d7c360121122119c9f9f60123a2f82d68a0789'
            '304c57d870e8718cdaddc28f23f03d3bb05d0dcaa4869a5eee6e151dab5e22c2'
            '1ae0110a21acb2bb13327592ded352a5327dc248ec382fb32ce9163902dc0602'
            '13edb9b975b4176dc4b664f18ead201f2a87bacd0c76d50fd9453fc4e89316f1')

prepare() {
    cd $srcdir

    for pkg in "linux-image" "linux-headers" "linux-firmware-image"; do
        echo "processing ... $pkg"
        mkdir -p ${pkg}-${_kname}-${_ver}-${_build}
        ar x ${pkg}-${_ver}-${_build}-${_kname}_${_ver}-${_build}-${_pkgbase}_arm64.deb
        tar xaf data.tar.xz -C ${pkg}-${_kname}-${_ver}-${_build}
        for f in $(ar t ${pkg}-${_ver}-${_build}-${_kname}_${_ver}-${_build}-${_pkgbase}_arm64.deb); do
            echo "deleting ... $f"
            rm -rf $f
        done
        ls
    done
}

package_linux-rockchip-ayufan() {
    pkgdesc="The Linux Kernel and modules - rockchip ayufan"
    depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')  # 'linux-firmware-rockchip-ayufan'
    optdepends=('crda: to set the correct wireless channels of your country')
    provides=('kernel26' "linux=${_ver}")
    conflicts=('kernel26' 'linux')
    install=linux-rockchip-ayufan.install

    # kernel, system map, config
    install -Dm0644 "$srcdir/linux-image-${_kname}-${_ver}-${_build}/boot/System.map-${_ver}-${_build}-${_kname}" "$pkgdir/boot/System.map"
    install -Dm0644 "$srcdir/linux-image-${_kname}-${_ver}-${_build}/boot/config-${_ver}-${_build}-${_kname}" "$pkgdir/boot/config"
    install -Dm0644 "$srcdir/linux-image-${_kname}-${_ver}-${_build}/boot/vmlinuz-${_ver}-${_build}-${_kname}" "$pkgdir/boot/vmlinux-linux"

    # modules
    install -d "$srcdir/linux-image-${_kname}-${_ver}-${_build}/lib/modules/${_ver}-${_build}-${_kname}/" "$pkgdir/lib/modules/${_ver}-${_build}-${_kname}/"

    # dtbs
    install -d "$pkgdir/boot/dtbs/"
    for dtb in $srcdir/linux-image-${_kname}-${_ver}-${_build}/usr/lib/linux-image-${_ver}-${_build}-${_kname}/rockchip/*.dtb; do
        install -Dm0644 "$dtb" "$pkgdir/boot/dtbs/$(basename $dtb)"
    done

    # install mkinitcpio preset file
    install -Dm0644 "$srcdir/${pkgbase}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

    # install pacman hooks
    sed "s|%KERNVER%|${_ver}-${_build}-${_kname}|g" "$srcdir/60-${pkgbase}.hook" | install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgbase}.hook"
    install -Dm644 "$srcdir/90-${pkgbase}.hook" "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"
}

package_linux-headers-rockchip-ayufan() {
    pkgdesc="Header files and scripts for building modules for linux kernel - rockchip ayufan"
    provides=("linux-headers=${_ver}")
    conflicts=('linux-headers')

    install -d "$srcdir/linux-headers-${_kname}-${_ver}-${_build}/usr/src/linux-headers-${_ver}-${_build}-${_kname}" "$pkgdir/usr/src/linux-headers-${_ver}-${_build}-${_kname}"
    install -d "$pkgdir/lib/modules/${_ver}-${_build}-${_kname}"
    ln -sf "/usr/src/linux-headers-${_ver}-${_build}-${_kname}" "$pkgdir/lib/modules/${_ver}-${_build}-${_kname}/build"
}

package_linux-firmware-rockchip-ayufan() {
    pkgdesc="Header files and scripts for building modules for linux kernel - rockchip ayufan"

    install -d "$srcdir/linux-firmware-image-${_kname}-${_ver}-${_build}/lib/firmware/${_ver}-${_build}-${_kname}" "$pkgdir/lib/firmware/${_ver}-${_build}-${_kname}"
}

