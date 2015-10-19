# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=sedutil
pkgver=1.00
pkgrel=3
pkgdesc="TCG OPAL 2.00 SED Management Program"
arch=('i686' 'x86_64')
url="https://github.com/Drive-Trust-Alliance/sedutil"
license=('GPL3')
install=sedutil.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Drive-Trust-Alliance/${pkgname}/archive/${pkgver}.tar.gz"
        'extlinux.conf'
        'mklinuxpba'
        'linuxpba.conf'
        'linuxpba.hook'
        'linuxpba.install')
sha256sums=('7d9c8b3eb408de8218e8bd29f118a8956157ca6e80fb0d8782074302cc13d2e8'
            '6d528877c70b24367833653f5a7cc004a6b5aad8729b661d8c3fda3f1ee7d4ff'
            '084df0ee2bfc14a4450942b4de4b7f697346fbae9b1c1b7193ce1db66e4dd7e7'
            'be7790a69eb4e82a84c690e41cdff04f08a0a61a30a6c28b88df916e3fb59950'
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
    install -Dm755 "${srcdir}/mklinuxpba" "${pkgdir}/usr/bin/mklinuxpba"

    install -Dm644 "${srcdir}/linuxpba.hook" "${pkgdir}/usr/lib/initcpio/hooks/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.install" "${pkgdir}/usr/lib/initcpio/install/linuxpba"
    install -Dm644 "${srcdir}/linuxpba.conf" "${pkgdir}/etc/linuxpba/linuxpba.conf"
    install -Dm644 "${srcdir}/extlinux.conf" "${pkgdir}/etc/linuxpba/extlinux.conf"
}
