# Maintainer: sukanka <su975853527[AT]gmail.com>

pkgname=bark-server
pkgver=2.1.0
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

sha512sums=('3da6ab7e1368a9e49bbdb4841b4b20e0238e228bcef95cce4f0de655340eb8f6f2017acb127809fd0479c7b947439c8f1a1bca87a8c3f9c90c322e6c337cbcc7'
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
