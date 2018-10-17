# Maintainer : Daniel Bermond < yahoo-com: danielbermond >
# Contributor: John Jenkins <twodopeshaggy@gmail.com>

pkgname=flif-git
pkgver=0.3.r92.gb16d347
pkgrel=1
pkgdesc='Free Lossless Image Format (git version)'
arch=('i686' 'x86_64')
url='https://github.com/FLIF-hub/FLIF/'
license=('LGPL3' 'APACHE')
depends=('gcc-libs' 'libpng' 'sdl2' 'gdk-pixbuf2' 'glib2')
makedepends=('git')
optdepends=(
    # official repositories:
        'imagemagick: for gif2flif tool'
    # AUR:
        'apng-utils: for apng2flif tool'
)
provides=('flif')
conflicts=('flif')
source=("$pkgname"::'git+https://github.com/FLIF-hub/FLIF.git')
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}/src"
    
    # fix Makefile target install-pixbufloader
    sed -i 's|/usr/lib|$(PREFIX)/lib|' Makefile
    sed -i 's|gdk-pixbuf-query-loaders|#&|' Makefile
    sed -i 's|xdg-mime|#&|' Makefile
    
    # remove apt-get references from installed tools
    cd ../tools
    sed -i '/apt-get/d' gif2flif apng2flif
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${pkgname}/src"
    
    local _target
    
    for _target in all decoder viewflif pixbufloader
    do
        printf '%s\n' "  -> Building target '${_target}'..."
        make "$_target"
    done
    
}

package() {
    cd "${pkgname}/src"
    
    local _target
    
    for _target in install{,-dev,-decoder,-viewflif,-pixbufloader}
    do
        printf '%s\n' "  -> Installing target '${_target}'..."
        make PREFIX="${pkgdir}/usr" "$_target"
    done
    
    # mime type for pixbuf loader
    install -D -m644 flif-mime.xml -t "${pkgdir}/usr/share/mime/packages"
}
