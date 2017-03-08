# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=sedutil
pkgver=1.12
pkgrel=4
pkgdesc="TCG OPAL 2.00 SED Management Program"
arch=('i686' 'x86_64')
url="https://github.com/Drive-Trust-Alliance/sedutil"
license=('GPL3')
optdepends=('syslinux: to create a bootable PBA disk image'
            'gptfdisk: to create a bootable PBA disk image'
            'parted: to create a bootable PBA disk image'
            'intel-ucode: microcode update files for Intel CPUs'
            'yubikey-personalization: for yubikey support')
backup=('etc/linuxpba/linuxpba.conf')
install=sedutil.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drive-Trust-Alliance/${pkgname}/archive/${pkgver}.tar.gz"
        'syslinux.cfg'
        'mklinuxpba-initramfs'
        'mklinuxpba-diskimg'
        'linuxpba-arch'
        'linuxpba.conf.etc'
        'linuxpba.conf.lib'
        'linuxpba.hook'
        'linuxpba.install'
        'getpasswd.c'
        'nvme_ioctl.patch::https://github.com/bcarmo-caio/sedutil/commit/5ca6100917a025f6e11ae20838e1e37e7db2d587.patch')
sha256sums=('5509d4279cfb316f33730c5cb06f8162ae212c7f4d31d206642d67cc8be245c1'
            '40d785c16a28a5a8a43050d1731174482ee24459be215d2e4e27ffba3b2e28b2'
            '77c725e4eee095dbede512d2bca13b8f2c139a67b9b87a11d98be94e6df0e1d7'
            'b860d4d6fcc14a61d110c1d805d919fdfcf0fffaa8f0175b5ecddf60051f7941'
            '6aa4a9cb90da2d1b0f5eae6a9b487d6b7504d40b44ac62ec70edeef15ed40ee3'
            '6bf64faa4e413bac489e83518daf6963760cc4474ea2b848d0192402214c0efb'
            'a110e6d6da0fd658412d8c79f7f2cbc58a9b0067c34c34c94c8f623801eecc78'
            'd9a7b66d8365e7f4eb0233b30c0ab70b5e978f6554960bf12994a1f0910c1447'
            'f31a0ba891dd705ef68174afeb651bdc3426a63202d058d98510907de43248f7'
            'e94d011c98bd336f37d6d4923e5d63a22ebd10d8f2c6486b6bcd6617524d6484'
            'ef179c054ed79399cdb2cdf9e43e565d5556891e7676b795e55d126b2641a919')
PKGEXT='.pkg.tar'
CPPFLAGS="$CPPFLAGS -O2"

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    patch -p1 < "${srcdir}/nvme_ioctl.patch"
}

build() {
    _release="Release_$CARCH"
    cd "${srcdir}/"
    gcc -Wall -o getpasswd getpasswd.c

    cd "${srcdir}/${pkgname}-${pkgver}/linux/CLI/"
    make CONF="${_release}" build

    [[ "$CARCH" == "i686" ]] && _release="Release"
    cd "${srcdir}/${pkgname}-${pkgver}/LinuxPBA/"
    make CONF="${_release}" build
}

package() {
    _release="Release_$CARCH"
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "linux/CLI/dist/${_release}/GNU-Linux/sedutil-cli" "${pkgdir}/usr/bin/sedutil-cli"
    install -Dm644 "linux/PSIDRevert_LINUX.txt" "${pkgdir}/usr/share/doc/${pkgname}/PSIDRevert.txt"
    [[ "$CARCH" == "i686" ]] && _release="Release"
    install -Dm755 "LinuxPBA/dist/${_release}/GNU-Linux/linuxpba" "${pkgdir}/usr/bin/linuxpba"
    install -Dm755 "${srcdir}/mklinuxpba-initramfs" "${pkgdir}/usr/bin/mklinuxpba-initramfs"
    install -Dm755 "${srcdir}/mklinuxpba-diskimg" "${pkgdir}/usr/bin/mklinuxpba-diskimg"
    install -Dm755 "${srcdir}/linuxpba-arch" "${pkgdir}/usr/bin/linuxpba-arch"
    install -Dm755 "${srcdir}/getpasswd" "${pkgdir}/usr/bin/getpasswd"

    install -Dm644 "${srcdir}/linuxpba.hook" "${pkgdir}/usr/lib/initcpio/hooks/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.install" "${pkgdir}/usr/lib/initcpio/install/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.conf.etc" "${pkgdir}/etc/linuxpba/linuxpba.conf"
    install -Dm644 "${srcdir}/linuxpba.conf.lib" "${pkgdir}/usr/lib/linuxpba/linuxpba.conf"
    install -Dm644 "${srcdir}/syslinux.cfg" "${pkgdir}/usr/lib/linuxpba/syslinux.cfg"
}
