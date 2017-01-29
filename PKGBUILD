# Maintainer: Karol 'Kenji Takahashi' Woźniak <kenji.sx>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgname=virtualbox-headless
pkgver=5.1.14
pkgrel=1
pkgdesc='Powerful x86 virtualization for enterprise as well as home use. Headless build (no GUI, no Java).'
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL' 'custom')
depends=('libxml2' 'libvpx' 'libpng' 'python2')
makedepends=('iasl' 'libxslt' 'cdrkit' 'libidl2' 'libpulse' 'device-mapper' 'libvncserver' 'gsoap')
makedepends_x86_64=('gcc-multilib')
optdepends=('vde2: Virtual Distributed Ethernet support'
            'net-tools: Host-only or bridged networking support'
            'virtualbox-guest-iso: Guest Additions CD image'
            'virtualbox-ext-vnc: VNC server support'
            'virtualbox-sdk: Developer kit')
backup=('etc/vbox/vbox.cfg')
replaces=('virtualbox-ose' 'virtualbox')
conflicts=('virtualbox-ose' 'virtualbox')
install=virtualbox.install
source=("http://download.virtualbox.org/virtualbox/$pkgver/VirtualBox-$pkgver.tar.bz2"
        'virtualbox.sysusers'
        '60-vboxdrv.rules'
        '60-vboxguest.rules'
        'LocalConfig.kmk'
        'vboxservice.service'
        'vboxservice-nox.service'
        'vboxweb.service'
        'vboxreload'
        '002-dri-driver-path.patch'
        '003-ogl-include-path.patch'
        '005-gsoap-build.patch'
        '006-rdesktop-vrdp-keymap-path.patch'
        '007-python2-path.patch'
        '008-no-vboxvideo.patch'
        )
md5sums=('21eaec9f21477d555559a63761779880'
         '984412a63aa9c07ddc3cfd970381d5df'
         '6e2722bfd7013c1b0174382626ac1b8d'
         'ed1341881437455d9735875ddf455fbe'
         '7ef5b89e9b00ac5632521c4950b74a53'
         '8ba9179c4a3516904417d773816dd992'
         'fcf6bcef98b16849d5c9f048592739c0'
         'bc9efed88e0469cd7fc460d5a5cd7b4b'
         '0bab94ff2f4835fd907f89eb23ebbe21'
         '9be7e2703afeee1fca9368bd8750e710'
         '9e49bbaa2192b141c27ee43cef8cbab7'
         'e8a0b47e61ddcffdeed71086585a1ef3'
         'd82a6f19be739341ed7f1cf4ee8070ca'
         '188ea65918309f737ce28216c2b07c3b'
         '8e369367001e2ed3c1e3d23ac474fa33')

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

    msg2 'Build rdesktop-vrdp'
    kmk -C src/VBox/RDP/client-1.8.3

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
    install -m755 rdesktop-vrdp "$pkgdir/usr/bin"

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

    # rdesktop keymaps
    install -dm755 "$pkgdir/usr/share/virtualbox/rdesktop-vrdp-keymaps"
    install -m644 rdesktop-vrdp-keymaps/* "$pkgdir/usr/share/virtualbox/rdesktop-vrdp-keymaps"

    # useless scripts
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
