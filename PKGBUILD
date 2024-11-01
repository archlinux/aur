pkgname=mox
pkgver=0.0.12
pkgrel=1
pkgdesc="Modern full-featured open source secure mail server for low-maintenance self-hosted email"
arch=('x86_64')
url="https://www.xmox.nl/"
license=('MIT')
makedepends=('go' 'npm')
source=("https://github.com/mjl-/mox/archive/refs/tags/v$pkgver.tar.gz"
        "mox.service"
        "mox.tmpfiles"
        "mox.sysusers")
sha256sums=('432fb5d4d7122fc67c9ad272a306ffe38cfbfa0364be286aca7ffe72299fd721'
            '4b4e4567346b8ad749b05b38f350a125fc00f3d915abdc5e05505d2f7c6060f3'
            'ec22b364c8b1e5991793ab42fb7228a0926bfaa85d4930959beb88ff23853e1e'
            '2b717fd42c67545897dce77e7ec614c6842ba5ea070ce519c7efe55e35c8e25d')
backup=(etc/mox/mox.conf)

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}"
    make build
}

package() {
    install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm644 "$pkgname.service"  "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 "LICENSE.MIT"       "$pkgdir/usr/share/licences/$pkgname/LICENSE"
}
