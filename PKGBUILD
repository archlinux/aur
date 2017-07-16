# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=vmaf
pkgname=libvmaf
pkgver=1.2.0
pkgrel=1
pkgdesc='Library for perceptual video quality assessment based on multi-method fusion'
arch=('i686' 'x86_64')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
conflicts=('libvmaf-git')
source=("${_srcname}-${pkgver}.tar.gz"::"https://github.com/Netflix/${_srcname}/archive/v${pkgver}.tar.gz"
        'vmaf-library-interface.patch'
        'vmaf-library-interface-libvmaf.cpp'
        'vmaf-library-interface-libvmaf.h'
        'vmaf-fix-models-installation.patch')
sha256sums=('1de058d1562d013f8773ae973517a8e04d06514f3c324b370cb3ed469e837a9b'
            '38a6ae9acb158e1bccc159f0f53fbe0fb78b4f24232ee37a629913a1455c49ca'
            'e959be9f59ece60d6fa1fa1ab7500923b06be6cf15c19d0746ff990ea2ff7a73'
            'f62ec92d0cee45a77e9d6cb1e0c08ceac7cdb09dcaf5139f7ee8fd4d19d6f44c'
            '1837ccfea3523f359c6db01fc14772110b5b46260d982fffde90846c1dadf63a')

prepare() {
    cd "${_srcname}-${pkgver}"
    
    # make library to build (library feature was added after vmaf v1.2.0 release)
    patch -Np1 -i "${srcdir}/vmaf-library-interface.patch"
    cp    -av     "${srcdir}/vmaf-library-interface-libvmaf.cpp" wrapper/src/libvmaf.cpp
    cp    -av     "${srcdir}/vmaf-library-interface-libvmaf.h"   wrapper/src/libvmaf.h
    
    # fix models installation directory
    # https://github.com/Netflix/vmaf/issues/93
    patch -Np1 -i "${srcdir}/vmaf-fix-models-installation.patch"
}

build() {
    cd "${_srcname}-${pkgver}"
    msg2 "Building target 'all'..." && make all
    msg2 "Building target 'lib'..." && make lib
}

package() {
    cd "${_srcname}-${pkgver}"
    make DESTDIR="$pkgdir" PREFIX='/usr' install
}
