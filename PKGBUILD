# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Campbell Barton <ideasman42@gmail.com>
# Contributor: Noel Kuntze "Thermi"
# Contributor: Pablo Lezaeta <prflr88 arro'a gmail puntocom>

pkgname=pax
pkgver=3.4
pkgrel=12
pkgdesc='Portable Archive Interchange - the POSIX standard archive tool for cpio and tar formats'
arch=('x86_64')
url='https://man.openbsd.org/pax.1'
license=('BSD')
depends=('glibc')
source=("https://downloads.yoctoproject.org/mirror/sources/${pkgname}-${pkgver}.tar.bz2"
        '001-pax-3.4_fix_for_compile_with_gcc-4.6.0.patch'
        '002-pax-3.4_fix_for_x32.patch'
        '003-pax-3.0_unuse_warn.patch'
        '004-pax-3.0_PATHMAX.patch'
        '005-pax-3.4_abs100.patch'
        '006-pax-3.4_rdtruncate.patch'
        '007-pax-3.4_fix_for_compile_with_gcc-6.1.patch'
        '008-Fix-implicit-fallthrough-in-src-options.c.patch'
        '009-pax-3.4-gcc8-fix.patch')
sha256sums=('ac3c06048e02828077cf7757d3d142241429238893b91d529af29a2e8cc5623b'
            '45d08ba749e473525bd4882bfdaf2f16b2ab5ef97413d678e042874e2ce4b70b'
            '7b244542dcbc53f1e78ce1c57af401846ff1ec2269195f321ed2b2d9bf297f2d'
            'b67343324bef2a65b1be0f7bf2167c3a8d208ac2f1bdab6349562f1d73fda3b9'
            '50987ce7bef75dc670c4ba81d482bd586fc0bf0944234a5fb5e9c9451168939b'
            'c515b529601aa2a431b964afe291802e55fdd426b3a6cfb87ae74fb3fb8b70f9'
            '30a6c084600c47af73a988abf8d4514e1766cee36f1efedb5a76772bf3b2c793'
            '82a7d29126193e902a2f0d5ba6f790502df3591fd28b09af7c49eec0295cab1e'
            'd9d015ceb80c9907bd5d91cf1f2f3f4257f0152bcacc85057a41b0fe5e3ac5ba'
            '38b430fa93ff339166ffe6543648e20a22cf1b4e376ab8574705298bc32198d6')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    patch -Np1 -i "${srcdir}/001-pax-3.4_fix_for_compile_with_gcc-4.6.0.patch"
    patch -Np1 -i "${srcdir}/002-pax-3.4_fix_for_x32.patch"
    patch -Np0 -i "${srcdir}/003-pax-3.0_unuse_warn.patch"
    patch -Np1 -i "${srcdir}/004-pax-3.0_PATHMAX.patch"
    patch -Np1 -i "${srcdir}/005-pax-3.4_abs100.patch"
    patch -Np1 -i "${srcdir}/006-pax-3.4_rdtruncate.patch"
    patch -p1  -i "${srcdir}/007-pax-3.4_fix_for_compile_with_gcc-6.1.patch"
    patch -Np2 -i "${srcdir}/008-Fix-implicit-fallthrough-in-src-options.c.patch"
    patch -Np1 -i "${srcdir}/009-pax-3.4-gcc8-fix.patch"
    
    autoreconf -fis
}

build() {
    cd "${pkgname}-${pkgver}"
    
    ./configure --prefix='/usr'
        
    make
}

package(){
    cd "${pkgname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
