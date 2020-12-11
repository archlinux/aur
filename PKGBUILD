# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xine-lib-hg
pkgver=1.2.11.r6.09aa41e45228
pkgrel=1
pkgdesc='Multimedia playback engine (mercurial version)'
arch=('x86_64')
url='https://www.xine-project.org'
license=('GPL' 'LGPL')
depends=('ffmpeg' 'libjpeg-turbo' 'libnsl' 'libpng' 'libx11' 'libxcb'
         'libxext' 'libxinerama' 'libxv' 'libxvmc' 'zlib')
optdepends=('libdvdnav: for dvd plugin'
            'libdvdread: for spu and dxr3 plugins'
            'vcdimager: for vcd plugin'
            'glu: for opengl and vaapi plugins'
            'sdl: for sdl plugin'
            'wayland: for egl_wl plugin'
            'aalib: for aalib plugin'
            'a52dec: for a52 plugin'
            'faad2: for faad plugin'
            'flac: for flac plugin'
            'libdca: for dts (dca) plugin'
            'libmad: for mad (mp3) plugin'
            'libmpcdec: for mpc (musepack) plugin'
            'wavpack: for wavpack plugin'
            'gdk-pixbuf2: for gdk_pixbuf plugin'
            'imagemagick: for imagemagick plugin'
            'libcaca: for caca plugin'
            'libmng: for mng plugin'
            'libnfs: for nfs plugin'
            'smbclient: for samba plugin')
makedepends=('mercurial' 'mesa' 'libdvdnav' 'libdvdread' 'vcdimager' 'glu' 'sdl'
             'wayland' 'aalib' 'a52dec' 'faad2' 'flac' 'libdca' 'libmad'
             'libmpcdec' 'wavpack' 'gdk-pixbuf2' 'imagemagick' 'libcaca'
             'libmng' 'libnfs' 'smbclient')
provides=('xine-lib')
conflicts=('xine-lib')
source=('hg+http://hg.code.sf.net/p/xine/xine-lib-1.2')
sha256sums=('SKIP')

pkgver() {
    printf '%s.r%s.%s' "$(hg -R xine-lib-1.2 log -r. --template '{latesttag}')" \
                       "$(hg -R xine-lib-1.2 log -r. --template '{latesttagdistance}')" \
                       "$(hg -R xine-lib-1.2 log -r. --template '{node|short}')"
}

build() {
    cd xine-lib-1.2
    ./autogen.sh \
        --prefix='/usr' \
        --enable-antialiasing \
        --with-external-dvdnav \
        --with-wavpack
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    make -C xine-lib-1.2 DESTDIR="$pkgdir" install
}
