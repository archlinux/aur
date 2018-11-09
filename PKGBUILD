# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=ffnvcodec-headers-git
_srcname=nv-codec-headers
pkgver=8.2.15.5.r0.g450c616
pkgrel=1
pkgdesc='FFmpeg version of headers required to interface with Nvidias codec APIs (git version)'
arch=('any')
url='https://git.videolan.org/?p=ffmpeg/nv-codec-headers.git'
license=('MIT')
makedepends=('git')
provides=('ffnvcodec-headers')
conflicts=('ffnvcodec-headers')
source=('git+https://git.videolan.org/git/ffmpeg/nv-codec-headers.git')
sha256sums=('SKIP')

prepare() {
    cd "$_srcname"
    
    # license
    sed -n '4,25p' include/ffnvcodec/nvEncodeAPI.h > LICENSE  # create file
    sed -i '1,22s/^.\{,3\}//' LICENSE # erase C comments
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^[nv]//'
}

build() {
    cd "$_srcname"
    
    make PREFIX='/usr'
}

package() {
    cd "$_srcname"
    
    make PREFIX='/usr' DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
