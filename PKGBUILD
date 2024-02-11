# Maintainer: Evgeniy Dombek <edombek@yandex.ru>

pkgname=gildas
pkgver=2024.02.a
pkgver_=feb24a
pkgrel=2
pkgdesc='GILDAS'
arch=('x86_64')
url="https://www.iram.fr/IRAMFR/GILDAS/"
license=('custom')
makedepends=(python python-setuptools python-numpy which)
depends=(gcc-fortran cfitsio gtk2)
optdepends=(python-numpy)

source=("https://www.iram.fr/~gildas/dist/gildas-src-$pkgver_.tar.xz")
sha512sums=('5f782f0e31baf8dbb7b61c7e7a33e6bcac71395b49f69953aa17926b8b53abd75c53531ee5ededad59d96ad2d251c59449bd6b3347a0d1371a6529020ae0a7e6')
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
