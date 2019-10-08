# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=vmaf-git
pkgver=1.3.15.r36.g7e04231
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (git version)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('Apache')
depends=('gcc-libs')
makedepends=('git')
provides=('vmaf' 'libvmaf-git')
conflicts=('vmaf' 'libvmaf-git')
replaces=('libvmaf-git')
source=('git+https://github.com/Netflix/vmaf.git')
sha256sums=('SKIP')

pkgver() {
    cd vmaf
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    make -C vmaf
}

package() {
    make -C vmaf DESTDIR="$pkgdir" INSTALL_PREFIX='/usr' install
    
    # binary executables
    install -D -m755 vmaf/src/libvmaf/vmaf{,ossexec} -t "${pkgdir}/usr/bin"
    local _file
    for _file in moment ms_ssim psnr ssim
    do
        install -D -m755 vmaf/src/libvmaf/${_file} "${pkgdir}/usr/bin/vmaf-${_file}"
    done
    
    # fix prefixes on pkgconfig file
    sed -i 's|/usr/local|/usr|g' "${pkgdir}/usr/lib/pkgconfig/libvmaf.pc"
}
