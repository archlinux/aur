# Maintainer: Moraxyc <i@qaq.li>

pkgname=artalk
pkgver=2.9.1
pkgrel=1
pkgdesc="A self-hosted comment system"
url="https://github.com/ArtalkJS/Artalk"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'arm7vh' 'aarch64' 'riscv64' 'loong64')
depends=('glibc')
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
    "$pkgname-ui-$pkgver.tar.gz::$url/releases/download/v${pkgver}/artalk_ui.tar.gz"
    'artalk.service'
    'artalk.tmpfiles'
    'artalk.sysusers')
sha256sums=('edb1f85fb84e103d9a6bfda25191b174df22b354c6d9d3dedb154c2fbbddc2ee'
            '724282e2512b295749b89fa91b2b26311f7a6bd2e4ac2627581e23e953cff0e6'
	    '089beb9843b735b597b93c727595fbded272261c2f54e193f73e3db36da5f00e'
	    '401cc7b81993810bb39285b244c6be7bae669f11c133bc676b3405581eb3e96d'
	    '12b14875a5e62d6a2a160a793285001621dac16539f8e2f1cee800644a62349e')

prepare() {
    cd "${srcdir}/Artalk-$pkgver"
    mv "${srcdir}/artalk_ui/dist" public/
    mv "${srcdir}/artalk_ui/sidebar" public/
    mkdir -p build
}

build() {
    cd "${srcdir}/Artalk-$pkgver"
    go mod download
    go build -o build/$pkgname \
        -ldflags="-s -w"
}


package() {
    cd "Artalk-$pkgver"
    install -Dv "build/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 README.zh.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/artalk.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/artalk.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/artalk.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
