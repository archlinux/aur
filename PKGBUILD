# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.10.1"
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
            'c264ac366ae5b3eb3174c0d1ec9412be23cfb3f9eabc3f665b8b9926fb7cda71675e61a985e56ad2895fa75365aff12db01eda5910ae67e0ad0da2fefb299b13')
sha512sums_x86_64=('ab66e496cae2e454c0c30038e209e6339acf9dab144cc869b248cad6ce7c6feddcd3c7fb2c1d27ad63d217638ae3b1464ab2da8a8e229592b50563dd8ac19a90')
sha512sums_armv7h=('164f8399ed3aea1df61bda7caa027eafd8601651ee1ccc15dbd972e6c50c4199fa8f5c3690cef1c907ebf404866340655c07e85899932b1b738ec590282c2fb2')
sha512sums_aarch64=('68b67946ef037503cbf5d038d9da9222dc1b181d502a9e9f737cfb3ecd45e3672220d6a7561ed0b0b901f05463c9204d4b11a0ecc2f248f719053da54258b927')

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
