# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=vector-bin
pkgver=0.57.0
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
depends=(
    glibc
    libgcc  libgcc_s.so
    zlib    libz.so)
source=(vector.sysusers
        vector.tmpfiles)
source_x86_64=("vector-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/vector-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("vector-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/vector-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("vector-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/vector-$pkgver-armv7-unknown-linux-gnueabihf.tar.gz")
sha512sums=('4f7a5d63f4e89018d1f0e9aa0fba2bb5c448d7031a7ff40c82878f574243e075c2fca020e78c4c71b1caa1a5bd1f06b496a5d3ab432f01d145233fd6c9ec4b87'
            'c192492df09d131f9174d2acbb7f265c280eb6d678589b8c93bacc47ae55c51573a5477d715897f8580ced420730992fb68bee78b374f1cc042888ea6b5512fd')
sha512sums_x86_64=('d3c1f8b857b9cd4a3dcb57efd03dd9a3bc0c501b7c26a41236b4f1f47258c917b33413e1e1ea4f421be841b9eb78d8fb52dcdcd25ef34b8dfd5b08f4808a1e21')
sha512sums_aarch64=('755382633b63567a862556b5e1ab8f2f6aa0086327945e7b32dcb7d930140cc1678a7495ab17b650fa49f97ec663b6c816eef2ad12b7c802ebb2e90fa5e1c363')
sha512sums_armv7h=('27fbf79b63d329fd6756210ce9e5aec6576626f465acf88d2bc854ed26fd4ccec298290028f2ed16545e847a61e15274439cbd949e416bd646ab26e0b6889585')

prepare() {
    mv "vector-$CARCH-unknown-linux-gnu" vector || mv vector-armv7-unknown-linux-gnueabihf vector
}

package() {
    install -Dm644 vector.sysusers "$pkgdir/usr/lib/sysusers.d/vector.conf"
    install -Dm644 vector.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/vector.conf"

    cd "vector"
    install -Dm755 bin/vector -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE NOTICE -t "$pkgdir/usr/share/licenses/$pkgname/"

    install -Dm644 config/vector.yaml -t "${pkgdir}/etc/vector/"
    chmod 0550 "${pkgdir}/etc/vector"
    mkdir -p "${pkgdir}/usr/share/doc/vector/"
    cp -r config/examples "${pkgdir}/usr/share/doc/vector/examples"

    install -Dm644 etc/systemd/vector.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 etc/systemd/hardened-vector.service -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 etc/systemd/vector.default "${pkgdir}/etc/default/vector"
}
