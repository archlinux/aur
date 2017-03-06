# Original PKGBUILD: Timothy Redaelli <timothy.redaelli@gmail.com>
# Maintainer: ehs2013

pkgbase=linux-ruisu
pkgver='4.4.0_47'
pkgrel=1
arch=('x86_64')
url="http://www.kernel.org/"
license=('GPL2')
makedepends=(tar)
options=(!strip)
_ubuntu_ver='4.4.0-47-generic'
_ubuntu_buildver='4.4.0-47.68'
_mirror='https://mirrors.kernel.org/ubuntu'
source=("${_mirror}/pool/main/l/linux/linux-image-${_ubuntu_ver}_${_ubuntu_buildver}_amd64.deb"
        "${_mirror}/pool/main/l/linux/linux-image-extra-${_ubuntu_ver}_${_ubuntu_buildver}_amd64.deb"
        "${_mirror}/pool/main/l/linux/linux-headers-${_ubuntu_ver}_${_ubuntu_buildver}_amd64.deb"
        "linux-ruisu.preset"
        "blacklist.conf")
md5sums=('15ccfe224802de420913f7fb3f8075b4'
         '7da88764623fb9eef0e47a17abc378dc'
         '26c713f3d9666475ff49ada48984a8c6'
         '81318c55b71ee7be180066742688febd'
         'bc6754fa320733c6d239a4bb0148ffd7')
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
