# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=xine-lib-hg
pkgver=1.2.10.r14730.91312aae00d0
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
source=('hg+http://hg.code.sf.net/p/xine/xine-lib-1.2'
        '010-xine-lib-hg-gcc10-fix.patch')
sha256sums=('SKIP'
            'b5a42d16d83058e6e13adc384bf12d546f3f7072ece48b234ef415ec192a4457')

prepare() {
    patch -d xine-lib-1.2 -Np1 -i"${srcdir}/010-xine-lib-hg-gcc10-fix.patch"
}

pkgver() {
    local _number
    local _revision
    local _hash
    local _version
    local _version_major
    local _version_minor
    local _version_sub
    local _version_patch
    _version_major="$(grep '^XINE_VERSION_MAJOR=' xine-lib-1.2/version.sh | sed 's/.*=//')"
    _version_minor="$(grep '^XINE_VERSION_MINOR=' xine-lib-1.2/version.sh | sed 's/.*=//')"
    _version_sub="$(  grep '^XINE_VERSION_SUB='   xine-lib-1.2/version.sh | sed 's/.*=//')"
    _version_patch="$(grep '^XINE_VERSION_PATCH=' xine-lib-1.2/version.sh | sed 's/.*=//')"
    _version="$_version_major"
    for _number in "$_version_minor" "$_version_sub" "$_version_patch"
    do
        [ -n "$_number" ] && _version+=".${_number}"
    done
    _revision="$(hg -R xine-lib-1.2 identify -n)"
    _hash="$(hg -R xine-lib-1.2 identify -i)"
    printf '%s.r%s.%s' "$_version" "${_revision%+}" "${_hash%+}"
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
