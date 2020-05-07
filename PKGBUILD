# Maintainer: Maciej Kwiek <maciej.iai@gmail.com>

pkgname=jk
pkgver=0.4.0
pkgrel=1
pkgdesc="data templating tool designed to help writing structured configuration files."
arch=('x86_64')
url="https://github.com/jkcfg/${pkgname}"
license=('Apache')
depends=('nodejs')
makedepends=('go' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jkcfg/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9b13dc1cd369dbe37a3040225adfd93b6dbd2eb53e8e6ec37a66fb6443f524fd')

build() {
    if [ ! -d prebuilt ] ; then
        git clone https://github.com/jkcfg/prebuilt.git
    fi
    pushd prebuilt
    make install-linux-amd64 D=${srcdir}/prebuilt/build install

    export PKG_CONFIG_PATH=${srcdir}/prebuilt/build/lib/pkgconfig
    sed -i "s;/usr/local;${srcdir}/prebuilt/build;" ${PKG_CONFIG_PATH}/v8.pc
    popd

    cd "${pkgname}-${pkgver}"
    make dep
    make jk
}

package() {
    cd "${pkgname}-${pkgver}"
    make D="${pkgdir}/usr/bin" install
}
