# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-glibc-bin"
pkgver="1.13.3"
pkgrel="1"
pkgdesc="The universal proxy platform (CGO binary version)"
provides=("sing-box")
conflicts=("sing-box" "sing-box-bin" "sing-box-beta" "sing-box-beta-bin" "sing-box-git")
depends=("glibc")
optdepends=('libcronet.so: NaiveProxy outbound support'
            'sing-geosite-rule-set: geosite rule sets'
            'sing-geoip-rule-set: geoip rule sets')
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("LicenseRef-sing-box")
backup=("etc/sing-box/config.json")
source=("sing-box.service"
        "sing-box@.service"
        "sing-box.sysusers"
        "sing-box.rules"
        "sing-box-split-dns.xml"
        "config.json")
source_x86_64=("sing-box-$pkgver-linux-amd64-glibc.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-amd64-glibc.tar.gz")
source_armv7h=("sing-box-$pkgver-linux-armv7-glibc.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-armv7-glibc.tar.gz")
source_aarch64=("sing-box-$pkgver-linux-arm64-glibc.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-arm64-glibc.tar.gz")
sha256sums=('a828ee277711a6b376c8cf4c9a1f73458ca39ef262dd9d2a726f63111ff19e09'
            '9f7b3ab38245343f191a79c9a425db455ed8bf503178dd9476a254c73db1c32d'
            '3131e799142a007edd45ba7de92b535ca8405b2b28957016a2153448d798060e'
            '927315d96d5681a1c019de450b2bb4de3d0e56e6db4fd619dc13c925b37e5405'
            '77d1b5fbcfe27e3effbe382c574f3bde140ca4eb18fab76faa31e147f74b7f71'
            '44f3e5d85740b26c9f4d5cbbddfced42fce98bdf6fd8d28e1480b93c9edf18d6')
sha256sums_x86_64=('8f5336cc671851147b695b28bb69a8ae9e7b7bb9ad0513a2099a1e9be413be8f')
sha256sums_armv7h=('077b4504297227df326530553202017b4e74162cfbdd15ee5cdd97f341dedd60')
sha256sums_aarch64=('7c0bf8918f1c558d184b2a8c10855bbe3e14f813322b3354e42104937c8c9870')

package() {
    install -Dm644 sing-box.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box.sysusers "$pkgdir/usr/lib/sysusers.d/sing-box.conf"
    install -Dm644 sing-box.rules -t "$pkgdir/usr/share/polkit-1/rules.d"
    install -Dm644 sing-box-split-dns.xml "$pkgdir/usr/share/dbus-1/system.d/sing-box-split-dns.conf"
    install -Dm644 config.json -t "$pkgdir/etc/sing-box"

    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "sing-box-$pkgver-linux-${ARCH_MAP[$CARCH]}-glibc"
    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/sing-box"
    install -Dm644 <(./sing-box completion bash) "$pkgdir/usr/share/bash-completion/completions/sing-box"
    install -Dm644 <(./sing-box completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/sing-box.fish"
    install -Dm644 <(./sing-box completion zsh) "$pkgdir/usr/share/zsh/site-functions/_sing-box"
}
