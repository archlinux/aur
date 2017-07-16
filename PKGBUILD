# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=vmaf-git
pkgname=libvmaf-git
pkgver=1.2.0.r95.gd423b5b
pkgrel=1
pkgdesc='Library for perceptual video quality assessment based on multi-method fusion (git version)'
arch=('i686' 'x86_64')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
makedepends=('git')
provides=('libvmaf')
conflicts=('libvmaf')
source=("${_srcname}"::"git+https://github.com/Netflix/${_srcname%-git}.git"
        'vmaf-fix-models-installation.patch')
sha256sums=('SKIP'
            'e33d063265ec6f5c18373332b7ade2b69d1a2f2cf2e36a293b4f10c0d82e0b96')

prepare() {
    cd "${_srcname}"
    
    # fix models installation directory
    # https://github.com/Netflix/vmaf/issues/93
    patch -Np1 -i "${srcdir}/vmaf-fix-models-installation.patch"
}

pkgver() {
    cd "${_srcname}"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${_srcname}"
    msg2 "Building target 'all'..." && make all
    msg2 "Building target 'lib'..." && make lib
}

package() {
    cd "${_srcname}"
    make DESTDIR="$pkgdir" PREFIX='/usr' install
}
