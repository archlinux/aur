# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=mujs
pkgver=1.0.6
pkgrel=1
pkgdesc='An embeddable Javascript interpreter in C'
arch=('x86_64')
url='https://mujs.com/'
license=('ISC')
depends=('readline')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ccxvii/mujs/archive/${pkgver}.tar.gz"
        'mujs-flags.patch')
sha256sums=('a444d8ea22b18eff89acbc7f9e45cc95e5b63b30ae8f4b8000b858cd17006f2d'
            '051c8a8727f4ff2816e9c060fbe969b7d1e8b9e2c07d704e809c24ff4394f0f4')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    # use Arch cflags and add full relro
    patch -Np1 -i "${srcdir}/mujs-flags.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    
    make release
}

package() {
    cd "${pkgname}-${pkgver}"
    
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
    
    make DESTDIR="$pkgdir" prefix='/usr' install-shared
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/mujs/LICENSE"
    install    -m644 docs/*  "${pkgdir}/usr/share/doc/${pkgname}"
}
