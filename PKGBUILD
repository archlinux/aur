# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=ddns-go
pkgname=cubic-$_pkgname
pkgver=1.3.0
pkgrel=1
pkgdesc="Over-engineered DDNS service with native OS integrations for managing A, AAAA, and HTTPS records"
arch=('x86_64' 'aarch64')
url="https://github.com/database64128/$_pkgname"
license=('GPL-3.0-or-later')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname")
backup=("etc/$_pkgname/config.json")
source=("$_pkgname::git+$url.git#tag=v$pkgver?signed")
b2sums=('751c6b9069bda21ed9f1f5928cb633bcd45225a0bb0de7201086fd2344b4ba44b0826af81ac7021dd87dce345f5183d1a350be49caff7f26de618e0804170179')
validpgpkeys=(
    '4DCED15E346E2923B931D6F71CA27546BEDB8B01' # Ian Chen (database64128) <free122448@hotmail.com>
)

build() {
    cd $_pkgname
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -ldflags='-s -w -linkmode=external' ./cmd/$_pkgname
}

package() {
    cd $_pkgname
    install -Dm644 docs/$_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
    install -Dm644 docs/$_pkgname@.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
    install -d "$pkgdir"/etc/$_pkgname
    install -Dm644 docs/config.json "$pkgdir"/etc/$_pkgname/config.json
    install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
