# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>

_srcname=vlc
pkgname=vlc-decklink
pkgver=2.2.6
pkgrel=1
pkgdesc='Multi-platform MPEG, VCD/DVD, and DivX player (with decklink support)'
arch=('i686' 'x86_64')
url='http://www.videolan.org/vlc/'
license=('LGPL2.1' 'GPL2')
depends=('a52dec' 'libdvbpsi' 'libxpm' 'libdca' 'qt4' 'libproxy'
         'sdl_image' 'libdvdnav' 'libtiger' 'lua' 'libmatroska'
         'zvbi' 'taglib' 'libmpcdec' 'ffmpeg2.8' 'faad2' 'libupnp'
         'libshout' 'libmad' 'libmpeg2' 'xcb-util-keysyms' 'libtar'
         'libxinerama')
makedepends=('live-media' 'libnotify' 'libbluray' 'flac' 'kdelibs'
             'libdc1394' 'libavc1394' 'lirc' 'libcaca' 'gtk2'
             'librsvg' 'portaudio' 'libgme' 'xosd' 'projectm'
             'twolame' 'aalib' 'libmtp' 'libdvdcss' 'smbclient'
             'libgoom2' 'vcdimager' 'opus' 'libssh2' 'mesa' 'qt4'
			 'blackmagic-decklink-sdk')
optdepends=('avahi: for service discovery using bonjour protocol'
            'libnotify: for notification plugin'
            'ncurses: for ncurses interface support'
            'libdvdcss: for decoding encrypted DVDs'
            'lirc: for lirc plugin'
            'libavc1394: for devices using the 1394ta AV/C'
            'libdc1394: for IEEE 1394 plugin'
            'kdelibs: KDE Solid hardware integration'
            'libva-vdpau-driver: vdpau back-end for nvidia'
            'libva-intel-driver: back-end for intel cards'
            'libbluray: for Blu-Ray support'
            'flac: for Free Lossless Audio Codec plugin'
            'portaudio: for portaudio support'
            'twolame: for TwoLAME mpeg2 encoder plugin'
            'projectm: for ProjectM visualisation plugin'
            'libcaca: for colored ASCII art video output'
            'libgme: for libgme plugin'
            'librsvg: for SVG plugin'
            'gnome-vfs: for GNOME Virtual File System support'
            'libgoom2: for libgoom plugin'
            'vcdimager: navigate VCD with libvcdinfo'
            'aalib: for ASCII art plugin'
            'libmtp: for MTP devices support'
            'smbclient: for SMB access plugin'
            'libcdio: for audio CD playback support'
            'ttf-freefont: for subtitle font '
            'ttf-dejavu: for subtitle font'
            'opus: for opus support'
            'libssh2: for sftp support'
            'lua-socket: for http interface'
            'qt4: for the GUI')
provides=('vlc')
conflicts=('vlc-plugin' 'vlc' 'vlc-git')
replaces=('vlc-plugin')
options=('!emptydirs')
source=("http://download.videolan.org/${_srcname}/${pkgver}/${_srcname}-${pkgver}.tar.xz"
        'lua53_compat.patch'
        'update-vlc-plugin-cache.hook')
sha256sums=('c403d3accd9a400eb2181c958f3e7bc5524fe5738425f4253d42883b425a42a8'
            'd1cb88a1037120ea83ef75b2a13039a16825516b776d71597d0e2eae5df2d8fa'
            '4105af8697ac641867a76ddef5f91c69999bf6f980a5681bc36155bbce021f02')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype.c
    sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
    
    patch -Np1 -i "${srcdir}/lua53_compat.patch"
}

build() {
    cd "${_srcname}-${pkgver}"
    
    export PKG_CONFIG_PATH='/usr/lib/ffmpeg2.8/pkgconfig'
    export CFLAGS+=' -I/usr/include/samba-4.0'
    export CPPFLAGS+=' -I/usr/include/samba-4.0'
    export CXXFLAGS+=' -std=c++11'
    export LUAC='/usr/bin/luac'
    export LUA_LIBS="$(pkg-config --libs lua)"
    export RCC='/usr/bin/rcc-qt4'
    
    ./configure \
        --prefix='/usr' \
        --sysconfdir='/etc' \
        --disable-rpath \
        --enable-faad \
        --enable-nls \
        --enable-lirc \
        --enable-ncurses \
        --enable-realrtsp \
        --enable-aa \
        --enable-vcdx \
        --enable-upnp \
        --enable-opus \
        --enable-sftp \
        --enable-decklink
    
    make
}

package() {
    cd "${_srcname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
    
    for _res in 16 32 48 128
    do
        install -D -m644 "${srcdir}/vlc-${pkgver}/share/icons/${_res}x${_res}/vlc.png" \
                         "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/vlc.png"
    done
    
    install -D -m644 "${srcdir}/update-vlc-plugin-cache.hook" -t "${pkgdir}/usr/share/libalpm/hooks"
}
