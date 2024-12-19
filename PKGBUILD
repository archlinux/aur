# Maintainer: sukanka <su975853527[AT]gmail.com>

pkgname=bark-server
pkgver=2.1.9
pkgrel=1
pkgdesc="Backend of Bark"
arch=("x86_64" "aarch64")
url="https://github.com/Finb/bark-server"
license=("MIT")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "$pkgname.conf"
)
backup=("etc/nginx/conf.d/${pkgname}.conf")

sha512sums=('a6f73a9c2a0a1c587d8fe989d72d80b812d0175aee193cacb975e5458e695b0254740e613adec0c669ff6b94dca881a6cdb8e45c1cddb9ae76f1290fa190b6b2'
            '977ea6e0a6d4052181353f015beb72ea448e365c886e49b898865bae2cd70f53ed20a610b2ce637b78da3767bdbb9cacb0d64cdad4d3034bd1895617d8592e2e')

prepare() {
    cd $srcdir/${pkgname}-${pkgver}
    sed -i "s|^ExecStart=.*|ExecStart=/usr/bin/bark-server -addr 0.0.0.0:18080 -data /var/${pkgname}/data|g" \
        deploy/${pkgname}.service
}

build() {
    cd $srcdir/${pkgname}-${pkgver}
    export HOME=$srcdir
    go install
    go build

}

package() {
    install -Dm644 ${pkgname}.conf ${pkgdir}/etc/nginx/conf.d/${pkgname}.conf

    cd ${srcdir}/${pkgname}-${pkgver}
    install -Dm755 bark-server ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 deploy/bark-server.service \
        ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
