# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libmfx-git
_srcname=mfx_dispatch
pkgver=1.25.r0.gb93a3ac
pkgrel=1
pkgdesc='Intel Media SDK dispatcher library (git version)'
arch=('i686' 'x86_64')
url='https://github.com/lu-zero/mfx_dispatch/'
license=('BSD')
depends=('libva')
makedepends=('git')
provides=('libmfx')
conflicts=('libmfx')
source=('git+https://github.com/lu-zero/mfx_dispatch.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    autoreconf -i
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    ./configure \
        --prefix='/usr' \
        --enable-shared='yes' \
        --with-libva_drm='yes' \
        --with-libva_x11='yes' \
        --with-pic
        
    make
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
    
    # fix version in pkg-config file
    sed -i "/Version:/s/[0-9]\.[0-9]\{2\}/${pkgver}/" "${pkgdir}/usr/lib/pkgconfig/libmfx.pc"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
