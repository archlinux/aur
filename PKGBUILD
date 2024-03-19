pkgname=mox
pkgver=0.0.10
pkgrel=2
pkgdesc="Modern full-featured open source secure mail server for low-maintenance self-hosted email"
arch=('x86_64')
url="https://www.xmox.nl/"
license=('MIT')
makedepends=('go')
source=("https://github.com/mjl-/mox/archive/refs/tags/v$pkgver.tar.gz"
        "mox.service"
        "mox.tmpfiles"
        "mox.sysusers")
sha256sums=('9a3926fda44ba05402623505346016edcaf24a9b49095897711c8e6bbd807035'
            '4b4e4567346b8ad749b05b38f350a125fc00f3d915abdc5e05505d2f7c6060f3'
            'ec22b364c8b1e5991793ab42fb7228a0926bfaa85d4930959beb88ff23853e1e'
            '2b717fd42c67545897dce77e7ec614c6842ba5ea070ce519c7efe55e35c8e25d')
backup=(etc/mox/mox.conf)

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build
    go vet ./...
    go vet -tags integration
    unset GOFLAGS
    ./gendoc.sh
    (cd webadmin && go run ../vendor/github.com/mjl-/sherpadoc/cmd/sherpadoc/*.go -adjust-function-names none Admin) >webadmin/adminapi.json
    (cd webaccount && go run ../vendor/github.com/mjl-/sherpadoc/cmd/sherpadoc/*.go -adjust-function-names none Account) >webaccount/accountapi.json
    (cd webmail && go run ../vendor/github.com/mjl-/sherpadoc/cmd/sherpadoc/*.go -adjust-function-names none Webmail) >webmail/api.json
    go run vendor/github.com/mjl-/sherpats/cmd/sherpats/main.go -bytes-to-string -slices-nullable -maps-nullable -nullable-optional -namespace api api <webmail/api.json >webmail/api.ts
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build
}

package() {
    install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
    install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -Dm644 "$pkgname.service"  "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 "LICENSE.MIT"       "$pkgdir/usr/share/licences/$pkgname/LICENSE"
}
