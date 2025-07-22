# Maintainer: Chris Osgood <chris_sedutil@ffsys.com>
# Contributor: Mauro Santos <registo.mailling@gmail.com>

pkgname=sedutil
pkgver=1.49.13
pkgrel=1
pkgdesc="TCG OPAL 2.00 SED Management Program"
arch=('i686' 'x86_64')
url="https://github.com/Drive-Trust-Alliance/sedutil"
license=('GPL3')
depends=('libnvme')
optdepends=('syslinux: to create a bootable PBA disk image'
            'gptfdisk: to create a bootable PBA disk image'
            'parted: to create a bootable PBA disk image'
            'intel-ucode: microcode update files for Intel CPUs'
            'yubikey-personalization: for yubikey support'
            'dosfstools: to create a bootable PBA disk image'
            'mtools: to create a bootable PBA disk image')
backup=('etc/linuxpba/linuxpba.conf')
install=sedutil.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drive-Trust-Alliance/${pkgname}/archive/${pkgver}.tar.gz"
        'syslinux.cfg'
        'mklinuxpba-initramfs'
        'mklinuxpba-diskimg'
        'linuxpba-arch'
        'linuxpba.conf.etc'
        'mkinitcpio.conf.etc'
        'mkinitcpio.conf.lib'
        'linuxpba.hook'
        'linuxpba.install'
        'getpasswd.c')
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('32683065331c7c61b07355b0eb443cabcf3433f4613b68552e43c466d0024f2d'
            '40d785c16a28a5a8a43050d1731174482ee24459be215d2e4e27ffba3b2e28b2'
            'ee3171da9eeab5170815713280588db99118a5fba73eea6373f8555451ab1e5c'
            '1c0851da29633b4d015a08bf473377b8a9be324704a338ee16224c2861209a76'
            '1e83802f64eeb5a9abd9f284c59fdb92f14443f017db8ab15368de7b4faf9e00'
            'e5c3acb3027c7a3c5082d5cf0f5193f190788e64045d2c79a9fd1598b56f151f'
            '44ba634f4b35b1267d62b8b1505fa08a3d5bafa33ebb651ad7b09b53941c40eb'
            'daaa13d48b9e72e3185594a0f7c54d2966711ef03b5444141d41be9994710c82'
            'd9a7b66d8365e7f4eb0233b30c0ab70b5e978f6554960bf12994a1f0910c1447'
            'f31a0ba891dd705ef68174afeb651bdc3426a63202d058d98510907de43248f7'
            'e94d011c98bd336f37d6d4923e5d63a22ebd10d8f2c6486b6bcd6617524d6484')
CPPFLAGS="$CPPFLAGS -O2"

prepare() {
    bsdtar -C "${srcdir}" -mxf "${pkgname}-${pkgver}.tar.gz"
    cd "${srcdir}/$pkgname-$pkgver"
}

build() {
    _release="Release_$CARCH"
    cd "${srcdir}/"
    gcc -Wall -o getpasswd getpasswd.c

    cd "${srcdir}/${pkgname}-${pkgver}/"
    autoreconf -i
    ./configure --enable-silent-rules
    echo -e "#!/bin/sh\necho '#define GIT_VERSION \"${pkgver}\"'" > Customizations/linux/CLI/GitVersion.sh
    chmod 755 Customizations/linux/CLI/GitVersion.sh
    make
}

package() {
    _release="Release_$CARCH"
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "sedutil-cli" "${pkgdir}/usr/bin/sedutil-cli"
    install -Dm644 "linux/PSIDRevert_LINUX.txt" "${pkgdir}/usr/share/doc/${pkgname}/PSIDRevert.txt"
    [[ "$CARCH" == "i686" ]] && _release="Release"
    install -Dm755 "linuxpba" "${pkgdir}/usr/bin/linuxpba"
    install -Dm755 "${srcdir}/mklinuxpba-initramfs" "${pkgdir}/usr/bin/mklinuxpba-initramfs"
    install -Dm755 "${srcdir}/mklinuxpba-diskimg" "${pkgdir}/usr/bin/mklinuxpba-diskimg"
    install -Dm755 "${srcdir}/linuxpba-arch" "${pkgdir}/usr/bin/linuxpba-arch"
    install -Dm755 "${srcdir}/getpasswd" "${pkgdir}/usr/bin/getpasswd"

    install -Dm644 "${srcdir}/linuxpba.hook" "${pkgdir}/usr/lib/initcpio/hooks/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.install" "${pkgdir}/usr/lib/initcpio/install/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.conf.etc" "${pkgdir}/etc/linuxpba/linuxpba.conf"
    install -Dm644 "${srcdir}/mkinitcpio.conf.etc" "${pkgdir}/etc/linuxpba/mkinitcpio.conf"
    install -Dm644 "${srcdir}/mkinitcpio.conf.lib" "${pkgdir}/usr/lib/linuxpba/mkinitcpio.conf"
    install -Dm644 "${srcdir}/syslinux.cfg" "${pkgdir}/usr/lib/linuxpba/syslinux.cfg"
}
