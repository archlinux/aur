# This script is incomplete and in development.

# Maintainer: Lekensteyn <lekensteyn@gmail.com>
# Contributor: Samsagax <samsagax@gmail.com>

pkgname=bumblebee-git
_gitname=bumblebee
pkgver=3.2.1.r16.524ded1
pkgrel=1
pkgdesc="NVIDIA Optimus support for Linux through VirtualGL or primus"
arch=('i686' 'x86_64')
depends=('glib2' 'mesa-libgl')
makedepends=('git' 'help2man')
optdepends=('bbswitch: switch on/off discrete card'
            'xf86-video-nouveau: Nouveau driver'
            'nouveau-dri: 3D acceleration features fo Nouveau'
            'nvidia: NVIDIA kernel driver'
            'nvidia-340xx: NVIDIA kernel driver for older devices'
            'nvidia-304xx: NVIDIA kernel driver for even older devices'
            'virtualgl: oldest back-end for optirun'
            'primus: faster back-end for optirun')
if [ "$CARCH" = "x86_64" ]; then
     optdepends[${#optdepends[@]}]='lib32-virtualgl: run 32bit applications with optirun'
     optdepends[${#optdepends[@]}]='lib32-primus: faster back-end for optirun'
fi
conflicts=('bumblebee' 'nvidia-libgl' 'nvidia-340xx-libgl' 'nvidia-304xx-libgl')
provides=('bumblebee' 'nvidia-libgl' 'nvidia-340xx-libgl' 'nvidia-304xx-libgl')
url="http://www.bumblebee-project.org"
license=("GPL3")
install='bumblebee.install'
backup=('etc/bumblebee/bumblebee.conf'
        'etc/bumblebee/xorg.conf.nouveau'
        'etc/bumblebee/xorg.conf.nvidia')
source=("$_gitname::git://github.com/Bumblebee-Project/Bumblebee.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"

    git describe --always | sed 's|^v||;s|\([^-]*-\)g|r\1|;s|-|.|g'
}

build() {
    cd "$_gitname"

    autoreconf -fi
    ./configure \
        CONF_DRIVER_MODULE_NVIDIA=nvidia \
        CONF_LDPATH_NVIDIA=/usr/lib/nvidia:/usr/lib32/nvidia \
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

    make install DESTDIR="$pkgdir"

    # Stop nvidia from loading on boot
    mkdir -p "${pkgdir}/usr/lib/modprobe.d/"
    echo "blacklist nvidia" > "${pkgdir}/usr/lib/modprobe.d/bumblebee.conf"

    # Install systemd unit
    install -D -m644 "scripts/systemd/bumblebeed.service" "${pkgdir}/usr/lib/systemd/system/bumblebeed.service"
    sed -i "s/sbin/bin/" "${pkgdir}/usr/lib/systemd/system/bumblebeed.service"

    # Make bash_completion work
    mv -v "${pkgdir}/etc/bash_completion.d/bumblebee" "${pkgdir}/etc/bash_completion.d/optirun"
    #Install udev rule to prevent GH-#144
    install -D -m644 "conf/99-bumblebee-nvidia-dev.rules" "${pkgdir}/usr/lib/udev/rules.d/99-bumblebee-nvidia-dev.rules"
}
