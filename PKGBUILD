# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.8.9"
pkgrel="1"
pkgdesc="The universal proxy platform (binary version)."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
backup=("etc/sing-box/config.json")
source=("sing-box.service"
        "sing-box@.service"
        "sing-box.sysusers"
        "sing-box.tmpfiles"
        "config.json")
source_x86_64=("sing-box-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-amd64.tar.gz")
source_armv7h=("sing-box-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-armv7.tar.gz")
source_aarch64=("sing-box-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-arm64.tar.gz")
sha512sums=('22dd683d93e28ac8bc6eb33519b2d6dbf382f533f20937226f64f3ac583bb6101bda28ba0b4b097058fdf32c48a6ab007961b90298e82dea0e17fec66032f5b5'
            'f1122183b64ffc396394c6be3721c48d1ec094d0aad7a894324e9a0ccc9bcc1cedc11e3be9f6082f51e6851c8821a51361fe6286188ab2b3daca19a86e6f1c7c'
            '0541f144ee33bb4cb182231794065babae530260b95bff26cbeb5491ab856d40e247895d130629f9dbef58dcd6652f0c69d3e28f57f3bae916d36294565399b0'
            '5afe85ede1e8af0f9caa2db7cd03dec3c7aa0a135feefe26f77748742b22402b90f3d8d8172e535b3c1353b136620e6f20d66d2d782ea8687a66b6c4e6c82650'
            '1d193332c1428f308454877dbc2999fac471b4b280b68356142ac564925ebf87e04277f1f50230c3674770f625c9ae1326f3f0acd722145dfa1c3511f1cc7512')
sha512sums_x86_64=('85888905367333ef5f6942403ff7666c6d030b2e44f2293437a03a842e8168efc3d25793d264fee58a7742cd19da0fe80c473598edde004e933caaa84c620ce6')
sha512sums_armv7h=('fa778aabdd4b3a4a0455fba9f2b3aa9649f04cdca47434697517a97f165e16aeb9e8cdf82d979398f1146b1b2d46090a50de78459c5dcc541e6973031695382c')
sha512sums_aarch64=('06f977951239d9de30c22ea684bdec46e7cc3208ac09cafc13b772992224cd78180ca50e75386e256b085c392e1af8f7871bf0a0ec83597315344d8fc982c22b')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "$srcdir"

    install -Dm644 sing-box.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box.sysusers "$pkgdir/usr/lib/sysusers.d/sing-box.conf"
    install -Dm644 sing-box.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/sing-box.conf"
    install -Dm644 config.json -t "$pkgdir/etc/sing-box"

    cd "sing-box-$pkgver-linux-${ARCH_MAP[$CARCH]}"

    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/sing-box"

    ./sing-box completion bash |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/sing-box"
    ./sing-box completion fish |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/sing-box.fish"
    ./sing-box completion zsh |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_sing-box"
}
