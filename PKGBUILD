# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=sedutil
pkgver=1.12
pkgrel=2
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
        'getpasswd.c'
        'includes.patch')
sha256sums=('5509d4279cfb316f33730c5cb06f8162ae212c7f4d31d206642d67cc8be245c1'
            '5ab7ef67fea0f4e370d8f0a4da87636a1df18e0edb0152d08f906f38280cc0e8'
            '77c725e4eee095dbede512d2bca13b8f2c139a67b9b87a11d98be94e6df0e1d7'
            'c599c6066f23aa403cd7c4c43b9b9900079cdbb7bc0b97c79e70a2383864646f'
            '6aa4a9cb90da2d1b0f5eae6a9b487d6b7504d40b44ac62ec70edeef15ed40ee3'
            '6bf64faa4e413bac489e83518daf6963760cc4474ea2b848d0192402214c0efb'
            'a110e6d6da0fd658412d8c79f7f2cbc58a9b0067c34c34c94c8f623801eecc78'
            'd9a7b66d8365e7f4eb0233b30c0ab70b5e978f6554960bf12994a1f0910c1447'
            'f31a0ba891dd705ef68174afeb651bdc3426a63202d058d98510907de43248f7'
            'e94d011c98bd336f37d6d4923e5d63a22ebd10d8f2c6486b6bcd6617524d6484'
            'c9ab6e72db01fa0a3d694cccd652917071b35b2c446f2024725eb37aad0caefc')
PKGEXT='.pkg.tar'
CPPFLAGS="$CPPFLAGS -O2"

prepare() {
    KVER="$(uname -r)"
    cd "${srcdir}/${pkgname}-${pkgver}/"
    patch -p1 < "${srcdir}/includes.patch"
    sed -i "s/%KVER%/${KVER}/" "./linux/DtaDevLinuxNvme.h"
}

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
    install -Dm755 "linux/CLI/dist/Release_$CARCH/GNU-Linux/sedutil-cli" "${pkgdir}/usr/bin/sedutil-cli"
    install -Dm644 "linux/PSIDRevert_LINUX.txt" "${pkgdir}/usr/share/doc/${pkgname}/PSIDRevert.txt"
    install -Dm755 "LinuxPBA/dist/Release_$CARCH/GNU-Linux/linuxpba" "${pkgdir}/usr/bin/linuxpba"
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
