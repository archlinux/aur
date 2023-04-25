# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
pkgname=sccache-dist
pkgver=0.4.2
pkgrel=1
pkgdesc="sccache distributed compilation server"
arch=('x86_64' 'i686')
url="https://github.com/mozilla/sccache"
license=('Apache')
depends=('gcc-libs' 'glibc' 'openssl' 'zlib' 'bubblewrap')
makedepends=('rust')
source=(
    "https://github.com/mozilla/sccache/archive/v${pkgver}.tar.gz"
    "sccache-scheduler.service"
    "sccache-server.service"
    "scheduler.conf"
    "server.conf"
)
sha256sums=('9e15676ca02e05cb8c5edc222101d2e0049ed3d12b38642830d35844672dbe81'
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
    cargo build --release --no-default-features --features="dist-server" --bin="sccache-dist"
}

package() {
    install -Dm755 "${srcdir}/sccache-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -d "${pkgdir}/usr/lib/systemd/system"
    install -Dm644 "${srcdir}/sccache-scheduler.service" "${pkgdir}/usr/lib/systemd/system/sccache-scheduler.service"
    install -Dm644 "${srcdir}/sccache-server.service" "${pkgdir}/usr/lib/systemd/system/sccache-server.service"

    install -d "${pkgdir}/etc/${pkgname}"
    install -Dm644 "${srcdir}/scheduler.conf" "${pkgdir}/etc/${pkgname}/scheduler.conf"
    install -Dm644 "${srcdir}/server.conf" "${pkgdir}/etc/${pkgname}/server.conf"
}
