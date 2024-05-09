# Maintainer: Moraxyc <arch@qaq.li>

pkgname=artalk
pkgver=2.8.6
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
sha256sums=('1d6abad32da1fe88dcc38bda3a61070820126598b2fdba2c9f5808b72d0d0fd1'
            'dd183998216280b919f97f05c5ee80d7a4c777d8fa85c4d830400a5354ab2ccc'
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
    cd "Artalk-$pkgver"
    go mod download
    go build -o build/$pkgname \
        -ldflags="-s -w \
        -X 'github.com/ArtalkJS/Artalk/internal/config.Version=$pkgver' \
        -X github.com/ArtalkJS/Artalk/internal/config.CommitHash=$pkgver" 
}


package() {
    cd "Artalk-$pkgver"
    install -Dv "build/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 README.en.md -t "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/artalk.service" -t "${pkgdir}/usr/lib/systemd/system/"
    install -Dm644 "${srcdir}/artalk.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
    install -Dm644 "${srcdir}/artalk.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
