# Maintainer: Evgeniy Dombek <edombek@yandex.ru>

pkgname=gildas
pkgver=jul23a
pkgrel=1
pkgdesc='GILDAS'
arch=('x86_64')
url="https://www.iram.fr/IRAMFR/GILDAS/"
license=('custom')
makedepends=(python python-setuptools python-numpy which)
depends=(gcc-fortran cfitsio gtk2)
optdepends=(python-numpy)

source=("https://www.iram.fr/~gildas/dist/gildas-src-$pkgver.tar.xz")
sha512sums=('e377f0d4c0c4d20a8e70424823d2a34a083fe4bc507bd2fbdfdabc587f35ed5520be8640d749966a6b4a2d337405b5d3ca7f2342a1857efb805440fbce394d8a')
options=('!strip')

build() {
    cd ${srcdir}/gildas-src-$pkgver
    source admin/gildas-env.sh
    make
}

package() {
    cd ${srcdir}/gildas-src-$pkgver
    source admin/gildas-env.sh
    make install
    
    target="opt/gildas-exe-$pkgver"
    cd "$pkgdir"
    mkdir opt
    cp -r ${srcdir}/gildas-exe-$pkgver $target
    
    #Ading /etc/profile
    mkdir -p etc/profile.d
    echo export GAG_ROOT_DIR=/opt/gildas-exe-$pkgver >> etc/profile.d/gildas.sh
    echo export GAG_EXEC_SYSTEM=$GAG_EXEC_SYSTEM >> etc/profile.d/gildas.sh
    echo source /opt/gildas-exe-$pkgver/etc/bash_profile >> etc/profile.d/gildas.sh
    chmod +x etc/profile.d/gildas.sh
}
