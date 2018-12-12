# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=virtualbox-headless
pkgver=5.2.22
_tarver=${pkgver}
pkgrel=1
pkgdesc='Powerful x86 virtualization for enterprise as well as home use. Headless build (no GUI, no Java).'
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL' 'custom')
depends=('curl' 'libxml2' 'libvpx' 'libpng' 'python' 'opus')
makedepends=('iasl' 'libxslt' 'cdrkit' 'libidl2' 'libpulse' 'device-mapper' 'libvncserver' 'gsoap')
makedepends_x86_64=('gcc-multilib')
optdepends=('vde2: Virtual Distributed Ethernet support'
            'virtualbox-guest-iso: Guest Additions CD image'
            'virtualbox-ext-vnc: VNC server support'
            'virtualbox-sdk: Developer kit')
backup=('etc/vbox/vbox.cfg')
provides=("virtualbox=${pkgver}")
replaces=('virtualbox-ose' 'virtualbox')
conflicts=('virtualbox-ose' 'virtualbox')
install=virtualbox.install
source=("http://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${_tarver}.tar.bz2"
        'virtualbox.sysusers'
        '60-vboxdrv.rules'
        '60-vboxguest.rules'
        'LocalConfig.kmk'
        'vboxservice.service'
        'vboxservice-nox.service'
        'vboxweb.service'
        'vboxreload'
        '002-dri-driver-path.patch'
        '005-gsoap-build.patch'
        '008-no-vboxvideo.patch'
        '009-include-path.patch'
        #'010-x11-stub.cpp-NOREF.patch'
        '011-python-3-7.patch'
        )
sha256sums=(
    '5580e875349341a1aabc6d5d2f697d242f277487316faaf1fbe68d9014f788d4'
    '2101ebb58233bbfadf3aa74381f22f7e7e508559d2b46387114bc2d8e308554c'
    '9c5238183019f9ebc7d92a8582cad232f471eab9d3278786225abc1a1c7bf66e'
    '033c597e0f5285d2ddb0490868e5b6f945f45c7b1b1152a02a9e6fea438b2c95'
    'b395e1add983c37cbfa7f7efbfb0699ab181cfa1600aea20d873caf901ed3eb9'
    '94a808f46909a51b2d0cf2c6e0a6c9dea792034943e6413bf9649a036c921b21'
    '01dbb921bd57a852919cc78be5b73580a564f28ebab2fe8d6c9b8301265cbfce'
    'e6e875ef186578b53106d7f6af48e426cdaf1b4e86834f01696b8ef1c685787f'
    '2a9d7748dc58f9d091f791da06b733a696943114f7c0d580fa00a0752eb1d2ac'
    'f67674931c30187f867233e3a4ae662f93c9110fbd0bfce50dd9f391f4533bc0'
    '7d2da8fe10a90f76bbfc80ad1f55df4414f118cd10e10abfb76070326abebd46'
    '8b7f241107863f82a5b0ae336aead0b3366a40103ff72dbebf33f54b512a0cbc'
    '1acc7014bcb3d9ca6da29eed813c3d6e91a688c43f9d93802fd4e3814f67ace4'
    #'1e7f0fcc5a1fdbd6ef1531fd87897eeac8d8ce719bdaa5bc1f3d76263052c40b'
    '9535774f1858c0ad92f0edee99875dcf683e41a4c7c95494c8aeb81591426e5a'
)

prepare() {
    cd "VirtualBox-$pkgver"

    # apply patch from the source array (should be a pacman feature)
    local filename
    for filename in "${source[@]}"; do
        if [[ "$filename" =~ \.patch$ ]]; then
            msg2 "Applying patch ${filename##*/}"
            patch -p1 -N -i "$srcdir/${filename##*/}"
        fi
    done

    msg2 'Applying local config'
    cp "$srcdir/LocalConfig.kmk" .

    msg2 'Use our CFLAGS'
    echo "VBOX_GCC_OPT=$CXXFLAGS" >> LocalConfig.kmk

    msg2 'Use system GL headers'
    echo 'VBOX_USE_SYSTEM_GL_HEADERS=true' >> LocalConfig.kmk

    msg2 'Remove gcc version censorship'
    sed -i 's/^check_gcc$/#check_gcc/' configure
}

