# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=ffnvcodec-headers-git
pkgver=8.0.14.1.r0.g12712ab
pkgrel=1
pkgdesc='FFmpeg version of headers required to interface with Nvidias codec APIs (git version)'
arch=('any')
url='https://git.videolan.org/?p=ffmpeg/nv-codec-headers.git'
license=('MIT')
makedepends=('git')
provides=('ffnvcodec-headers')
conflicts=('ffnvcodec-headers')
source=("$pkgname"::'git+https://git.videolan.org/git/ffmpeg/nv-codec-headers.git')
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    sed -i 's|/usr/local|/usr|g' Makefile
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^[nv]//'
}

build() {
    cd "$pkgname"
    make  # using PREFIX='/usr' seems not to work
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
    
    # license
    sed -n '4,25p' include/ffnvcodec/nvEncodeAPI.h > LICENSE  # create file
    sed -i '1,22s/^.\{,3\}//' LICENSE # erase C comments
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
