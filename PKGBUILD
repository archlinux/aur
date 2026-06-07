# Maintainer: shtorm <sergeimaklagin7#gmail.com>

_pkgname=sing-box
pkgname=sing-box-extended-bin
_pkgver="1.13.12-extended-2.4.0"
pkgver="${_pkgver//-/\~}"
pkgrel=1

pkgdesc='Sing-box with extended features (binary version).'
arch=("x86_64" "armv7h" "aarch64")
url='https://github.com/shtorm-7/sing-box-extended'
license=("LicenseRef-${pkgname}")

provides=($_pkgname)
source=("sing-box.service"
        "sing-box@.service"
        "sing-box.sysusers"
        "sing-box.rules"
        "sing-box-split-dns.xml"
        "config.json")
source_x86_64=("sing-box-$_pkgver-linux-amd64.tar.gz::$url/releases/download/v$_pkgver/sing-box-$_pkgver-linux-amd64.tar.gz")
source_armv7h=("sing-box-$_pkgver-linux-armv7.tar.gz::$url/releases/download/v$_pkgver/sing-box-$_pkgver-linux-armv7.tar.gz")
source_aarch64=("sing-box-$_pkgver-linux-arm64.tar.gz::$url/releases/download/v$_pkgver/sing-box-$_pkgver-linux-arm64.tar.gz")
sha256sums=('a828ee277711a6b376c8cf4c9a1f73458ca39ef262dd9d2a726f63111ff19e09'
            '9f7b3ab38245343f191a79c9a425db455ed8bf503178dd9476a254c73db1c32d'
            '3131e799142a007edd45ba7de92b535ca8405b2b28957016a2153448d798060e'
            '927315d96d5681a1c019de450b2bb4de3d0e56e6db4fd619dc13c925b37e5405'
            '77d1b5fbcfe27e3effbe382c574f3bde140ca4eb18fab76faa31e147f74b7f71'
            '44f3e5d85740b26c9f4d5cbbddfced42fce98bdf6fd8d28e1480b93c9edf18d6')
sha256sums_x86_64=('f5e543f59890063cadd3d6fd31b52862f70e23f6b7ad2075b8eeeb1d287d994a')
sha256sums_armv7h=('d39cec7297d52affbbca43d70d4397c039173a404aeba09cfe86b6b2d3a0195c')
sha256sums_aarch64=('d0a19ee23dca37c32baa61c565ae097eb38c0534abf104af936e9eec67c17ecf')
conflicts=($_pkgname "$_pkgname-git" "$_pkgname-beta" "$_pkgname-extended")

backup=("etc/sing-box/config.json")


package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    install -Dm644 config.json -t "$pkgdir/etc/$_pkgname"
    install -Dm644 sing-box.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box.sysusers "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 sing-box.rules -t "$pkgdir/usr/share/polkit-1/rules.d"
    install -Dm644 sing-box-split-dns.xml "$pkgdir/usr/share/dbus-1/system.d/sing-box-split-dns.conf"

    cd "sing-box-$_pkgver-linux-${ARCH_MAP[$CARCH]}"
    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 <(./sing-box completion bash) "$pkgdir/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 <(./sing-box completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
    install -Dm644 <(./sing-box completion zsh) "$pkgdir/usr/share/zsh/site-functions/_${_pkgname}"
}
