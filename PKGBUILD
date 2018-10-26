# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Jesse Jaara	<gmail.com:	jesse.jaara>
# Contributor: Det		<gmail.com:	nimetonmaili>
# Contributor: h31		<yandex.com:	h31mail>
# Contributor: julroy67	<gmail.com:	julroy67>

pkgname=libvpx-git
pkgver=1.7.0.r1254.ga4e70f1808
pkgrel=1
pkgdesc='VP8 and VP9 video codecs (git version)'
arch=('i686' 'x86_64')
url='http://www.webmproject.org/'
license=('BSD')
depends=('gcc-libs')
makedepends=('git' 'yasm')
provides=('libvpx' 'libvpx.so')
conflicts=('libvpx')
source=("$pkgname"::'git+https://chromium.googlesource.com/webm/libvpx') # official repo
#source=("$pkgname"::'git+https://github.com/webmproject/libvpx.git') # mirror
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${pkgname}"
    
    ./configure \
        --prefix='/usr' \
        --enable-runtime-cpu-detect \
        --enable-shared \
        --enable-pic \
        --disable-install-docs \
        --disable-install-srcs \
        --enable-vp8 \
        --enable-postproc \
        --enable-vp9 \
        --enable-vp9-highbitdepth \
        --enable-experimental
        
    make
}

package() {
    cd "${pkgname}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 PATENTS -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
