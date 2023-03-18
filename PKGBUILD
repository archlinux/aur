# Maintainer: Christoph Heiss <contact(at)christoph-heiss(dot)at>
# Contributor: Edward Pacman <edward(at)edward(minus)p(dot)xyz>
# Contributor: Kurobac <kurobac(at)foxmail(dot)com>

_pkgbase=alx-wol
_kernel_tag=6.1-arch1
pkgname=${_pkgbase}-dkms
pkgver=6
pkgrel=1
pkgdesc='The alx kernel module with a patch enabling WoL applied'
url='https://bugzilla.kernel.org/show_bug.cgi?id=61651'
license=('GPL')
arch=('i686' 'x86_64')
depends=('dkms')
optdepends=('linux-headers: Needed for build the module for Arch kernel'
            'linux-lts-headers: Needed for build the module for LTS Arch kernel'
            'linux-zen-headers: Needed for build the module for ZEN Arch kernel')
source=("alx.h::https://raw.githubusercontent.com/archlinux/linux/v${_kernel_tag}/drivers/net/ethernet/atheros/alx/alx.h"
        "ethtool.c::https://raw.githubusercontent.com/archlinux/linux/v${_kernel_tag}/drivers/net/ethernet/atheros/alx/ethtool.c"
        "hw.c::https://raw.githubusercontent.com/archlinux/linux/v${_kernel_tag}/drivers/net/ethernet/atheros/alx/hw.c"
        "hw.h::https://raw.githubusercontent.com/archlinux/linux/v${_kernel_tag}/drivers/net/ethernet/atheros/alx/hw.h"
        "main.c::https://raw.githubusercontent.com/archlinux/linux/v${_kernel_tag}/drivers/net/ethernet/atheros/alx/main.c"
        "reg.h::https://raw.githubusercontent.com/archlinux/linux/v${_kernel_tag}/drivers/net/ethernet/atheros/alx/reg.h"
        0001-drivers-net-alx-Re-enable-WoL-functionality.patch
        0002-net-alx-Add-MODULE_VERSION-to-fix-dkms-override.patch
        Kbuild
        dkms.conf)
sha256sums=('0ac6445e832c3413be3887917203699139ec05553270c5006b5a33ba5e2a158d'
            'a0df2f5f93253a7dde775479142bf3eb209b5268ad124f200915736de7cf5063'
            'bf9ac0fa98031523e05d5d62c08ee116fd4a437f66538c95eac18adda10ff89b'
            'fcc0306b37382cf8e2f75eafb6bd8696a4a5e360110e5cfe800485f4eebe55aa'
            '2bd9ee44c72a657007a9bbaef332b9435e949295773733d0ca96cea8a69e075f'
            '88a23ab8e6fe814efe81910bd8806f5988d367a628458154edaebdf4ccbe4902'
            '98f1ad3377a1b0a96dfe7b71eb6dedc0f9779033c59f5dc093b4a7779d270a89'
            '560783c1d0cd19859047360c317312f23cf1caabbd9d15aa101e98d3219da9a5'
            '8a62bb5adf6e554f470f88f8da58da0ce05cb8276ab56fb45ed5d31c71665d39'
            'f3aefc85fd246a74ee2be831c15b6440d22c497e84fba1f57e152c82f2946d1a')

prepare() {
    mkdir "${srcdir}/workdir"
    cd "${srcdir}/workdir"
    cp "${srcdir}/"{alx.h,ethtool.c,hw.c,hw.h,main.c,reg.h} .
    patch -p6 <../0001-drivers-net-alx-Re-enable-WoL-functionality.patch
    patch -p6 <../0002-net-alx-Add-MODULE_VERSION-to-fix-dkms-override.patch
}

package() {
    local dest="$pkgdir/usr/src/${_pkgbase}-$pkgver"
    mkdir -p $dest
    cd "${srcdir}/workdir/"
    cp --preserve=all {alx.h,ethtool.c,hw.c,hw.h,main.c,reg.h} $dest
    cd "${srcdir}"
    cp --preserve=all Kbuild dkms.conf $dest
}
