# $Id$
# Maintainer: Sébastien "Seblu" Luttringer
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=virtualbox-svn
pkgname=('virtualbox-svn'
         'virtualbox-host-dkms-svn'
         'virtualbox-sdk-svn'
         'virtualbox-guest-utils-svn'
         'virtualbox-guest-utils-nox-svn'
         'virtualbox-ext-vnc-svn')
pkgver=98339
_tarver=${pkgver}
pkgrel=2
arch=('x86_64')
url='http://virtualbox.org'
license=('GPL' 'custom:CDDL')
makedepends=('subversion'
             'alsa-lib'
             'cdrkit'
             'curl'
             'dev86'
             'device-mapper'
             'git'
             'glu'
             'gsoap'
             'glslang'
             'iasl'
             'jdk8-openjdk'
             'libidl2'
             'libpulse'
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
             'opus'
             'python'
             'qt5-base'
             'qt5-x11extras'
             'qt5-tools'
             'sdl'
             'sdl_ttf'
             'vde2'
             'xalan-c'
             'xorgproto'
             'xorg-server-devel'
             'yasm')
source=("VirtualBox::svn+http://www.virtualbox.org/svn/vbox/trunk"
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
        '005-gsoap-build.patch'
        '008-no-vboxvideo.patch'
        '009-properly-handle-i3wm.patch'
        '012-vbglR3GuestCtrlDetectPeekGetCancelSupport.patch'
        '013-support-building-from-dkms.patch'
        '018-upate-xclient-script.patch'
        '019-fix-liblzf-linkage.patch')

