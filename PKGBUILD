# Maintainer: Manish Khadka <manish.khadka@tutanota.com>

pkgname=kubectl-ate
pkgver=1.0.0
pkgrel=1
pkgdesc='kubectl plugin for Agent Substrate, the Kubernetes platform for running AI agents'
arch=('x86_64' 'aarch64')
url='https://github.com/agent-substrate/substrate'
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('kubectl: run it as `kubectl ate`')
source=("substrate-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3609d5dfbba49cec2a5e74addd84f9e619b0d36f6abc2cb17b5a630d47c80be')

build() {
    # internal/version drops a stamped Version unless Commit is stamped too. The tag's
    # commit is recorded in the archive (git archive), and its files carry the commit time.
    local _commit _date
    _commit=$(gzip -dc "substrate-$pkgver.tar.gz" | git get-tar-commit-id)
    _date=$(date -u -d "@$(stat -c %Y "substrate-$pkgver/go.mod")" +%Y-%m-%dT%H:%M:%SZ)
    [[ $_commit =~ ^[0-9a-f]{40}$ ]] || { error 'no commit id in the source archive'; return 1; }

    cd "substrate-$pkgver"
    export CGO_CPPFLAGS="$CPPFLAGS" CGO_CFLAGS="$CFLAGS" CGO_CXXFLAGS="$CXXFLAGS" CGO_LDFLAGS="$LDFLAGS"
    # vendor/ is in the tarball, so the build needs no network.
    export GOFLAGS='-buildmode=pie -trimpath -buildvcs=false -mod=vendor'
    local _v=go.ate.dev/substrate/internal/version
    go build -ldflags "-linkmode=external -X $_v.Version=v$pkgver -X $_v.Commit=$_commit -X $_v.BuildDate=$_date" \
        -o kubectl-ate ./cmd/kubectl-ate

    local _sh
    for _sh in bash zsh fish; do
        ./kubectl-ate completion "$_sh" > "completion.$_sh"
    done
}

package() {
    cd "substrate-$pkgver"
    install -Dm755 kubectl-ate "$pkgdir/usr/bin/kubectl-ate"
    install -Dm644 completion.bash "$pkgdir/usr/share/bash-completion/completions/kubectl-ate"
    install -Dm644 completion.zsh "$pkgdir/usr/share/zsh/site-functions/_kubectl-ate"
    install -Dm644 completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/kubectl-ate.fish"
}
