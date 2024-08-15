# Maintainer: ml <ml-aur@ransomware.download>
pkgname=kind
pkgver=0.24.0
pkgrel=1
pkgdesc='Kubernetes IN Docker - local clusters for testing Kubernetes'
arch=('aarch64' 'x86_64')
url='https://kind.sigs.k8s.io/'
license=('Apache-2.0')
depends=('glibc' 'kubectl')
makedepends=('go' 'git')
optdepends=(
    'docker: docker node provider'
    'podman: podman node provider'
    'nerdctl: nerdctl node provider'
)
install=kind.install
source=("https://github.com/kubernetes-sigs/kind/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
    modules-load.conf
    registry-aliases.conf)
sha256sums=('eb7bcb8005ff980d7d7ad088165a5a6236f484444aa397520cd98cb046e1d797'
            '87bc2d0263e7393c66d540375efa9b68f2e3fdd72d5b12688587e0c3d6b99d88'
            '82b71230a61f9b1f5072c841bb637aac200272a9cbbddcfc6fd01c308dbb5923')

build() {
    local _commit
    _commit="$(bsdcat "$pkgname-$pkgver.tar.gz" | git get-tar-commit-id)"
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=1
    export CGO_CFLAGS="$CFLAGS"
    export CGO_CPPFLAGS="$CPPFLAGS"
    export CGO_CXXFLAGS="$CXXFLAGS"
    export CGO_LDFLAGS="$LDFLAGS"
    export GOFLAGS='-buildmode=pie -modcacherw -trimpath'

    go build -o "$pkgname" -ldflags="-buildid= -linkmode=external \
    -X sigs.k8s.io/kind/pkg/cmd/kind/version.GitCommit=$_commit"

    ./"$pkgname" completion bash >completion.bash
    ./"$pkgname" completion fish >completion.fish
    ./"$pkgname" completion zsh >completion.zsh
}

package() {
    install -Dm644 modules-load.conf "$pkgdir"/etc/modules-load.d/kind.conf
    install -Dm644 registry-aliases.conf "$pkgdir"/etc/containers/registries.conf.d/kind.conf

    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" -t "$pkgdir"/usr/bin
    install -Dm644 completion.bash "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
    install -Dm644 completion.fish "$pkgdir"/usr/share/fish/vendor_completions.d/"$pkgname".fish
    install -Dm644 completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
}