pkgver() {
  cd "VirtualBox"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

prepare() {
    cd "VirtualBox"

    # apply patch from the source array (should be a pacman feature)
    local filename
    for filename in "${source[@]}"; do
        if [[ "$filename" =~ \.patch$ ]]; then
            echo "Applying patch ${filename##*/}"
            patch -p1 -N -i "$srcdir/${filename##*/}"
        fi
    done
    
    echo 'Applying local config'
    cp "$srcdir/LocalConfig.kmk" .
    
    echo 'Use our CFLAGS'
    echo "VBOX_GCC_OPT=$CXXFLAGS" >> LocalConfig.kmk
}

build() {
    cd "VirtualBox"

    echo 'Build virtualbox'
    ./configure \
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

package_virtualbox-svn() {
    pkgdesc='Powerful x86 virtualization for enterprise as well as home use'
    depends=('curl' 'gcc-libs' 'glibc' 'liblzf' 'libpng' 'libtpms' 'libvpx' 'libx11' 'libxcursor'
             'libxext' 'libxinerama' 'libxml2' 'libxmu' 'libxt' 'openssl' 'procps-ng' 'python'
             'qt5-base' 'qt5-tools' 'qt5-x11extras' 'sdl' 'shared-mime-info' 'zlib'
             'VIRTUALBOX-HOST-MODULES-SVN')
    optdepends=('vde2: Virtual Distributed Ethernet support'
                'virtualbox-guest-iso: Guest Additions CD image'
                'virtualbox-ext-vnc: VNC server support'
                'virtualbox-sdk: Developer kit')
    backup=('etc/vbox/vbox.cfg')
    provides=('virtualbox')
    replaces=('virtualbox-ose')
    conflicts=('virtualbox-ose' 'virtualbox')

    source "VirtualBox/env.sh"
    cd "VirtualBox/out/linux.$BUILD_PLATFORM_ARCH/release/bin"

    # libraries (and non-PATH executables)
    install -d -m0755 "${pkgdir}/usr/lib/virtualbox"
    install -m0755 *.so -t "${pkgdir}/usr/lib/virtualbox"
    install -m0644 *.r0 VBoxEFI*.fd -t "${pkgdir}/usr/lib/virtualbox"
    ## setuid root binaries
    install -m4755 VirtualBoxVM VBoxHeadless VBoxNetAdpCtl VBoxNetDHCP VBoxNetNAT -t "${pkgdir}/usr/lib/virtualbox"
    ## other binaries
    install -m0755 VirtualBox VBoxManage VBoxSVC VBoxExtPackHelperApp VBoxXPCOMIPCD VBoxTestOGL VBoxBalloonCtrl vboximg-mount vboxwebsrv webtest -t "${pkgdir}/usr/lib/virtualbox"

    # binaries (in /usr/bin)
    install -d -m0755 "${pkgdir}/usr/bin"
    install -m0755 VBox.sh "${pkgdir}/usr/bin/VBox"
    for i in VirtualBox VirtualBoxVM VBoxManage VBoxHeadless VBoxBugReport VBoxBalloonCtrl VBoxAutostart vboxwebsrv; do
        ln -sf VBox "${pkgdir}/usr/bin/${i}"
        ln -sf VBox "${pkgdir}/usr/bin/${i,,}"
    done
    for i in vboximg-mount; do
        ln -s ../lib/virtualbox/"${i}" "${pkgdir}/usr/bin/${i}"
    done

    # components
    install -dm0755 "$pkgdir/usr/lib/virtualbox/components"
    install -m0755 components/* -t "$pkgdir/usr/lib/virtualbox/components"

    # extensions packs
    ## as virtualbox install itself stuff in this directory, move it to /var and
    ## trick it with a symlink
    ## FIXME: trick is disabled for now
    #install -dm0755 "$pkgdir/var/lib/virtualbox/extensions"
    #install -dm0755 "$pkgdir/usr/share/virtualbox/extensions"
    #ln -s ../../../var/lib/virtualbox/extensions "$pkgdir/usr/lib/virtualbox/ExtensionPacks"
    install -dm0755 "$pkgdir/usr/lib/virtualbox/ExtensionPacks"

    # languages
    install -dm0755 "$pkgdir/usr/share/virtualbox/nls"
    install -m0755 nls/*.qm -t "$pkgdir/usr/share/virtualbox/nls"

    # useless scripts
    install -m0755 VBoxCreateUSBNode.sh VBoxSysInfo.sh -t "$pkgdir/usr/share/virtualbox"

    # icons
    install -Dm0644 VBox.png "$pkgdir/usr/share/pixmaps/VBox.png"

    pushd icons >/dev/null
    for i in *; do
        install -d "$pkgdir/usr/share/icons/hicolor/$i/mimetypes"
        cp $i/* "$pkgdir/usr/share/icons/hicolor/$i/mimetypes"
    done
    popd >/dev/null

    #desktop
    install -Dm0644 virtualbox.desktop "$pkgdir/usr/share/applications/virtualbox.desktop"
    install -Dm0644 virtualbox.xml "$pkgdir/usr/share/mime/packages/virtualbox.xml"

    #install configuration
    install -dm0755 "$pkgdir/etc/vbox"
    echo 'INSTALL_DIR=/usr/lib/virtualbox' > "$pkgdir/etc/vbox/vbox.cfg"

    # back to srcdir
    cd "$srcdir"

    #licence
    install -Dm0644 VirtualBox/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m0644 VirtualBox/COPYING.CDDL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.CDDL"
    
    # install systemd stuff
    install -Dm0644 60-vboxdrv.rules "$pkgdir/usr/lib/udev/rules.d/60-vboxdrv.rules"
    install -Dm0644 vboxweb.service "$pkgdir/usr/lib/systemd/system/vboxweb.service"
    install -Dm0644 virtualbox.sysusers "$pkgdir/usr/lib/sysusers.d/virtualbox.conf"

    # install module reloading shortcut (with a symlink with default helper)
    install -Dm0755 vboxreload "$pkgdir/usr/bin"
    ln -s vboxreload "$pkgdir/usr/bin/rcvboxdrv"
}

package_virtualbox-sdk-svn() {
    pkgdesc='VirtualBox Software Developer Kit (SDK)'
    depends=('python')
    provides=('virtualbox-sdk')
    conflicts=('virtualbox-sdk')

    install -dm0755 "$pkgdir/usr/lib/virtualbox"

    source "VirtualBox/env.sh"
    cd "VirtualBox/out/linux.$BUILD_PLATFORM_ARCH/release/bin"

    install -Dm0755 vboxshell.py "$pkgdir/usr/lib/virtualbox/vboxshell.py"
    # python sdk
    pushd sdk/installer
    VBOX_INSTALL_PATH="/usr/lib/virtualbox" python vboxapisetup.py install --root "$pkgdir"
    popd
    cp -r sdk "$pkgdir/usr/lib/virtualbox"
    rm -r "$pkgdir/usr/lib/virtualbox/sdk/installer"
    # licence
    install -Dm0644 "$srcdir/VirtualBox/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m0644 "${srcdir}/VirtualBox/COPYING.CDDL" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.CDDL"
}

package_virtualbox-host-dkms-svn() {
    pkgdesc='VirtualBox Host kernel modules sources'
    depends=('dkms' 'gcc' 'make')
    replaces=('virtualbox-source'
              'virtualbox-host-source'
              'virtualbox-host-modules-lts')
    conflicts=('virtualbox-source' 'virtualbox-host-source' 'virtualbox-host-dkms')
    provides=('VIRTUALBOX-HOST-MODULES-SVN')
    install=virtualbox-host-dkms.install

    install -dm0755 "$pkgdir/usr/src"
    source "VirtualBox/env.sh"
    cd "VirtualBox/out/linux.$BUILD_PLATFORM_ARCH/release/bin"
    cp -r src "$pkgdir/usr/src/vboxhost-svn_OSE"
    # licence
    install -Dm0644 "$srcdir/VirtualBox/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m0644 "${srcdir}/VirtualBox/COPYING.CDDL" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.CDDL"
    # module loading
    local _p="$pkgdir/usr/lib/modules-load.d/virtualbox-host-dkms.conf"
    install -Dm0644 /dev/null "$_p"
    printf "vboxdrv\nvboxnetadp\nvboxnetflt\n" > "$_p"
    # starting vbox 5.1, dkms.conf file was dropped
    local _p="$pkgdir/usr/src/vboxhost-svn_OSE/dkms.conf"
    install -Dm0644 "$srcdir/virtualbox-host-dkms.conf" "$_p"
    sed -i "s,@VERSION@,svn," "$_p"
}

package_virtualbox-guest-utils-svn() {
    pkgdesc='VirtualBox Guest userspace utilities'
    depends=('glibc' 'pam' 'libx11' 'libxcomposite'
             'libxdamage' 'libxext' 'libxfixes' 'libxmu' 'libxt' 'xorg-xrandr'
             'xf86-video-vmware' 'VIRTUALBOX-GUEST-MODULES-SVN')
    replaces=('virtualbox-archlinux-additions' 'virtualbox-guest-additions' 'virtualbox-guest-dkms-svn')
    provides=('virtualbox-guest-utils')
    conflicts=('virtualbox-archlinux-additions' 'virtualbox-guest-additions' 'virtualbox-guest-utils-nox' 'virtualbox-guest-utils' 'virtualbox-guest-dkms')

    source "VirtualBox/env.sh"
    pushd "VirtualBox/out/linux.$BUILD_PLATFORM_ARCH/release/bin/additions"
    install -d "$pkgdir/usr/bin"
    install -m0755 VBoxClient VBoxControl VBoxDRMClient VBoxService "$pkgdir/usr/bin"
    install -m0755 -D "$srcdir"/VirtualBox/src/VBox/Additions/x11/Installer/98vboxadd-xclient \
        "$pkgdir"/usr/bin/VBoxClient-all
    install -m0644 -D "$srcdir"/VirtualBox/src/VBox/Additions/x11/Installer/vboxclient.desktop \
        "$pkgdir"/etc/xdg/autostart/vboxclient.desktop
    install -m0755 -D pam_vbox.so "$pkgdir/usr/lib/security/pam_vbox.so"
    popd
    # systemd stuff
    install -Dm0644 60-vboxguest.rules "$pkgdir/usr/lib/udev/rules.d/60-vboxguest.rules"
    install -Dm0644 vboxdrmclient.path "$pkgdir/usr/lib/systemd/system/vboxdrmclient.path"
    install -Dm0644 vboxdrmclient.service "$pkgdir/usr/lib/systemd/system/vboxdrmclient.service"
    install -Dm0644 vboxservice.service "$pkgdir/usr/lib/systemd/system/vboxservice.service"
    install -Dm0644 virtualbox-guest-utils.sysusers "$pkgdir/usr/lib/sysusers.d/virtualbox-guest-utils.conf"
    # licence
    install -Dm0644 VirtualBox/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 VirtualBox/COPYING.CDDL "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.CDDL"
}

package_virtualbox-guest-utils-nox-svn() {
    pkgdesc='VirtualBox Guest userspace utilities without X support'
    depends=('glibc' 'pam' 'VIRTUALBOX-GUEST-MODULES-SVN')
    replaces=('virtualbox-guest-dkms-svn')
    provides=('virtualbox-guest-utils-nox')
    conflicts=('virtualbox-guest-utils' 'virtualbox-guest-utils-nox' 'virtualbox-guest-dkms')

    source "VirtualBox/env.sh"
    pushd "VirtualBox/out/linux.$BUILD_PLATFORM_ARCH/release/bin/additions"
    install -d "$pkgdir/usr/bin"
    install -m0755 VBoxControl VBoxService "$pkgdir/usr/bin"
    install -m0755 -D pam_vbox.so "$pkgdir/usr/lib/security/pam_vbox.so"
    popd
    # systemd stuff
    install -Dm0644 60-vboxguest.rules "$pkgdir/usr/lib/udev/rules.d/60-vboxguest.rules"
    install -Dm0644 vboxservice-nox.service "$pkgdir/usr/lib/systemd/system/vboxservice.service"
    install -Dm0644 virtualbox-guest-utils.sysusers "$pkgdir/usr/lib/sysusers.d/virtualbox-guest-utils.conf"
    # licence
    install -Dm0644 "$srcdir/VirtualBox/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "${srcdir}/VirtualBox/COPYING.CDDL" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.CDDL"
}

package_virtualbox-ext-vnc-svn() {
    pkgdesc='VirtualBox VNC extension pack'
    depends=('virtualbox' 'libvncserver')
    optdepends=('tigervnc: vnc client')
    provides=('virtualbox-ext-vnc')
    conflicts=('virtualbox-ext-vnc')
    install=virtualbox-ext-vnc.install

    source "VirtualBox/env.sh"
    cd "VirtualBox/out/linux.$BUILD_PLATFORM_ARCH/release/packages"
    install -Dm0644 VNC-*.vbox-extpack "$pkgdir/usr/share/virtualbox/extensions/VNC-svn.vbox-extpack"
    # licence
    install -Dm0644 "$srcdir/VirtualBox/COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 "${srcdir}/VirtualBox/COPYING.CDDL" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.CDDL"
}
sha256sums=('SKIP'
            '76d98ea062fcad9e5e3fa981d046a6eb12a3e718a296544a68b66f4b65cb56db'
            '2101ebb58233bbfadf3aa74381f22f7e7e508559d2b46387114bc2d8e308554c'
            'da4c49f6ca94e047e196cdbcba2c321199f4760056ea66e0fbc659353e128c9e'
            '9c5238183019f9ebc7d92a8582cad232f471eab9d3278786225abc1a1c7bf66e'
            '033c597e0f5285d2ddb0490868e5b6f945f45c7b1b1152a02a9e6fea438b2c95'
            '3cf42bc6e9e55fd2cb6be7b89c5b98d0f6a2eff6125a9ee7efafaabc35f1de22'
            'c41a801fe344a4471a7b61a4764d1d857c403e4fb96e2ba6bc89c77a35f2be7a'
            '01dbb921bd57a852919cc78be5b73580a564f28ebab2fe8d6c9b8301265cbfce'
            '83d8f24bff25bb925083cf39b3195236c6136105e62417712cc3f25b92e14b47'
            '2beab8de525220fa418c9873f9e0d657ddbad4ff9e4a46d7053e6cd9bc4ce95e'
            'e6e875ef186578b53106d7f6af48e426cdaf1b4e86834f01696b8ef1c685787f'
            '4001b5927348fe669a541e80526d4f9ea91b883805f102f7d571edbb482a9b9d'
            '9ee947c9b5ec5b25f52d3e72340fc3a57ca6e65a604e15b669ac582a3fb0dc1b'
            '96d51a3d828155c1ffb1434be8d7befd127108261cd9c86217888c46f38ce9d9'
            '7d2da8fe10a90f76bbfc80ad1f55df4414f118cd10e10abfb76070326abebd46'
            '053bfeee8863f3ffdf2f0e3f9f0d77dc61dd32764700a97a7635fd8611e20491'
            '92df121e1c8a1a967b4928a4d5c6f7ba8c91e43902ecd6d8f5fecc9df4184413'
            '81900e13d36630488accd8c0bfd2ceb69563fb2c4f0f171caba1cca59d438024'
            '00f68b86d32a1fada900c2da8dad2ab4215106cd58004f049bded99727cda2ff'
            '87dddfd9047480e4c2b73367facf5dd3702148418c2efcd606af17c07da90fe0'
            'dcc4de2fa042c8f897cb743b2265be3b9b954389a6135fee9a9e5d9a178c23d8')