build() {
    cd "VirtualBox-$pkgver"

    msg2 'Build virtualbox'
    ./configure \
        --build-headless \
        --disable-docs \
        --enable-webservice \
        --enable-vde \
        --enable-vnc \
        --disable-java \
        --disable-kmods \
        --with-makeself=/usr/bin/echo
    # fake makeself binary to compile without nofatal
    # makeself is used by linux installer. we don't need it.
    source ./env.sh
    kmk

    msg2 'Build VNC extension pack'
    kmk -C src/VBox/ExtPacks/VNC packing
}

package() {
    source "VirtualBox-$pkgver/env.sh"
    cd "VirtualBox-$pkgver/out/linux.$BUILD_PLATFORM_ARCH/release/bin"

    # patch VBox.sh for headless only
    sed -i '44,45s/VirtualBox/VBoxHeadless/' VBox.sh

    # binaries
    install -dm755 "$pkgdir/usr/bin"
    install -m755 VBox.sh "$pkgdir/usr/bin/VBox"
    for i in VBoxHeadless VBoxManage vboxwebsrv VBoxBalloonCtrl; do
        ln -sf VBox "$pkgdir/usr/bin/$i"
        ln -sf VBox "$pkgdir/usr/bin/${i,,}"
    done
    install -m755 VBoxTunctl "$pkgdir/usr/bin"

    # libraries
    install -dm755 "$pkgdir/usr/lib/virtualbox"
    install -m755 *.so "$pkgdir/usr/lib/virtualbox"
    install -m644 *.rc *.r0 VBoxEFI*.fd "$pkgdir/usr/lib/virtualbox"
    ## setuid root binaries
    install -m4755 VBoxHeadless VBoxNetDHCP VBoxNetAdpCtl VBoxNetNAT -t "$pkgdir/usr/lib/virtualbox"
    ## other binaries
    install -m755 VBoxManage VBoxSVC VBoxExtPackHelperApp VBoxXPCOMIPCD VBoxBalloonCtrl vboxwebsrv webtest -t "$pkgdir/usr/lib/virtualbox"

    # components
    install -dm755 "$pkgdir/usr/lib/virtualbox/components"
    install -m755 components/* -t "$pkgdir/usr/lib/virtualbox/components"

    # extensions packs
    ## as virtualbox install itself stuff in this directory, move it to /var and
    ## trick it with a symlink
    ## FIXME: trick is disabled for now
    #install -dm755 "$pkgdir/var/lib/virtualbox/extensions"
    #install -dm755 "$pkgdir/usr/share/virtualbox/extensions"
    #ln -s ../../../var/lib/virtualbox/extensions "$pkgdir/usr/lib/virtualbox/ExtensionPacks"
    install -dm755 "$pkgdir/usr/lib/virtualbox/ExtensionPacks"

    # useless scripts
    install -dm755 "$pkgdir/usr/share/virtualbox"
    install -m755 VBoxCreateUSBNode.sh VBoxSysInfo.sh -t "$pkgdir/usr/share/virtualbox"

    # icons
    install -Dm644 VBox.png "$pkgdir/usr/share/pixmaps/VBox.png"

    pushd icons >/dev/null
    for i in *; do
        install -d "$pkgdir/usr/share/icons/hicolor/$i/mimetypes"
        cp $i/* "$pkgdir/usr/share/icons/hicolor/$i/mimetypes"
    done
    popd >/dev/null

    #desktop
    install -Dm644 virtualbox.xml "$pkgdir/usr/share/mime/packages/virtualbox.xml"

    #install configuration
    install -dm755 "$pkgdir/etc/vbox"
    echo 'INSTALL_DIR=/usr/lib/virtualbox' > "$pkgdir/etc/vbox/vbox.cfg"

    # back to srcdir
    cd "$srcdir"

    #licence
    install -Dm644 VirtualBox-$pkgver/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # install systemd stuff
    install -Dm644 60-vboxdrv.rules "$pkgdir/usr/lib/udev/rules.d/60-vboxdrv.rules"
    install -Dm644 vboxweb.service "$pkgdir/usr/lib/systemd/system/vboxweb.service"
    install -Dm644 virtualbox.sysusers "$pkgdir/usr/lib/sysusers.d/virtualbox.conf"

    # install module reloading shortcut (with a symlink with default helper)
    install -Dm755 vboxreload "$pkgdir/usr/bin"
    ln -s vboxreload "$pkgdir/usr/bin/rcvboxdrv"
}

# vim:set ts=4 sw=4 et:
