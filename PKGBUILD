# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgname=lightspeed-ingest-git
pkgver=r192.676d4bb
pkgrel=1
pkgdesc="A FTL handshake server written in Rust"
arch=(x86_64)
url="https://github.com/GRVYDEV/Lightspeed-ingest"
license=("custom:MIT")
depends=("gcc-libs")
optdepends=("lightspeed-webrtc: Server handling transmission of Stream")
makedepends=("rust" "git" "gcc")
provides=("lightspeed-ingest")
conflicts=("lightspeed-ingest")
backup=("etc/conf.d/lightspeed-ingest")
source=("${pkgname}::git+https://github.com/GRVYDEV/Lightspeed-ingest.git"
        "systemd.service"
        "service.env"
        "sysusers"
        "tmpfiles")
sha512sums=('SKIP'
            'b7767afba4f02dd42ca96aef34f134b6f3f64f95fd028f67296feb2004ebd60e0140d5de2d48ab856e25059f14279106fab673dd6b065b840d116e43390ae467'
            '40f716566e985cdb243225f3944d5377bd477d9df5839083636e08a12a5eafca9c499129bb16c886c71586ef7c8f2b0ae8ac616b5407c7f01763ee5d4eb0e85d'
            '7a6a040f8df1389fab70f53856ea493077fb5cec5f5095999c4f20465f98e0f27e6ae089a3e76e2bb0e60a08dedf2935213a4321175d58e508b377e638be4769'
            '0f59e1f2b5a547736d0e60e8843b4b0aa7beb61f1698e8da9bad0cbe129475408b42480f108fcd779a9121692f2743eade666bbc6a16a6b873a6d7e009671320')


pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"

    cargo build --release --locked
}

package() {
    cd "$pkgname"

    install -Dm755 "target/release/lightspeed-ingest" "${pkgdir}/usr/bin/lightspeed-ingest"

    install -Dm755 "../systemd.service" "${pkgdir}/usr/lib/systemd/system/lightspeed-ingest.service"
    install -Dm755 "../service.env" "${pkgdir}/etc/conf.d/lightspeed-ingest"

    install -Dm644 "../sysusers" "$pkgdir/usr/lib/sysusers.d/lightspeed-ingest.conf"
    install -Dm644 "../tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/lightspeed-ingest.conf"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/lightspeed-ingest/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
