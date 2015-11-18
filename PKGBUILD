# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=sedutil
pkgver=1.10
pkgrel=3
pkgdesc="TCG OPAL 2.00 SED Management Program"
arch=('i686' 'x86_64')
url="https://github.com/Drive-Trust-Alliance/sedutil"
license=('GPL3')
optdepends=('syslinux: to create a bootable PBA disk image'
            'intel-ucode: microcode update files for Intel CPUs'
            'yubikey-personalization: for yubikey support')
backup=('etc/linuxpba/linuxpba.conf')
install=sedutil.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drive-Trust-Alliance/${pkgname}/archive/${pkgver}.tar.gz"
        'extlinux.conf'
        'mklinuxpba-initramfs'
        'mklinuxpba-bios'
        'linuxpba-arch'
        'linuxpba.conf.etc'
        'linuxpba.conf.lib'
        'linuxpba.hook'
        'linuxpba.install'
        'getpasswd.c')
sha256sums=('31b1006a1f65b83fb419635f21a02bfb99bed8d4d6b351f566831af3682165dd'
            '5ab7ef67fea0f4e370d8f0a4da87636a1df18e0edb0152d08f906f38280cc0e8'
            '77c725e4eee095dbede512d2bca13b8f2c139a67b9b87a11d98be94e6df0e1d7'
            'c599c6066f23aa403cd7c4c43b9b9900079cdbb7bc0b97c79e70a2383864646f'
            '80a7bdea707a0935310adc3c88a2e0958767134315a2da284bc2afb0ed1b2135'
            '6bf64faa4e413bac489e83518daf6963760cc4474ea2b848d0192402214c0efb'
            'a110e6d6da0fd658412d8c79f7f2cbc58a9b0067c34c34c94c8f623801eecc78'
            'd9a7b66d8365e7f4eb0233b30c0ab70b5e978f6554960bf12994a1f0910c1447'
            'f31a0ba891dd705ef68174afeb651bdc3426a63202d058d98510907de43248f7'
            'e94d011c98bd336f37d6d4923e5d63a22ebd10d8f2c6486b6bcd6617524d6484')
PKGEXT='.pkg.tar'
CPPFLAGS="$CPPFLAGS -O2"

build() {
    cd "${srcdir}/"
    gcc -Wall -o getpasswd getpasswd.c
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
    install -Dm755 "${srcdir}/linuxpba-arch" "${pkgdir}/usr/bin/linuxpba-arch"
    install -Dm755 "${srcdir}/getpasswd" "${pkgdir}/usr/bin/getpasswd"

    install -Dm644 "${srcdir}/linuxpba.hook" "${pkgdir}/usr/lib/initcpio/hooks/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.install" "${pkgdir}/usr/lib/initcpio/install/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.conf.etc" "${pkgdir}/etc/linuxpba/linuxpba.conf"
    install -Dm644 "${srcdir}/linuxpba.conf.lib" "${pkgdir}/usr/lib/linuxpba/linuxpba.conf"
    install -Dm644 "${srcdir}/extlinux.conf" "${pkgdir}/usr/lib/linuxpba/extlinux.conf"
}
