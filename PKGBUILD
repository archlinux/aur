# Maintainer: sukanka <su975853527[AT]gmail.com>

pkgname=bark-server
pkgver=2.1.3
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

sha512sums=('d9eee902bb93c27d2eddd3ba9726684c84edd767cf063c73869a76ccb4262b6f5820c30eeb294f365104fe573e11453c860395e90699ad7e9d6baf11ee4ba2ca'
            '977ea6e0a6d4052181353f015beb72ea448e365c886e49b898865bae2cd70f53ed20a610b2ce637b78da3767bdbb9cacb0d64cdad4d3034bd1895617d8592e2e')

prepare(){
    cd $srcdir/${pkgname}-${pkgver}
    sed -i "7c ExecStart=/usr/bin/bark-server -addr 0.0.0.0:18080 -data /var/${pkgname}/data"\
            deploy/${pkgname}.service
}

build(){
    cd $srcdir/${pkgname}-${pkgver}
    export HOME=$srcdir
    go install
    go build

}


package(){
    install -Dm644 ${pkgname}.conf ${pkgdir}/etc/nginx/conf.d/${pkgname}.conf

    cd ${srcdir}/${pkgname}-${pkgver}
    install -Dm755 bark-server ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 deploy/bark-server.service  \
            ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
