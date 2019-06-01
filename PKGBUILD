# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=trio
pkgver=1.16
pkgrel=3
pkgdesc='Portable string functions, focus on the *printf() and *scanf() clones'
arch=('x86_64')
url='https://sourceforge.net/projects/ctrio/'
license=('custom')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/ctrio/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        'trio-use-arch-flags.patch'
        'trio-fix-install.patch')
sha256sums=('84d0e74f5b25f0b6c7d9b264ef41f98908e65a5056d4e75c5ef0e05d6a69fc0a'
            '688b0873fde6d8746a5b879b1dc368985293aac0727679cdaf7e571227e78e7d'
            '727d780675109717b967ba4449861f573b3d43f56af97a59ca5ab08af38a99b4')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    patch -Np1 -i "${srcdir}/trio-use-arch-flags.patch"
    patch -Np1 -i "${srcdir}/trio-fix-install.patch"
}

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure --prefix='/usr'
    
    make
}

check () {
    cd "${pkgname}-${pkgver}"
    
    make test
}

package() {
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 README "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # create missing library symbolic links
    cd "${pkgdir}/usr/lib"
    local _libmajor
    _libmajor="$(printf libtrio.so.*.*.* | sed 's/libtrio\.so\.//;s/\.[0-9]*\.[0-9]*$//')"
    ln -s "libtrio.so.${_libmajor}".*.* "libtrio.so.${_libmajor}"
    ln -s "libtrio.so.${_libmajor}".*.*  libtrio.so
}
