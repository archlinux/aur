# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=ffnvcodec-headers
pkgver=8.0.14.1
pkgrel=1
pkgdesc='FFmpeg version of headers required to interface with Nvidias codec APIs'
arch=('any')
url='https://git.videolan.org/?p=ffmpeg/nv-codec-headers.git'
license=('MIT')
makedepends=('git')
conflicts=('ffnvcodec-headers-git')
source=("$pkgname"::"git+https://git.videolan.org/git/ffmpeg/nv-codec-headers.git#tag=n${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
    sed -i 's|/usr/local|/usr|g' Makefile
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
