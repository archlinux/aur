# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgname=sccache-dist
pkgver=0.7.4
pkgrel=1
pkgdesc="sccache compilation server"
arch=('x86_64' 'i686')
url="https://github.com/mozilla/sccache"
license=('Apache')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib' 'zstd' 'bubblewrap')
makedepends=('rust')
conflicts=('sccache')
source=(
    "https://github.com/mozilla/sccache/archive/v${pkgver}.tar.gz"
    "sccache-scheduler.service"
    "sccache-server.service"
    "scheduler.conf"
    "server.conf"
)
sha256sums=('32301f125d5b1d73830b163fd15fe9b5c22cf4a4a6b835d893dec563aba5b4fc'
            'c239a9c8139712a8fa9f859623849b81b520450214e28e730a903ab34d9e79ae'
            'f46bbb10f8d6df8761707197e9f7e793ff858b5b7c74b04dfc032e6dd04c86ec'
            '2434090e2fa18024ad964d59e33bcc5040f8e08273d0de736ba656bb3ed411d1'
            '56350994046ea1ba4a836552bb97e2f393f474b401f990441f3d640d7ba10c8a')
backup=(
    "etc/${pkgname}/scheduler.conf"
    "etc/${pkgname}/server.conf"
)

build() {
    cd "${srcdir}/sccache-${pkgver}"
    export LDFLAGS+=' -lzstd'
    cargo build --release --target-dir ./target/ --features all,dist-server,native-zlib
}

package() {
    install -Dm755 "${srcdir}/sccache-${pkgver}/target/release/${pkgname/-dist/}" "${pkgdir}/usr/bin/${pkgname/-dist/}"
    install -Dm755 "${srcdir}/sccache-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -d "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/sccache-scheduler.service" "${pkgdir}/usr/lib/systemd/system/sccache-scheduler.service"
    install -Dm644 "${srcdir}/sccache-server.service" "${pkgdir}/usr/lib/systemd/system/sccache-server.service"

    install -d "${pkgdir}/etc/${pkgname}"
    install -Dm644 "${srcdir}/scheduler.conf" "${pkgdir}/etc/${pkgname}/scheduler.conf"
    install -Dm644 "${srcdir}/server.conf" "${pkgdir}/etc/${pkgname}/server.conf"
}
