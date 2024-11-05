# Maintainer: Evgeniy Dombek <edombek@yandex.ru>

pkgname=gildas
pkgver=2024.10.a
pkgver_=oct24a
pkgrel=1
pkgdesc='GILDAS'
arch=('x86_64')
url="https://www.iram.fr/IRAMFR/GILDAS/"
license=('custom')
makedepends=(python python-setuptools python-numpy which)
depends=(gcc-fortran cfitsio gtk2)
optdepends=(python-numpy)

source=("https://www.iram.fr/~gildas/dist/gildas-src-$pkgver_.tar.xz")
sha512sums=('dee2c82aa6e5fe014cfa31d4e2438125feda24847e3ccb0daaa70263dbab9d4bd3e924947debc3a285a65fa223b044a2f05362508a8ae88889ea29c80c4a0c3d')
options=('!strip')

build() {
    cd ${srcdir}/gildas-src-$pkgver_
    source admin/gildas-env.sh
    make
}

package() {
    cd ${srcdir}/gildas-src-$pkgver_
    source admin/gildas-env.sh
    make install
    
    target="opt/gildas-exe-$pkgver_"
    cd "$pkgdir"
    mkdir opt
    cp -r ${srcdir}/gildas-exe-$pkgver_ $target
    
    #Ading /etc/profile
    mkdir -p etc/profile.d
    echo export GAG_ROOT_DIR=/opt/gildas-exe-$pkgver_ >> etc/profile.d/gildas.sh
    echo export GAG_EXEC_SYSTEM=$GAG_EXEC_SYSTEM >> etc/profile.d/gildas.sh
    echo source /opt/gildas-exe-$pkgver_/etc/bash_profile >> etc/profile.d/gildas.sh
    chmod +x etc/profile.d/gildas.sh
}
