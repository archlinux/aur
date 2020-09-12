# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xine-lib-hg
pkgver=1.2.10.r211.79af5718c10d
pkgrel=1
pkgdesc='A multimedia playback engine (mercurial version)'
arch=('x86_64')
url='http://xine.sourceforge.net/'
license=('GPL' 'LGPL')
depends=('libxvmc' 'ffmpeg' 'libxinerama' 'libnsl' 'libssh2')
makedepends=('mercurial'
             'wavpack' 'faad2' 'libmng' 'imagemagick' 'mesa' 'libmodplug'
             'vcdimager' 'jack' 'aalib' 'libdca' 'a52dec' 'libmad' 'libdvdnav'
             'libmpcdec' 'libcaca' 'libbluray' 'libvdpau' 'glu' 'gdk-pixbuf2')
optdepends=('imagemagick: for using the imagemagick plugin'
            'jack: for using the jack plugin'
            'vcdimager: for using the vcd plugin'
            'glu: for using the opengl plugin'
            'wavpack: for using the wavpack plugin'
            'faad2: for using the faad plugin'
            'libmng: for using the mng plugin'
            'aalib: for using the aalib plugin'
            'libmodplug: for using the modplug plugin'
            'libdca: for using the dca plugin'
            'a52dec: for using the a52 plugin'
            'libmad: for using the mp3 plugin'
            'libdvdnav: for using the dvd plugin'
            'libmpcdec: for using the musepack plugin'
            'libcaca: for using the caca plugin'
            'libbluray: for using the bluray plugin'
            'libvdpau: for using the VDPAU plugin'
            'smbclient: for using the samba plugin'
            'gdk-pixbuf2: for using the gdk-pixbuf plugin')
provides=('xine-lib')
conflicts=('xine-lib')
source=('hg+http://hg.code.sf.net/p/xine/xine-lib-1.2'
        '010-xine-lib-hg-gcc10-fix.patch')
sha256sums=('SKIP'
            '357daf6042d592556b4b23d400d622be4e165dc7d3bce8ce2ab638abf357f2e6')

prepare() {
    patch -d xine-lib-1.2 -Np1 -i"${srcdir}/010-xine-lib-hg-gcc10-fix.patch"
}

pkgver() {
    printf '%s.r%s.%s' "$(hg -R xine-lib-1.2 log -r. --template '{latesttag}')" \
                       "$(hg -R xine-lib-1.2 log -r. --template '{latesttagdistance}')" \
                       "$(hg -R xine-lib-1.2 log -r. --template '{node|short}')"
}

build() {
    cd xine-lib-1.2
    ./autogen.sh \
        --prefix='/usr' \
        --with-wavpack \
        --enable-vdpau \
        --with-external-dvdnav \
        --disable-optimizations 
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
    make
}

package() {
    make -C xine-lib-1.2 DESTDIR="$pkgdir" install
}
