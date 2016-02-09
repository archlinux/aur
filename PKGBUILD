# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sébastien Luttringer
# Contributor: Oscar Molin <oscarmolin@gmail.com>

pkgbase=virtualbox-modules-r500v
pkgname=('virtualbox-host-modules-r500v' 'virtualbox-guest-modules-r500v')
pkgver=5.0.14
pkgrel=1
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
depends=('linux-r500v>=4.5rc1' 'linux-r500v<4.6rc1' 'xz')
makedepends=('dkms' 'linux-r500v-headers>=4.5rc1' 'linux-r500v-headers<4.6rc1' "virtualbox-host-dkms>=$pkgver" "virtualbox-guest-dkms>=$pkgver")
_extramodules=extramodules-4.5-r500v

build() {
    _kernver=$(cat /usr/lib/modules/$_extramodules/version)
    # dkms need modification to be run as user

    rm -rf dkms/vboxhost/$pkgver/source
    cp -r /var/lib/dkms .

    echo "dkms_tree='$srcdir/dkms'" > dkms.conf
  
    # build host modules
    msg2 'Host modules'
    dkms --dkmsframework dkms.conf build "vboxhost/$pkgver" -k "$_kernver"
    # build guest modules
    msg2 'Guest modules'
    dkms --dkmsframework dkms.conf build "vboxguest/$pkgver" -k "$_kernver"
}

package_virtualbox-host-modules-r500v(){
    _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
    pkgdesc='Host kernel modules for VirtualBox running under linux-r500v'
    depends=('linux-r500v>=4.5rc1' 'linux-r500v<4.6rc1')
    provides=("virtualbox-host-modules")
    conflicts=('virtualbox-modules-r500v')
    install=virtualbox-host-modules-r500v.install

    cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
    install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
    install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
    find "$pkgdir" -name '*.ko' -exec xz -9 {} +
    mkdir -p "$pkgdir/etc/modules-load.d"
    echo "vboxdrv" > "$pkgdir/etc/modules-load.d/virtualbox-host-modules-r500v.conf"
    echo "vboxnetadp" >> "$pkgdir/etc/modules-load.d/virtualbox-host-modules-r500v.conf"
    echo "vboxnetflt" >> "$pkgdir/etc/modules-load.d/virtualbox-host-modules-r500v.conf"
    echo "vboxpci" >> "$pkgdir/etc/modules-load.d/virtualbox-host-modules-r500v.conf"
}

package_virtualbox-guest-modules-r500v(){
    _kernver="$(cat /usr/lib/modules/$_extramodules/version)"
    pkgdesc='Guest kernel modules for VirtualBox running under linux-r500v'
    license=('GPL')
    depends=('linux-r500v>=4.5rc1' 'linux-r500v<4.6rc1')
    provides=("virtualbox-guest-modules")
    conflicts=('virtualbox-modules-r500v')
    install=virtualbox-guest-modules-r500v.install

    cd "dkms/vboxguest/$pkgver/$_kernver/$CARCH/module"
    install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
    install -m644 * "$pkgdir/usr/lib/modules/$_extramodules/"
    find "$pkgdir" -name '*.ko' -exec xz -9 {} +
    mkdir -p "$pkgdir/etc/modules-load.d"
    echo "vboxguest" > "$pkgdir/etc/modules-load.d/virtualbox-guest-modules-r500v.conf"
    echo "vboxsf" >> "$pkgdir/etc/modules-load.d/virtualbox-guest-modules-r500v.conf"
    echo "vboxvideo" >> "$pkgdir/etc/modules-load.d/virtualbox-guest-modules-r500v.conf"
}

