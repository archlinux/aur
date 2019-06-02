# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=xine-lib-hg
pkgver=1.2.9.r14420.88e48552a162
pkgrel=1
pkgdesc='A multimedia playback engine (mercurial version)'
arch=('x86_64')
url='https://www.xine-project.org/'
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
source=('hg+http://hg.code.sf.net/p/xine/xine-lib-1.2')
sha256sums=('SKIP')

pkgver() {
    cd xine-lib-1.2
    
    local _version_major
    local _version_minor
    local _version_sub
    local _version_patch
    local _version
    local _number
    _version_major="$(grep '^XINE_VERSION_MAJOR=' version.sh | sed 's/.*=//')"
    _version_minor="$(grep '^XINE_VERSION_MINOR=' version.sh | sed 's/.*=//')"
    _version_sub="$(  grep '^XINE_VERSION_SUB='   version.sh | sed 's/.*=//')"
    _version_patch="$(grep '^XINE_VERSION_PATCH=' version.sh | sed 's/.*=//')"
    _version="$_version_major"
    
    for _number in "$_version_minor" "$_version_sub" "$_version_patch"
    do
        [ -n "$_number" ] && _version+=".${_number}"
    done
    
    printf '%s.r%s.%s' "$_version" "$(hg identify -n)" "$(hg identify -i)"
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
    cd xine-lib-1.2
    make DESTDIR="$pkgdir" install
}
