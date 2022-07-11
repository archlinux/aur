# Maintainer: sukanka <su975853527[AT]gmail.com>

pkgname=bark-server
pkgver=2.1.1
pkgrel=1
pkgdesc="Backend of Bark"
arch=("any")
url="https://github.com/Finb/bark-server"
license=("MIT")
makedepends=("go" "make")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Finb/bark-server/archive/refs/tags/v${pkgver}.tar.gz"
"$pkgname.conf"
)
backup=("etc/nginx/conf.d/${pkgname}.conf")

sha512sums=('2b5fee0dd230470081bf3aec3664d742d38577f444ea5ae06ba18fef9bface5d2b6c659bbd92dd74c1d8292f524a3ddf45b92801876a7fed85d3754d6fef3458'
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
