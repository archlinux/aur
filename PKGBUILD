# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=sedutil
pkgver=1.10
pkgrel=1
pkgdesc="TCG OPAL 2.00 SED Management Program"
arch=('i686' 'x86_64')
url="https://github.com/Drive-Trust-Alliance/sedutil"
license=('GPL3')
optdepends=('syslinux: to create a bootable PBA disk image'
            'intel-ucode: microcode update files for Intel CPUs')
install=sedutil.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drive-Trust-Alliance/${pkgname}/archive/${pkgver}.tar.gz"
        'extlinux.conf'
        'mklinuxpba-initramfs'
        'mklinuxpba-bios'
        'linuxpba.conf'
        'linuxpba.hook'
        'linuxpba.install')
sha256sums=('31b1006a1f65b83fb419635f21a02bfb99bed8d4d6b351f566831af3682165dd'
            '5ab7ef67fea0f4e370d8f0a4da87636a1df18e0edb0152d08f906f38280cc0e8'
            'c66318cb2ddd357de927ab47eb3ec4618a4353ad06e5bd48e6676d77b48b323d'
            '046e481ffca77f222f4c044e32427f25bca12ac9a5e6832ea657596f8fd84228'
            '9273e9c5d5ce54be31a49ec42839b06d0e54752a19c9e6d4643793174ee9214e'
            'd9a7b66d8365e7f4eb0233b30c0ab70b5e978f6554960bf12994a1f0910c1447'
            '7c32370c3405fc33359c1fc5bb243f387c71ca454e9da88348669fd383f04558')
PKGEXT='.pkg.tar'
CPPFLAGS="$CPPFLAGS -O2"

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/linux/CLI/"
    make CONF=Release_$CARCH build
    cd "${srcdir}/${pkgname}-${pkgver}/LinuxPBA/"
    make CONF=Release_$CARCH build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "linux/CLI/dist/Release_$CARCH/GNU-Linux-x86/sedutil-cli" "${pkgdir}/usr/bin/sedutil-cli"
    install -Dm644 "linux/PSIDRevert_LINUX.txt" "${pkgdir}/usr/share/doc/${pkgname}/PSIDRevert.txt"
    install -Dm755 "LinuxPBA/dist/Release_$CARCH/GNU-Linux-x86/linuxpba" "${pkgdir}/usr/bin/linuxpba"
    install -Dm755 "${srcdir}/mklinuxpba-initramfs" "${pkgdir}/usr/bin/mklinuxpba-initramfs"
    install -Dm755 "${srcdir}/mklinuxpba-bios" "${pkgdir}/usr/bin/mklinuxpba-bios"

    install -Dm644 "${srcdir}/linuxpba.hook" "${pkgdir}/usr/lib/initcpio/hooks/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.install" "${pkgdir}/usr/lib/initcpio/install/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.conf" "${pkgdir}/etc/linuxpba/linuxpba.conf"
    install -Dm644 "${srcdir}/extlinux.conf" "${pkgdir}/etc/linuxpba/extlinux.conf"
}
