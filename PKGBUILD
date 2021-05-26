# Maintainer: Wei Congrui < crvv.mail at gmail dot com >
# Maintainer: Avelino < avelinorun at gmail dot com >

pkgname=prest
pkgver=1.0.8
pkgrel=1
pkgdesc='pREST (PostgreSQL REST), simplify and accelerate development, ⚡ instant, realtime, high-performance on any Postgres application, existing or new'
arch=('any')
url='https://prestd.com/'
license=('MIT')
backup=('etc/prest.toml')
makedepends=('go>=1.11.4')
provides=("prestd")
source=("https://github.com/prest/prest/archive/v${pkgver}.tar.gz"
        'prestd.service'
        'prest.toml')
sha256sums=("SKIP" "SKIP" "SKIP")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -pv build/
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go mod download
    go build -o build/${pkgname}d -ldflags="-s -w" ./cmd/prestd/*.go
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dpm755 -D "build/${pkgname}d" "${pkgdir}/usr/local/bin/${pkgname}d"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 0644 ../../prestd.service "$pkgdir/usr/lib/systemd/system/prestd.service"
    install -D -m 0644 ../../prest.toml "$pkgdir/etc/prest.toml"
}
