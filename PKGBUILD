# Maintainer: xyzzy

# Adapted from the official virtualbox package by
# Contributor: Christian Hesse <eworm@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Ionut Biru <ibiru@archlinux.org>


pkgname=virtualbox-kvm
pkgdesc='Powerful x86 virtualization for enterprise as well as home use (KVM backend)'
pkgver=20240208
_pkgver=dev-${pkgver}
pkgrel=1
arch=('x86_64')
url='https://github.com/cyberus-technology/virtualbox-kvm'
license=('GPL' 'custom:CDDL')
makedepends=('alsa-lib'
             'cdrkit'
             'curl'
             'device-mapper'
             'git'
             'glu'
             'gsoap'
             'glslang'
             'iasl'
             'jdk8-openjdk'
             'libidl2'
             'liblzf'
             'libpulse'
             'libtpms'
             'libvncserver'
             'libvpx'
             'libxcomposite'
             'libxcursor'
             'libxinerama'
             'libxml2'
             'libxmu'
             'libxrandr'
             'libxslt'
             'libxtst'
             'linux-headers'
             'mesa'
             'python'
             'qt5-base'
             'qt5-tools'
             'qt5-x11extras'
             'sdl'
             'sdl_ttf'
             'vde2'
             'xorgproto'
             'xorg-server-devel'
             'yasm')

source=("${url}/archive/refs/tags/${_pkgver}.tar.gz"
        'virtualbox-host-dkms.conf'
        'virtualbox.sysusers'
        'virtualbox-guest-utils.sysusers'
        '60-vboxdrv.rules'
        '60-vboxguest.rules'
        'LocalConfig.kmk'
        'vboxservice.service'
        'vboxservice-nox.service'
        'vboxdrmclient.path'
        'vboxdrmclient.service'
        'vboxweb.service'
        'vboxreload'
        '001-disable-update.patch'
        '004-drop-Wno-format.patch'
        '008-no-vboxvideo.patch'
        '009-properly-handle-i3wm.patch'
        '012-vbglR3GuestCtrlDetectPeekGetCancelSupport.patch'
        '013-support-building-from-dkms.patch'
        '018-upate-xclient-script.patch'
        '019-libxml-2-12.patch')
sha256sums=('47eeca358ad07781d5816c9f51121c8359812190f60812a68cc6d84c89ee3598'
            '76d98ea062fcad9e5e3fa981d046a6eb12a3e718a296544a68b66f4b65cb56db'
            '2101ebb58233bbfadf3aa74381f22f7e7e508559d2b46387114bc2d8e308554c'
            'da4c49f6ca94e047e196cdbcba2c321199f4760056ea66e0fbc659353e128c9e'
            'f876e9f55243eded423fda4fc2ffe3b174dca90380a6315f7c9b3cd1c9d07206'
            '033c597e0f5285d2ddb0490868e5b6f945f45c7b1b1152a02a9e6fea438b2c95'
            '0ae014c6bb778a1b079121064f17179c27b8dde9479a37d34ce071fb3b084e25'
            'c41a801fe344a4471a7b61a4764d1d857c403e4fb96e2ba6bc89c77a35f2be7a'
            '01dbb921bd57a852919cc78be5b73580a564f28ebab2fe8d6c9b8301265cbfce'
            '83d8f24bff25bb925083cf39b3195236c6136105e62417712cc3f25b92e14b47'
            '2beab8de525220fa418c9873f9e0d657ddbad4ff9e4a46d7053e6cd9bc4ce95e'
            'e6e875ef186578b53106d7f6af48e426cdaf1b4e86834f01696b8ef1c685787f'
            '4001b5927348fe669a541e80526d4f9ea91b883805f102f7d571edbb482a9b9d'
            '9ee947c9b5ec5b25f52d3e72340fc3a57ca6e65a604e15b669ac582a3fb0dc1b'
            '7675f87d31ad3137f057dc3ee3d4a2c5b2cfe8cd362adba130ddbf7a65069516'
            '053bfeee8863f3ffdf2f0e3f9f0d77dc61dd32764700a97a7635fd8611e20491'
            'ad0d7af1e4c94f9efbc60827abea9e605398549b3673c40f697d042bb6bfe88a'
            '81900e13d36630488accd8c0bfd2ceb69563fb2c4f0f171caba1cca59d438024'
            '00f68b86d32a1fada900c2da8dad2ab4215106cd58004f049bded99727cda2ff'
            '87dddfd9047480e4c2b73367facf5dd3702148418c2efcd606af17c07da90fe0'
            '25271f26d897bb76ae2a39b6fdf10409acc929e2d424e34d1bd42014a42a0d31')

