# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: oss@fastly.com

## GPG key: https://github.com/web-flow.gpg
## GPG key: https://github.com/rcaril.gpg

pkgname=fastly
pkgver=16.0.0
pkgrel=1
pkgdesc='CLI for the Fastly platform'
url='https://github.com/fastly/cli'
arch=(aarch64 i686 x86_64)
license=(Apache-2.0)
depends=(glibc)
makedepends=(git go tomlq)
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('98975e70467d135043ca17dedead8161f64a359146f876b29352537f82f881cb')
validpgpkeys=('A4C2C78656BA5E3DD5F122E4BCE379A5D550C407' ## Mark McDonnell (Integralist)
              '91CDBA857A8A0DE3940FDD90870BC2D54402CD1D' ## Anthony Gomez
              'ABB6449EDF2309D2E2922C695CB9C3D735851098' ## Richard Carillo
              '5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23') ## GitHub

prepare() {
    export GOPATH="$srcdir"
    cd "$pkgname"
    go mod download -modcacherw
    sed -i '/CGO_ENABLED=/s/0/1/g' Makefile
}

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname"
    make build \
        VERSION="$pkgver" \
        CLI_ENV="production" \
        GORELEASER_ARGS="--rm-dist --single-target" \
        GO_ARGS="${GOFLAGS}"
    ./fastly --completion-script-bash > fastly.bash
    ./fastly --completion-script-zsh > _fastly
}

check() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    cd "$pkgname"
    go test ./...
}

package() {
    cd "$pkgname"
    install -Dv fastly -t "$pkgdir/usr/bin/"
    install -Dvm644 fastly.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dvm644 _fastly -t "$pkgdir/usr/share/zsh/site-functions/"
}
