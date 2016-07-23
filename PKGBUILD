# Original PKGBUILD: Timothy Redaelli <timothy.redaelli@gmail.com>
# Maintainer: ehs2013

pkgbase=linux-ruisu
pkgver='3.16.0_43'
pkgrel=1
arch=('x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=(tar)
options=(!strip)
_ubuntu_ver='3.16.0-43-generic'
_ubuntu_buildver='3.16.0-43.58~14.04.1'
_mirror='https://mirrors.kernel.org/ubuntu'
source=("${_mirror}/pool/main/l/linux-lts-utopic/linux-image-${_ubuntu_ver}_${_ubuntu_buildver}_amd64.deb"
        "${_mirror}/pool/main/l/linux-lts-utopic/linux-image-extra-${_ubuntu_ver}_${_ubuntu_buildver}_amd64.deb"
        "${_mirror}/pool/main/l/linux-lts-utopic/linux-headers-${_ubuntu_ver}_${_ubuntu_buildver}_amd64.deb"
        "linux-ruisu.preset"
        "blacklist.conf")
md5sums=('952bd1c63fa0f220eaad7554adc842aa'
         '9bab067d05b2805c7f61ff374640a710'
         '9dca52bf9b319626e75587b45afbacab'
         'SKIP'
         'SKIP')
noextract=("${source[@]##*/}")
pkgname=("${pkgbase}" "${pkgbase}-headers")
package_linux-ruisu() {
    pkgdesc="Linux kernel image for installing ServerSpeeder (a.k.a ruisu, using ZetaTCP technology)"
    depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
    optdepends=('crda: to set the correct wireless channels of your country')
    install=linux-ruisu.install
    
    for deb in linux-image-*.deb; do
        ar p "$deb" data.tar.bz2 | tar -xjf - -C "$pkgdir/" --transform='s,^./lib,usr/lib,'
    done

    # remove useless files for Arch Linux
    rm -f $pkgdir/boot/{System.map,abi,config}-${_ubuntu_ver}
    
    # change kernel file name
    mv "$pkgdir/boot/vmlinuz-${_ubuntu_ver}" "$pkgdir/boot/vmlinuz-$pkgname"
    # remove useless Debian changelog and license
    rm -rf "$pkgdir/usr/share"

    # set correct depmod command for install
    cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
    true && install=${install}.pkg
    sed \
        -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${pkgname#linux}/" \
        -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_ubuntu_ver}/" \
        -i "${startdir}/${install}"

    # install mkinitcpio preset file for kernel
    install -D -m644 "${srcdir}/${pkgname}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"

    # install modprobe.d blacklist file (taked from kmod_22-1.1ubuntu1.debian.tar.xz)
    install -D -m644 "${srcdir}/blacklist.conf" "${pkgdir}/etc/modprobe.d/ubuntu-blacklist.conf"    
}

package_linux-ruisu-headers() {
    pkgdesc="Header files and scripts for building modules for ${pkgbase/linux/Linux} kernel"
    provides=(linux-ubuntu-headers)

    for x in linux-headers-*.deb; do
        ar p "$x" data.tar.xz | tar -xJf - -C "$pkgdir/" --transform='s,^./lib,usr/lib,'
    done

    # remove useless Debian changelog and license
    rm -rf "$pkgdir/usr/share"
}
