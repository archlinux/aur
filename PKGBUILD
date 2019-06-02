# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Christopher Rosell <chrippa@gmail.com>
# Contributor: Army
# Contributor: tomegun

pkgname=rtmpdump-git
pkgver=2.4.r98.gc5f04a5
pkgrel=1
pkgdesc='A tool to download rtmp and rtmpe streams (git version)'
url='http://rtmpdump.mplayerhq.hu/'
arch=('x86_64')
license=('GPL2' 'LGPL2.1')
depends=('glibc' 'gnutls' 'zlib' 'nettle' 'gmp')
makedepends=('git')
provides=('rtmpdump' 'librtmp.so')
conflicts=('rtmpdump')
source=('git+https://git.ffmpeg.org/rtmpdump')
md5sums=('SKIP')

pkgver() {
    cd rtmpdump
    
    local _version
    local _ver_commit='c28f1bab7822de97353849e7787b59e50bbb1428'
    local _revision
    local _shorthash
    
    _version="$(grep '^VERSION=' Makefile | sed 's/.*=v//')"
    _revision="$(git rev-list --count "$_ver_commit"..HEAD)"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd rtmpdump
    sed -e 's/^CRYPTO=OPENSSL/#CRYPTO=OPENSSL/' -e 's/#CRYPTO=GNUTLS/CRYPTO=GNUTLS/' -i Makefile -i librtmp/Makefile
    make OPT="$CFLAGS" XLDFLAGS="$LDFLAGS"
}

package() {
    cd rtmpdump
    mkdir -p "${pkgdir}/usr/lib"
    make prefix='/usr' \
         sbindir='/usr/bin' \
         mandir='/usr/share/man' \
         DESTDIR="$pkgdir" \
         install
}
