# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: AndyRTR <andyrtr@archlinux.org>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>

# Based on Arch Linux commit 1dff94b27b2b8d9e312dd194a50b60852c33bb13

pkgbase=xorg-server-mir
pkgname=(xorg-server-mir xorg-server-xephyr-mir xorg-server-xdmx-mir
         xorg-server-xvfb-mir xorg-server-xnest-mir xorg-server-xwayland-mir
         xorg-server-common-mir xorg-server-devel-mir)
_ubuntu_rel=0ubuntu4
_ubuntu_ver=1.17.1
pkgver=1.17.2
pkgrel=1
arch=(i686 x86_64)
license=(custom)
url="http://xorg.freedesktop.org"
makedepends=(pixman libx11 mesa mesa-libgl xf86driproto xcmiscproto xtrans
             bigreqsproto randrproto inputproto fontsproto videoproto
             presentproto compositeproto recordproto scrnsaverproto
             resourceproto xineramaproto libxkbfile libxfont renderproto
             libpciaccess libxv xf86dgaproto libxmu libxrender libxi dmxproto
             libxaw libdmx libxtst libxres xorg-xkbcomp xorg-util-macros
             xorg-font-util glproto dri2proto libgcrypt libepoxy xcb-util
             xcb-util-image xcb-util-renderutil xcb-util-wm xcb-util-keysyms
             dri3proto libxshmfence libunwind)

makedepends+=(mir)

validpgpkeys=('DD38563A8A8224537D1F90E45B8A2D50A0ECD0D3')
source=(${url}/releases/individual/xserver/xorg-server-${pkgver}.tar.bz2{,.sig}
        https://launchpad.net/ubuntu/+archive/primary/+files/xorg-server_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.diff.gz
        nvidia-drm-outputclass.conf
        xvfb-run
        xvfb-run.1
        0001-dix-Add-unaccelerated-valuators-to-the-ValuatorMask.patch
        0002-dix-hook-up-the-unaccelerated-valuator-masks.patch)
sha512sums=('7e7b7620890cc8db696695758fa22fa879f9d3c33946663611ec0b37f02116e9c6f08779f9eece59907b430d3df93f0c0548939683ea156b3c4cbe02571b7551'
            'SKIP'
            '280ef30b05c8d2bb876d4af04b47359fd7cf937a2d49f513f033797327e8350ef010c040bac3f67bc1b7c9fbe4b1b4322ccf70a5403d3401b0c6324e51ab1e3c'
            '06c649df3b02c6ccf5491fecd06f4c979656aaba2bb366e6197e96bb0eecd8d0a46245e69628d507ddc8c5fc6d5f1cac694f036bc45ba51f82a092ebd6097bf5'
            'ca1cda27016f7c269cbdecc45da36255afeef5c1973cc484544f9dfbf56ed1868365c93a4c7f93e3a23e5322f084ec0cdd137e15b43872aae7f0c03040028ce6'
            'de5e2cb3c6825e6cf1f07ca0d52423e17f34d70ec7935e9dd24be5fb9883bf1e03b50ff584931bd3b41095c510ab2aa44d2573fd5feaebdcb59363b65607ff22'
            'c442f566c861c746e92bde992cc736399c74df71a4a3b0e3abe43e7998ba97f2e6550b1fd1da21d9ba960314974dd95e8f3d6aab0b3fbe4c5a6af1a2a8c92495'
            '51bf1ac1135512e8f2621f4dd211d4b80d3072e9ee6896a0d9c7ae569ca693a664cc1e5adf4f7c95da8d6626816ea17ef3bf0f488c121cb3c3b317884d3f3bfc')

prepare() {
    cd "xorg-server-${pkgver}"

    # Apply Ubuntu's patches
    patch -p1 -i "../xorg-server_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.diff"

    # Disable patches
    sed -i '/03_static-nettle.diff/d' debian/patches/series
    sed -i '/ppc64el-endian-fix.patch/d' debian/patches/series

    # Merged upstream
    sed -i '/fix-int10.patch/d' debian/patches/series

    for i in $(grep -v '#' debian/patches/series); do
        msg "Applying ${i} ..."
        patch -p1 -i "debian/patches/${i}"
    done

    # fix FS#45229, merged upstream
    patch -p1 -i ../0001-dix-Add-unaccelerated-valuators-to-the-ValuatorMask.patch
    patch -p1 -i ../0002-dix-hook-up-the-unaccelerated-valuator-masks.patch
}

