# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.12.20"
pkgrel="1"
pkgdesc="The universal proxy platform (binary version)"
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
backup=("etc/sing-box/config.json")
source=("sing-box.service"
        "sing-box@.service"
        "sing-box.sysusers"
        "sing-box.rules"
        "sing-box-split-dns.xml"
        "config.json")
source_x86_64=("sing-box-$pkgver-linux-amd64.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-amd64.tar.gz")
source_armv7h=("sing-box-$pkgver-linux-armv7.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-armv7.tar.gz")
source_aarch64=("sing-box-$pkgver-linux-arm64.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-arm64.tar.gz")
sha256sums=('a828ee277711a6b376c8cf4c9a1f73458ca39ef262dd9d2a726f63111ff19e09'
            '9f7b3ab38245343f191a79c9a425db455ed8bf503178dd9476a254c73db1c32d'
            '3131e799142a007edd45ba7de92b535ca8405b2b28957016a2153448d798060e'
            '927315d96d5681a1c019de450b2bb4de3d0e56e6db4fd619dc13c925b37e5405'
            '77d1b5fbcfe27e3effbe382c574f3bde140ca4eb18fab76faa31e147f74b7f71'
            '44f3e5d85740b26c9f4d5cbbddfced42fce98bdf6fd8d28e1480b93c9edf18d6')
sha256sums_x86_64=('31159526f9640820c64cffe734ac2f5a260da05c205eb84204c6c91234f9d9eb')
sha256sums_armv7h=('d963a48dff4db35b13d66711d7f079306c3eb5708c81014797bd41b6d05a50ba')
sha256sums_aarch64=('36915cf6ebd9ba4591e88ee499c43880addca4aa6582594d4d8eb27f3b75088c')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    install -Dm644 sing-box.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box.sysusers "$pkgdir/usr/lib/sysusers.d/sing-box.conf"
    install -Dm644 sing-box.rules -t "$pkgdir/usr/share/polkit-1/rules.d"
    install -Dm644 sing-box-split-dns.xml "$pkgdir/usr/share/dbus-1/system.d/sing-box-split-dns.conf"
    install -Dm644 config.json -t "$pkgdir/etc/sing-box"

    cd "sing-box-$pkgver-linux-${ARCH_MAP[$CARCH]}"
    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/sing-box"
    install -Dm644 <(./sing-box completion bash) "$pkgdir/usr/share/bash-completion/completions/sing-box"
    install -Dm644 <(./sing-box completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/sing-box.fish"
    install -Dm644 <(./sing-box completion zsh) "$pkgdir/usr/share/zsh/site-functions/_sing-box"
}