prepare() {
    cd "virtualbox-kvm-${_pkgver}"

    # apply patch from the source array (should be a pacman feature)
    local filename
    for filename in "${source[@]}"; do
        if [[ "${filename}" =~ \.patch$ ]]; then
            echo "Applying patch ${filename##*/}"
            patch -p1 -N -i "${srcdir}/${filename##*/}"
        fi
    done

    sed -i '/cstring/a #include <cstdint>' src/libs/dxvk-native-1.9.2a/src/util/util_bit.h

    echo 'Applying local config'
    cp "${srcdir}/LocalConfig.kmk" .

    echo 'Use our CFLAGS'
    echo "VBOX_GCC_OPT=$CXXFLAGS" >> LocalConfig.kmk
}

build() {
    cd "virtualbox-kvm-${_pkgver}"

    echo 'Build virtualbox-kvm'
    ./configure \
        --with-kvm \
        --disable-docs \
        --disable-kmods \
        --disable-vmmraw \
        --enable-vde \
        --enable-vnc \
        --enable-webservice \
        --with-makeself=/usr/bin/echo
    # fake makeself binary to compile without nofatal
    # makeself is used by linux installer. we don't need it.
    source ./env.sh
    kmk

    echo 'Build VNC extension pack'
    kmk -C src/VBox/ExtPacks/VNC packing
}

