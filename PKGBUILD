# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.4.2"
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
            'c97518ba1e9b865239cedbba7bf6c5b9af0e0c873972fa6df7169aac43a8b500f9d063b382530faa326c0b5f135876cb9eb601a7922a6d0f53adaa9ba27e6816'
            'a3eb0e5789f04069fc7fd55ff09c437e394ae370110a43d6a1000759a524ac7d1b9f8b664656c2c9fb94fc9eca4852fb338a24186d9e3da30aed02773edbab86')
sha512sums_x86_64=('8e004b8214442493b639da4474f36f7779629ce6e8b93fc60594bc4942758632054676060e0514406586e041e591d431049f3249c7445a51a880b9db87c90a40')
sha512sums_armv7h=('20c4516d02d4dea55a4c76059dc1950eae35397cddf4c331657ebafb88bf13979cd774006b64bb3fd4682b8e508d8cd2e7bfb15a969ead970fe6ed8444242636')
sha512sums_aarch64=('30ea7a655e606d4078c2cca2048709b17a53ded37ce05a5c5a5048638160c363f88912400a3ff7a08e949445042d909cf486bf12ef89646a99e636a4d1cedc81')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "$srcdir"

    install -Dm644 "sing-box.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "sing-box@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "sing-box.sysusers" "$pkgdir/usr/lib/sysusers.d/sing-box.conf"
    install -Dm644 "sing-box.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/sing-box.conf"
    install -Dm644 "config.json" -t "$pkgdir/etc/sing-box"

    cd "sing-box-$pkgver-linux-${ARCH_MAP[$CARCH]}"

    ./sing-box completion bash |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/sing-box"
    ./sing-box completion fish |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/sing-box.fish"
    ./sing-box completion zsh |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_sing-box"

    install -Dm755 "sing-box" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/sing-box"
}
