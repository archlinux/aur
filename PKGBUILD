# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=vmaf-git
pkgver=1.3.7.r3.gad8ac94
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (git version)'
arch=('x86_64')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
depends=('gcc-libs')
makedepends=('git')
provides=('vmaf' 'libvmaf' 'libvmaf-git')
conflicts=('vmaf' 'libvmaf' 'libvmaf-git')
replaces=('libvmaf-git')
source=("$pkgname"::'git+https://github.com/Netflix/vmaf.git')
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    make all
}

package() {
    cd "$pkgname"
    
    make DESTDIR="$pkgdir" INSTALL_PREFIX='/usr' install
    
    # binary executable
    install -D -m755 wrapper/vmafossexec -t "${pkgdir}/usr/bin"
    
    # fix prefixes on pkgconfig file
    sed -i 's|/usr/local|/usr|g' "${pkgdir}/usr/lib/pkgconfig/libvmaf.pc"
}
