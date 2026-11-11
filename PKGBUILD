# Maintainer: mmh <aur@with-h.at>

pkgname=('ignition' 'ignition-validate')
pkgbase=ignition
pkgver=2.28.0
pkgrel=1
pkgdesc='First boot installer and configuration tool'
arch=('x86_64')
url='https://coreos.github.io/ignition/'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("https://github.com/coreos/ignition/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a2ff1a2aafc1a54fedd535487c4b0cf2afad5945a788edfb85140420a1f772de')

prepare() {
    cd "$pkgname-$pkgver"

    mkdir -p bin/
}

build() {
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o bin/ignition ./internal
    go build -o bin/ignition-validate ./validate
}

check() {
    cd "$pkgname-$pkgver"

    local -a PKGS=($(go list ./... | grep -v -e internal/log -e vendor))
    go vet "${PKGS[@]}"

    local -a PKGS=($(go list ./... | grep -v -e tests -e vendor))
    go test -timeout 60s -cover "${PKGS[@]}"
}

package_ignition() {
    depends+=('libgcc' 'util-linux-libs' 'dracut')

    cd "$pkgbase-$pkgver"

    install -m 0644 -D -t "$pkgdir/usr/lib/dracut/modules.d/30ignition" \
        dracut/30ignition/*.{conf,rules,service,target}

    install -m 0755 -D -t "$pkgdir/usr/lib/dracut/modules.d/30ignition" \
        bin/ignition \
        dracut/30ignition/*.sh \
        dracut/30ignition/*-generator
}

package_ignition-validate() {
    pkgdesc='Configuration validation tool for Ignition'

    cd "$pkgbase-$pkgver"

    install -m 0755 -D -t "$pkgdir/usr/bin" \
        bin/ignition-validate
}
