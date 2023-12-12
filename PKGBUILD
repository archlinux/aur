# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-beta-bin"
_pkgver="1.8.0-beta.2"
pkgver="${_pkgver/-/.}"
pkgrel="1"
pkgdesc="The universal proxy platform (beta binary version)."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git" "sing-box-bin")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
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
            '5afe85ede1e8af0f9caa2db7cd03dec3c7aa0a135feefe26f77748742b22402b90f3d8d8172e535b3c1353b136620e6f20d66d2d782ea8687a66b6c4e6c82650'
            '2a6ba5b9abfc0374c2cc79f0624ae5f4bef0f2fdc77624659ef91eff7ad899e86df2d5956a370eb27e4eb3e68c00165a32cba8ecad08f7d4845eca23ba7cd31f')
sha512sums_x86_64=('c816514a391d63e645700c081859875a60770ab505332b35be432a936d86a753b810cd6252a9751c09ac4827a6036b2f46f6efd39c6d29d287edaad66c1275c4')
sha512sums_armv7h=('7aafc41d6227ea5b730c7d5781182b4611bbaf0c787afd5ea339859c9a3a1e6ddfc01d9f97795f2959625c95110e800815d9d5a7552f5d1a97164554e9bff46d')
sha512sums_aarch64=('13a0833c1858188b67232b3db031f478ecf15cefde84c3c601797ad5adfbbed2c359754e4f291ae28fb7b77e6f054b67efbc157f490cdf9afeb1bab91125c374')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "$srcdir"

    install -Dm644 sing-box.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box.sysusers "$pkgdir/usr/lib/sysusers.d/sing-box.conf"
    install -Dm644 sing-box.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/sing-box.conf"
    install -Dm644 config.json -t "$pkgdir/etc/sing-box"

    cd "sing-box-$_pkgver-linux-${ARCH_MAP[$CARCH]}"

    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/sing-box"

    ./sing-box completion bash |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/sing-box"
    ./sing-box completion fish |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/sing-box.fish"
    ./sing-box completion zsh |
        install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_sing-box"
}