build() {
    cd "xorg-server-${pkgver}"

    autoreconf -vfi

    ./configure \
        --prefix=/usr \
        --enable-ipv6 \
        --enable-dri \
        --enable-dmx \
        --enable-xvfb \
        --enable-xmir \
        --enable-xnest \
        --enable-composite \
        --enable-xcsecurity \
        --enable-libunwind \
        --enable-xorg \
        --enable-xephyr \
        --enable-glamor \
        --enable-xwayland \
        --enable-glx-tls \
        --enable-kdrive \
        --enable-kdrive-evdev \
        --enable-kdrive-kbd \
        --enable-kdrive-mouse \
        --enable-config-udev \
        --enable-systemd-logind \
        --enable-suid-wrapper \
        --disable-install-setuid \
        --enable-record \
        --disable-xfbdev \
        --disable-xfake \
        --disable-static \
        --libexecdir=/usr/lib/xorg-server \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-xkb-path=/usr/share/X11/xkb \
        --with-xkb-output=/var/lib/xkb \
        --with-fontrootdir=/usr/share/fonts \
        --with-sha1=libgcrypt

    make

    # Disable subdirs for make install rule to make splitting easier
    sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
        -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
        -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
        -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
        -e 's/^XWAYLAND_SUBDIRS =.*/XWAYLAND_SUBDIRS =/' \
        -i hw/Makefile
}

replace_orig() {
    local pkg="${1}"
    provides+=("${pkg}=${pkgver}")
    conflicts+=(${pkg})
}

install_license() {
    local pkg="${1}"
    install -dm755 "${pkgdir}"/usr/share/licenses/${pkg}/
    if grep -q xorg-server-common-mir <<< "${pkg}"; then
        install -m644 "${srcdir}/xorg-server-${pkgver}/COPYING" \
            "${pkgdir}"/usr/share/licenses/${pkg}/
    else
        ln -s ../xorg-server-common-mir/COPYING \
            "${pkgdir}"/usr/share/licenses/${pkg}/
    fi
}

package_xorg-server-common-mir() {
    pkgdesc="Xorg server common files"
    depends=(xkeyboard-config xorg-xkbcomp xorg-setxkbmap xorg-fonts-misc
             libunwind)

    replace_orig xorg-server-common
    install_license xorg-server-common-mir

    cd "xorg-server-${pkgver}"
  
    make -C xkb DESTDIR="${pkgdir}" install-data

    install -dm755 "${pkgdir}"/usr/share/man/man1/
    install -m644 man/Xserver.1 "${pkgdir}"/usr/share/man/man1/

    install -dm755 "${pkgdir}"/usr/lib/xorg/
    install -m644 dix/protocol.txt "${pkgdir}"/usr/lib/xorg/
}

package_xorg-server-mir() {
    pkgdesc="Xorg X server"
    depends=(libepoxy libxdmcp libxfont libpciaccess libdrm pixman libgcrypt
             libxau xorg-server-common-mir xf86-input-evdev libxshmfence libgl)
    # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we
    # provide major numbers that drivers can depend on
    # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
    provides=('X-ABI-VIDEODRV_VERSION=19' 'X-ABI-XINPUT_VERSION=21.1'
              'X-ABI-EXTENSION_VERSION=9.0' x-server)
    groups=(xorg)
    conflicts=('nvidia-utils<=331.20' glamor-egl xf86-video-modesetting)
    replaces=(glamor-egl xf86-video-modesetting)
    install=xorg-server.install

    replace_orig xorg-server
    install_license xorg-server-mir

    cd "xorg-server-${pkgver}"
    make DESTDIR="${pkgdir}" install

    # distro specific files must be installed in /usr/share/X11/xorg.conf.d
    install -dm755 "${pkgdir}"/etc/X11/xorg.conf.d/
    install -m644 ../nvidia-drm-outputclass.conf \
        "${pkgdir}"/usr/share/X11/xorg.conf.d/

    # Needed for non-mesa drivers, libgl will restore it
    mv "${pkgdir}"/usr/lib/xorg/modules/extensions/libglx.so \
        "${pkgdir}"/usr/lib/xorg/modules/extensions/libglx.xorg

    rm -rf "${pkgdir}"/var/

    rm -f "${pkgdir}"/usr/share/man/man1/Xserver.1
    rm -f "${pkgdir}"/usr/lib/xorg/protocol.txt

    rm -rf "${pkgdir}"/usr/lib/pkgconfig/
    rm -rf "${pkgdir}"/usr/include/
    rm -rf "${pkgdir}"/usr/share/aclocal/
}

