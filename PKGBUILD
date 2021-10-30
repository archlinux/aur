# Maintainer: sukanka <su975853527[AT]gmail.com>

pkgname=bark-server
pkgver=2.0.2
pkgrel=1
pkgdesc="Backend of Bark"
arch=("any")
url="https://github.com/Finb/bark-server"
license=("MIT")
depends=("go" "make")
source=("${pkgname}.tar.gz::https://github.com/Finb/bark-server/archive/refs/tags/v2.0.2.tar.gz"
"$pkgname.conf"
)
backup=("etc/nginx/conf.d/${pkgname}.conf")

sha512sums=('e812923568685f91f563e0a1af143866fb84ba1ff67643b0152a5757508c535a5ec7f84da1ce8c60a95f84d8ce0ff4f5cdf174760876dac8719be6280f848342'
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
