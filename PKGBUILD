# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-beta-bin"
_pkgver="1.5.0-beta.7"
pkgver="${_pkgver/-/.}"
pkgrel="1"
pkgdesc="The universal proxy platform (beta binary version)."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git" "sing-box-bin")
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
source_x86_64=("sing-box-$_pkgver-x86_64.tar.gz::$url/releases/download/v$_pkgver/sing-box-$_pkgver-linux-amd64.tar.gz")
source_armv7h=("sing-box-$_pkgver-armv7h.tar.gz::$url/releases/download/v$_pkgver/sing-box-$_pkgver-linux-armv7.tar.gz")
source_aarch64=("sing-box-$_pkgver-aarch64.tar.gz::$url/releases/download/v$_pkgver/sing-box-$_pkgver-linux-arm64.tar.gz")
sha512sums=('b5e5b8dad736b628a2761cc883b7e8439d604b5b1612447020ac7c143747e57acaf7dc8211cb50beb9d727f6d618cbe481874d012837fb3b2f089cd08299e1d2'
            '84dbbd0e7a9f67072bcfd836440ad002c2a46ebb0c9cb54310e13774b63890b6245e13472574e226cfe278c2f9d586fa28f3441a0defca0d35c3653684d07d97'
            '0541f144ee33bb4cb182231794065babae530260b95bff26cbeb5491ab856d40e247895d130629f9dbef58dcd6652f0c69d3e28f57f3bae916d36294565399b0'
            'c97518ba1e9b865239cedbba7bf6c5b9af0e0c873972fa6df7169aac43a8b500f9d063b382530faa326c0b5f135876cb9eb601a7922a6d0f53adaa9ba27e6816'
            'a3eb0e5789f04069fc7fd55ff09c437e394ae370110a43d6a1000759a524ac7d1b9f8b664656c2c9fb94fc9eca4852fb338a24186d9e3da30aed02773edbab86')
sha512sums_x86_64=('e67cf28f2bfb217579978369fbcc63fe5c00deb32b9daaad0eed9f3a35e2a7ff4a5b95cfcb13c7b05d252d8180af2039c01279827687e52404027e61a6d4a77f')
sha512sums_armv7h=('cc490cf2d04159612b89ec73df9314fe3352f486d35fc1cd86fcc650f84e13dad1a44f4e4cbb286f80779dbcdae19fa1c0728a2111ae821578aac62b64e40b96')
sha512sums_aarch64=('d41784374906dbf3eac2c6992239a93dcbe03a15b4cc456319150d47951de467ac770ae110d211eb0ca652124562195c608f732c63f2ed1498dcc0da92099ff8')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "$srcdir"

    install -Dm644 "sing-box.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "sing-box@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "sing-box.sysusers" "$pkgdir/usr/lib/sysusers.d/sing-box.conf"
    install -Dm644 "sing-box.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/sing-box.conf"
    install -Dm644 "config.json" -t "$pkgdir/etc/sing-box"

    cd "sing-box-$_pkgver-linux-${ARCH_MAP[$CARCH]}"

    ./sing-box completion bash |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/sing-box"
    ./sing-box completion fish |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/sing-box.fish"
    ./sing-box completion zsh |
        install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_sing-box"

    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/sing-box"
}
