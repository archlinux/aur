# This script is incomplete and in development.

# Maintainer: Lekensteyn <lekensteyn@gmail.com>
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bumblebee-git
_gitname=bumblebee
pkgver=3.2.1.r57.61c6161
pkgrel=1
pkgdesc="NVIDIA Optimus support for Linux through VirtualGL or primus"
arch=('i686' 'x86_64')
depends=('glib2' 'mesa-libgl')
makedepends=('git' 'help2man')
optdepends=('bbswitch: switch on/off discrete card'
            'xf86-video-nouveau: Nouveau driver'
            'nvidia: NVIDIA kernel driver'
            'nvidia-340xx: NVIDIA kernel driver for older devices'
            'nvidia-304xx: NVIDIA kernel driver for even older devices'
            'virtualgl: oldest back-end for optirun'
            'primus: faster back-end for optirun')
if [ "$CARCH" = "x86_64" ]; then
     optdepends[${#optdepends[@]}]='lib32-virtualgl: run 32bit applications with optirun'
     optdepends[${#optdepends[@]}]='lib32-primus: faster back-end for optirun'
fi
conflicts=('bumblebee')
provides=('bumblebee') 
url="http://www.bumblebee-project.org"
license=("GPL3")
install='bumblebee.install'
backup=('etc/bumblebee/bumblebee.conf'
        'etc/bumblebee/xorg.conf.nouveau'
        'etc/bumblebee/xorg.conf.nvidia')
source=("$_gitname::git://github.com/Bumblebee-Project/Bumblebee.git#branch=develop"
        "0001-libglvnd.patch"
         "bumblebee.conf"
         "0002-bumblebee-f23xorgnvidiafix.patch")
sha256sums=('SKIP'
            'b260d64a53617807afe21560db0592d114d7775b182e13fb59349f0157c8dba4'
            '1c3d4f5d40245a23a5f1cb1f2f6bd4274ff3c5b3749f76a09255191328ae3193'
            '0a4885344a2e6ea08d87f163e133e5256a9c0badf6fe05f91dfcdc9e716135c7')

pkgver() {
    cd "$_gitname"

    git describe --always | sed 's|^v||;s|\([^-]*-\)g|r\1|;s|-|.|g'
}

prepare(){
      cd "$_gitname" 
      for p in ${srcdir}/*.patch; do
         patch -Np1 -i "$p"
      done

}
build() {
    cd "$_gitname"
    
    autoreconf -fi
    ./configure \
        CONF_DRIVER_MODULE_NVIDIA=nvidia \
        CONF_LDPATH_NVIDIA=/usr/lib/nvidia:/usr/lib32/nvidia:/usr/lib:/usr/lib32 \
        CONF_MODPATH_NVIDIA=/usr/lib/nvidia/xorg/,/usr/lib/xorg/modules \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --with-udev-rules=/usr/lib/udev/rules.d/ \
        --sysconfdir=/etc \
        --without-pidfile
    make
}

package() {
    cd "$_gitname"

    make install DESTDIR="$pkgdir"  \
      completiondir=/usr/share/bash-completion/completions


    #Blacklist nvidia and nouveau modules
    # Reference: https://github.com/Bumblebee-Project/Bumblebee/issues/719
    install -Dm644 "${srcdir}/bumblebee.conf" "${pkgdir}/usr/lib/modprobe.d/bumblebee.conf"

    # Install systemd unit
    install -Dm644 "scripts/systemd/bumblebeed.service" "${pkgdir}/usr/lib/systemd/system/bumblebeed.service"
    sed -i "s/sbin/bin/" "${pkgdir}/usr/lib/systemd/system/bumblebeed.service"
  }
