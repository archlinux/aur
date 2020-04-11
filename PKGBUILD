# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=linux-rockchip-ayufan
_pkgname="${pkgname#linux-}"
_kname="${_pkgname}-gfd4492386213"
pkgver=4.4.202
pkgrel=1237
arch=('aarch64')
url="https://github.com/ayufan-rock64/linux-kernel"
license=('GPL2')
pkgdesc="The Linux Kernel and modules - rockchip ayufan"
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')  # 'linux-firmware-rockchip-ayufan'
optdepends=('crda: to set the correct wireless channels of your country')
provides=('kernel26' "linux=${pkgver}")
conflicts=('kernel26' 'linux')
install=linux-rockchip-ayufan.install

source=("https://github.com/ayufan-rock64/linux-kernel/releases/download/${pkgver}-${pkgrel}-${_pkgname}/linux-image-${pkgver}-${pkgrel}-${_kname}_${pkgver}-${pkgrel}-${_pkgname}_arm64.deb"
        "60-linux-rockchip-ayufan.hook"
        "90-linux-rockchip-ayufan.hook"
        "linux-rockchip-ayufan.install"
        "linux-rockchip-ayufan.preset")

sha256sums=('eabf8e88a958f46f9a8c68f2a512e700a4550b4931e2092547468b9593c8b261'
            '304c57d870e8718cdaddc28f23f03d3bb05d0dcaa4869a5eee6e151dab5e22c2'
            '1ae0110a21acb2bb13327592ded352a5327dc248ec382fb32ce9163902dc0602'
            '2fb92aaac64a05ed9716bffd67be9468c67805b4e03ecbc81ab1e59e004696d3'
            '13edb9b975b4176dc4b664f18ead201f2a87bacd0c76d50fd9453fc4e89316f1')

prepare() {
    cd $srcdir
    mkdir -p ${_kname}-${pkgver}-${pkgrel}
    tar xaf data.tar.xz -C ${_kname}-${pkgver}-${pkgrel}
}

package() {
    # kernel, system map, config
    install -Dm0644 "$srcdir/${_kname}-${pkgver}-${pkgrel}/boot/System.map-${pkgver}-${pkgrel}-${_kname}" "$pkgdir/boot/System.map"
    install -Dm0644 "$srcdir/${_kname}-${pkgver}-${pkgrel}/boot/config-${pkgver}-${pkgrel}-${_kname}" "$pkgdir/boot/config"
    install -Dm0644 "$srcdir/${_kname}-${pkgver}-${pkgrel}/boot/vmlinuz-${pkgver}-${pkgrel}-${_kname}" "$pkgdir/boot/vmlinux-linux"

    # modules
    install -d "$srcdir/${_kname}-${pkgver}-${pkgrel}/lib/modules/${pkgver}-${pkgrel}-${_kname}/" "$pkgdir/lib/modules/${pkgver}-${pkgrel}-${_kname}/"

    # dtbs
    install -d "$pkgdir/boot/dtbs/"
    for dtb in $srcdir/${_kname}-${pkgver}-${pkgrel}/usr/lib/linux-image-${pkgver}-${pkgrel}-${_kname}/rockchip/*.dtb; do
        install -Dm0644 "$dtb" "$pkgdir/boot/dtbs/$(basename $dtb)"
    done

    # install mkinitcpio preset file
    install -Dm0644 "$srcdir/${pkgname}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"

    # install pacman hooks
    sed "s|%KERNVER%|${pkgver}-${pkgrel}-${_kname}|g" "$srcdir/60-${pkgname}.hook" | install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgname}.hook"
    install -Dm644 "$srcdir/90-${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/90-${pkgname}.hook"
}