package() {
    pkgdesc='Powerful x86 virtualization for enterprise as well as home use (KVM backend)'
    depends=('curl' 'gcc-libs' 'glibc' 'liblzf' 'libpng' 'libtpms' 'libvpx' 'libx11' 'libxcursor'
             'libxext' 'libxinerama' 'libxml2' 'libxmu' 'libxt' 'openssl' 'procps-ng' 'python'
             'qt5-base' 'qt5-tools' 'qt5-x11extras' 'sdl' 'shared-mime-info' 'zlib'
             'VIRTUALBOX-HOST-MODULES')
    optdepends=('vde2: Virtual Distributed Ethernet support'
                'virtualbox-guest-iso: Guest Additions CD image'
                'virtualbox-ext-vnc: VNC server support'
                'virtualbox-sdk: Developer kit')
    backup=('etc/vbox/vbox.cfg')
    replaces=('virtualbox-ose')
    conflicts=('virtualbox' 'virtualbox-ose')

    source "virtualbox-kvm-${_pkgver}/env.sh"
    cd "virtualbox-kvm-${_pkgver}/out/linux.${BUILD_PLATFORM_ARCH}/release/bin"

    # libraries (and non-PATH executables)
    install -d -m0755 "${pkgdir}/usr/lib/virtualbox"
    install -m0755 *.so -t "${pkgdir}/usr/lib/virtualbox"
    install -m0644 *.r0 VBoxEFI*.fd -t "${pkgdir}/usr/lib/virtualbox"
    ## setuid root binaries
    install -m4755 VirtualBoxVM VBoxSDL VBoxHeadless VBoxNetAdpCtl VBoxNetDHCP VBoxNetNAT -t "${pkgdir}/usr/lib/virtualbox"
    ## other binaries
    install -m0755 VirtualBox VBoxManage VBoxSVC VBoxExtPackHelperApp VBoxXPCOMIPCD VBoxTestOGL VBoxBalloonCtrl vbox-img vboximg-mount vboxwebsrv webtest -t "${pkgdir}/usr/lib/virtualbox"

    # binaries (in /usr/bin)
    install -d -m0755 "${pkgdir}/usr/bin"
    install -m0755 VBox.sh "${pkgdir}/usr/bin/VBox"
    for i in VirtualBox VirtualBoxVM VBoxManage VBoxSDL VBoxHeadless VBoxBugReport VBoxBalloonCtrl VBoxAutostart vboxwebsrv; do
        ln -sf VBox "${pkgdir}/usr/bin/${i}"
        ln -sf VBox "${pkgdir}/usr/bin/${i,,}"
    done
    for i in vbox-img vboximg-mount; do
        ln -s ../lib/virtualbox/"${i}" "${pkgdir}/usr/bin/${i}"
    done

    # components
    install -d -m0755 "${pkgdir}/usr/lib/virtualbox/components"
    install -m0755 components/* -t "${pkgdir}/usr/lib/virtualbox/components"

    # extensions packs
    ## as virtualbox install itself stuff in this directory, move it to /var and
    ## trick it with a symlink
    ## FIXME: trick is disabled for now
    #install -d -m0755 "${pkgdir}/var/lib/virtualbox/extensions"
    #install -d -m0755 "${pkgdir}/usr/share/virtualbox/extensions"
    #ln -s ../../../var/lib/virtualbox/extensions "${pkgdir}/usr/lib/virtualbox/ExtensionPacks"
    install -d -m0755 "${pkgdir}/usr/lib/virtualbox/ExtensionPacks"

    # languages
    install -d -m0755 "${pkgdir}/usr/share/virtualbox/nls"
    install -m0755 nls/*.qm -t "${pkgdir}/usr/share/virtualbox/nls"

    # useless scripts
    install -m0755 VBoxCreateUSBNode.sh VBoxSysInfo.sh -t "${pkgdir}/usr/share/virtualbox"

    # icons
    install -D -m0644 VBox.png "${pkgdir}/usr/share/pixmaps/VBox.png"

    pushd icons >/dev/null
    for i in *; do
        install -d "${pkgdir}/usr/share/icons/hicolor/${i}/mimetypes"
        cp "${i}/"* "${pkgdir}/usr/share/icons/hicolor/${i}/mimetypes"
    done
    popd >/dev/null

    #desktop
    install -D -m0644 virtualbox.desktop "${pkgdir}/usr/share/applications/virtualbox.desktop"
    install -D -m0644 virtualbox.xml "${pkgdir}/usr/share/mime/packages/virtualbox.xml"

    #install configuration
    install -d -m0755 "${pkgdir}/etc/vbox"
    echo 'INSTALL_DIR=/usr/lib/virtualbox' > "${pkgdir}/etc/vbox/vbox.cfg"

    # back to srcdir
    cd "${srcdir}"

    #licence
    install -D -m0644 virtualbox-kvm-${_pkgver}/COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m0644 virtualbox-kvm-${_pkgver}/COPYING.CDDL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.CDDL"

    # install systemd stuff
    install -D -m0644 60-vboxdrv.rules "${pkgdir}/usr/lib/udev/rules.d/60-vboxdrv.rules"
    install -D -m0644 vboxweb.service "${pkgdir}/usr/lib/systemd/system/vboxweb.service"
    install -D -m0644 virtualbox.sysusers "${pkgdir}/usr/lib/sysusers.d/virtualbox.conf"

    # install module reloading shortcut (with a symlink with default helper)
    install -D -m0755 vboxreload "${pkgdir}/usr/bin"
    ln -s vboxreload "${pkgdir}/usr/bin/rcvboxdrv"
}
