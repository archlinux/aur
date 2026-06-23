# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=vector-bin
pkgver=0.56.0
pkgrel=1
pkgdesc="A high-performance observability data pipeline"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/vectordotdev/vector"
license=(MPL-2.0)
provides=(vector)
conflicts=(vector)
backup=(etc/vector/vector.toml # Versions <0.35.0
        etc/vector/vector.yaml
        etc/default/vector)
depends=(libgcc_s.so libz.so)
source=(vector.sysusers
        vector.tmpfiles)
source_x86_64=("vector-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/vector-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("vector-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/vector-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("vector-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/vector-$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
sha512sums=('4f7a5d63f4e89018d1f0e9aa0fba2bb5c448d7031a7ff40c82878f574243e075c2fca020e78c4c71b1caa1a5bd1f06b496a5d3ab432f01d145233fd6c9ec4b87'
            'c192492df09d131f9174d2acbb7f265c280eb6d678589b8c93bacc47ae55c51573a5477d715897f8580ced420730992fb68bee78b374f1cc042888ea6b5512fd')
sha512sums_x86_64=('19b312cd694227411b1755d99bad6fe00b57afc46a2f9ae9183a54b3416dbdb8f3e3e2fd549aa4973f709e4d5d3191c0c311024ef731e4582ee209cf8b732522')
sha512sums_aarch64=('227ca2b5d4568f8f6b5c16d665675240306b904c281f3df1d03f7b8de206fa67a8896489db04f76801829485d0e1dc98b1a134abce03d1cdd9547e479af4d78b')
sha512sums_armv7h=('b1d31dad62865b3a5ab886b3a59757e79dbdae5b336faf0645316e66c0778a5bc60ae02ea5c98c2b14090f02f5b3ca144ee32c58eec58da5f8a33b65323ae4be')

prepare() {
    mv "vector-$CARCH-unknown-linux-gnu" vector || mv vector-armv7-unknown-linux-gnueabihf vector
}

package() {
    install -Dm644 vector.sysusers "$pkgdir/usr/lib/sysusers.d/vector.conf"
    install -Dm644 vector.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/vector.conf"

    cd "vector"
    install -Dm755 "bin/vector" "${pkgdir}/usr/bin/vector"
    install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname/"

    install -Dm644 config/vector.yaml -t "${pkgdir}/etc/vector/"
    chmod 0550 "${pkgdir}/etc/vector"
    mkdir -p "${pkgdir}/usr/share/doc/vector/"
    cp -r config/examples "${pkgdir}/usr/share/doc/vector/examples"

    install -Dm644 etc/systemd/vector.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 etc/systemd/hardened-vector.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 etc/systemd/vector.default "${pkgdir}/etc/default/vector"
}
