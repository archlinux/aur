# Maintainer: nltimv <git at nltimv dot com>
pkgname='weave-gitops-git'
pkgver=v0.33.0.r17.g9281d456b
pkgrel=1
pkgdesc='Weave GitOps is a simple open source developer platform for people who want cloud native applications, without needing Kubernetes expertise.'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url='https://github.com/weaveworks/weave-gitops'
license=('MPL2')
depends=(
    'glibc'
)
makedepends=(
    'git'
    'go>=1.20.0'
)
optdepends=(
    'helm>=3: For installation in a Kubernetes cluster'
)
provides=('gitops' 'gitops-server')
conflicts=('gitops' 'gitops-server')
source=("git+https://github.com/weaveworks/weave-gitops#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/weave-gitops"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    export GOPATH="$srcdir"/gopath

    cd "$srcdir/weave-gitops"
    echo $LDFLAGS
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"$LDFLAGS\"" -mod=readonly -modcacherw -o bin/gitops cmd/gitops/main.go
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -extldflags \"$LDFLAGS\"" -mod=readonly -modcacherw -o bin/gitops-server cmd/gitops-server/main.go
}

package() {
    cd "$srcdir/weave-gitops"

    # prevent the question about analytics from being shown during packaging
    mkdir fake_config_dir
    export XDG_CONFIG_HOME="$(pwd)/fake_config_dir"
    echo '{"analytics": false}' > "$XDG_CONFIG_HOME/weave-gitops-config.json"

    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"

    bin/gitops completion bash > "$pkgdir/usr/share/bash-completion/completions/gitops"
    bin/gitops completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/gitops.fish"
    bin/gitops completion zsh  > "$pkgdir/usr/share/zsh/site-functions/_gitops"

    install -Dm 755 bin/gitops $pkgdir/usr/bin/gitops
    install -Dm 755 bin/gitops-server $pkgdir/usr/bin/gitops-server

    go clean -modcache
}
