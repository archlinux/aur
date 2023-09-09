# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.4.1"
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
sha512sums_x86_64=('7acbbc49940b55f06391f4b3ffae4ff7eeddff99570d20734eabd83bd48ae79d61475e25f95afaf7cf188c030a9d440c15c313f3230b994f7427a270b9127585')
sha512sums_armv7h=('17527f6eae092ac42e2ca572b75fdc87cfe7d01936d2097eb1be5912fa8c57267c21cd02ce622da5a2c0e8fcc0645214efd5f35278c29d3ddc096473dcc81c66')
sha512sums_aarch64=('c5d17b5f6887e7ee92f9139f7043c2289426ec3231b474d997a10c01abeb374b00855b0cd57cb6bc387543a7b3c06d65510c790d213d6d3baee4991df62fce7c')

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

    ./sing-box completion bash > sing-box.bash
    ./sing-box completion fish > sing-box.fish
    ./sing-box completion zsh > sing-box.zsh

    install -Dm644 sing-box.bash "${pkgdir}/usr/share/bash-completion/completions/sing-box"
    install -Dm644 sing-box.fish "${pkgdir}/usr/share/fish/vendor_completions.d/sing-box.fish"
    install -Dm644 sing-box.zsh "${pkgdir}/usr/share/zsh/site-functions/_sing-box"

    install -Dm755 "sing-box" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/sing-box"
}
