# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.5.0"
pkgrel="1"
pkgdesc="The universal proxy platform (binary version)."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
optdepends=("sing-geosite: sing-geosite database"
            "sing-geoip: sing-geoip database")
backup=("etc/sing-box/config.json")
source=("sing-box.service"
        "sing-box@.service"
        "sing-box.sysusers"
        "sing-box.tmpfiles"
        "config.json")
source_x86_64=("sing-box-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-amd64.tar.gz")
source_armv7h=("sing-box-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-armv7.tar.gz")
source_aarch64=("sing-box-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-arm64.tar.gz")
sha512sums=('b5e5b8dad736b628a2761cc883b7e8439d604b5b1612447020ac7c143747e57acaf7dc8211cb50beb9d727f6d618cbe481874d012837fb3b2f089cd08299e1d2'
            '84dbbd0e7a9f67072bcfd836440ad002c2a46ebb0c9cb54310e13774b63890b6245e13472574e226cfe278c2f9d586fa28f3441a0defca0d35c3653684d07d97'
            '0541f144ee33bb4cb182231794065babae530260b95bff26cbeb5491ab856d40e247895d130629f9dbef58dcd6652f0c69d3e28f57f3bae916d36294565399b0'
            '5afe85ede1e8af0f9caa2db7cd03dec3c7aa0a135feefe26f77748742b22402b90f3d8d8172e535b3c1353b136620e6f20d66d2d782ea8687a66b6c4e6c82650'
            'a3eb0e5789f04069fc7fd55ff09c437e394ae370110a43d6a1000759a524ac7d1b9f8b664656c2c9fb94fc9eca4852fb338a24186d9e3da30aed02773edbab86')
sha512sums_x86_64=('d3e67b7ee96fb94ba596c27585be6823dacb71de30ec97ff84ee2988372e02033cb756869af9543a96b1d3cca1002bb784b3f5610f5204395ced2affe2ef6f8f')
sha512sums_armv7h=('22e821a68c5aea2ada9df39d6b7f9714f85aa68c3b9d007111ba7ac3953c88a4a9d43848b5417e177cc6697d7e3ca1b0027b3e3ceb58e802dcca3a2ebb466c54')
sha512sums_aarch64=('d585529a04803c54e359e8a6ee52a940ec3240609ddbe327ad11ea0b3f073d2a4c8bc519c0ffb91387df239c4d4102cd3c78781803003d271072be38f67456de')

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

    ./sing-box completion bash |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/sing-box"
    ./sing-box completion fish |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/sing-box.fish"
    ./sing-box completion zsh |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_sing-box"

    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/sing-box"
}
