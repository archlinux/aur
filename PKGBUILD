# Maintainer: sukanka <su975853527[AT]gmail.com>

pkgname=bark-server
pkgver=2.0.3
pkgrel=1
pkgdesc="Backend of Bark"
arch=("any")
url="https://github.com/Finb/bark-server"
license=("MIT")
depends=("go" "make")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Finb/bark-server/archive/refs/tags/v${pkgver}.tar.gz"
"$pkgname.conf"
)
backup=("etc/nginx/conf.d/${pkgname}.conf")

sha512sums=('3a416a55435d7587f5e1ba534d2539729adce0b9380109357bb86a0cba4a4649a5ad356834f2b2d18a9cb48d545a945a86adf52c93d9246a785a65a40757cc88'
            '977ea6e0a6d4052181353f015beb72ea448e365c886e49b898865bae2cd70f53ed20a610b2ce637b78da3767bdbb9cacb0d64cdad4d3034bd1895617d8592e2e')

prepare(){    
    cd $srcdir/${pkgname}-${pkgver}
    sed -i "8c PLATFORMS=linux/" .cross_compile.sh
    sed -i '16c export TARGET=${TARGET_DIR}/${DIST_PREFIX}' .cross_compile.sh
    sed -i "7c ExecStart=/usr/bin/bark-server -addr 0.0.0.0:18080 -data /var/${pkgname}/data"\
            deploy/${pkgname}.service
}

build(){
    cd $srcdir/${pkgname}-${pkgver}
    make 
    
}


package(){
    install -Dm644 ${pkgname}.conf ${pkgdir}/etc/nginx/conf.d/${pkgname}.conf
    
    cd ${srcdir}/${pkgname}-${pkgver}
    install -Dm755 dist/bark-server ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 deploy/bark-server.service  \
            ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