package_xorg-server-xephyr-mir() {
    pkgdesc="A nested X server that runs as an X application"
    depends=(libxfont libgl libepoxy libgcrypt libxv pixman
             xorg-server-common-mir xcb-util-image xcb-util-renderutil
             xcb-util-wm xcb-util-keysyms)

    replace_orig xorg-server-xephyr
    install_license xorg-server-xephyr-mir

    cd "xorg-server-${pkgver}/hw/kdrive"
    make DESTDIR="${pkgdir}" install
}

package_xorg-server-xvfb-mir() {
    pkgdesc="Virtual framebuffer X server"
    depends=(libxfont libxdmcp libxau libgcrypt pixman xorg-server-common-mir
             xorg-xauth libgl)

    replace_orig xorg-server-xvfb
    install_license xorg-server-xvfb-mir

    cd "xorg-server-${pkgver}/hw/vfb"
    make DESTDIR="${pkgdir}" install

    install -m755 "${srcdir}"/xvfb-run "${pkgdir}"/usr/bin/
    install -m644 "${srcdir}"/xvfb-run.1 "${pkgdir}"/usr/share/man/man1/
}

package_xorg-server-xnest-mir() {
    pkgdesc="A nested X server that runs as an X application"
    depends=(libxfont libxext libgcrypt pixman xorg-server-common-mir
             libsystemd)

    replace_orig xorg-server-xnest
    install_license xorg-server-xnest-mir

    cd "xorg-server-${pkgver}/hw/xnest"
    make DESTDIR="${pkgdir}" install
}

package_xorg-server-xdmx-mir() {
    pkgdesc="Distributed Multihead X Server and utilities"
    depends=(libxfont libxi libgcrypt libxaw libxrender libdmx libxfixes pixman
             xorg-server-common-mir)

    replace_orig xorg-server-xdmx
    install_license xorg-server-xdmx-mir

    cd "xorg-server-${pkgver}/hw/dmx"
    make DESTDIR="${pkgdir}" install
}

package_xorg-server-xwayland-mir() {
    pkgdesc="run X clients under wayland"
    depends=(libxfont libepoxy libgl pixman xorg-server-common)

    replace_orig xorg-server-xwayland
    install_license xorg-server-xwayland-mir

    cd "xorg-server-${pkgver}/hw/xwayland"
    make DESTDIR="${pkgdir}" install
}

package_xorg-server-devel-mir() {
    pkgdesc="Development files for the X.Org X server"
    depends=(# see pkgdir/usr/lib/pkgconfig/xorg-server.pc
             xproto randrproto renderproto xextproto inputproto kbproto 
             fontsproto pixman videoproto xf86driproto glproto 
             mesa dri2proto dri3proto xineramaproto libpciaccess
             resourceproto scrnsaverproto presentproto
             # not technically required but almost every Xorg pkg needs it to
             # build
             xorg-util-macros)

    replace_orig xorg-server-devel
    install_license xorg-server-devel-mir

    cd "xorg-server-${pkgver}"
    make DESTDIR="${pkgdir}" install

    rm -rf "${pkgdir}"/usr/bin/
    rm -rf "${pkgdir}"/usr/share/man/
    rm -rf "${pkgdir}"/usr/share/doc/
    rm -rf "${pkgdir}"/usr/share/X11/
    rm -rf "${pkgdir}"/usr/lib/xorg/
    rm -rf "${pkgdir}"/usr/lib/xorg-server/
    rm -rf "${pkgdir}"/var/
}
