# Maintainer: Hristo Voyvodov <hristo.voyvodov@gmail.com>
pkgname=nsc
pkgver=2.15.1
pkgrel=2
pkgdesc="A tool for creating NATS account and user access configurations"
arch=(x86_64)
url="https://github.com/nats-io/nsc"
license=('Apache-2.0')
depends=(glibc)
makedepends=(git go)
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('e3c3a88183e0ed9098a699dbc51b87c8d68cc71afc64a5d71d8bcc622d192793')

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # disable self-updates
    sed -i 's|github = "nats-io/nsc"|github = ""|' cmd/defaults.go

    go build -ldflags="-X main.version=${pkgver}" .

    # shell completions (nsc creates its config dir on first run, keep it in $srcdir)
    local sh
    for sh in bash zsh fish; do
        HOME="$srcdir/home" XDG_CONFIG_HOME="$srcdir/home/.config" XDG_DATA_HOME="$srcdir/home/.local/share" \
            ./nsc completion "$sh" > "nsc.$sh"
    done
}

package() {
    cd "$pkgname"
    install -Dm755 ./$pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 nsc.bash "$pkgdir"/usr/share/bash-completion/completions/nsc
    install -Dm644 nsc.zsh  "$pkgdir"/usr/share/zsh/site-functions/_nsc
    install -Dm644 nsc.fish "$pkgdir"/usr/share/fish/vendor_completions.d/nsc.fish
}
