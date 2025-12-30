# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubebuilder-git
_pkgname=kubebuilder
pkgdesc="SDK for building Kubernetes APIs"
pkgver=4.10.1.r99.g013481333
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('apache')
conflicts=('kubebuilder')
provides=('kubebuilder')
makedepends=(
    'go'
    'git'
)

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(
    "$_pkgname::git+https://github.com/kubernetes-sigs/kubebuilder#branch=master"
)

sha256sums=(
    "SKIP"
)

build() {
    export GOPATH="$srcdir"/gopath
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$srcdir/$_pkgname"

    go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "\
      -linkmode=external \
      -buildid='' \
      -extldflags \"${LDFLAGS}\" \
      -X sigs.k8s.io/kubebuilder/v4/cmd.kubeBuilderVersion=v${pkgver} \
      -X sigs.k8s.io/kubebuilder/v4/cmd.kubernetesVendorVersion=$(go list -m -modfile=./testdata/project-v4/go.mod -f "{{ .Version }}" k8s.io/api | awk -F'[v.]' '{printf "1.%d.%d", $$3, $$4}') \
      -X sigs.k8s.io/kubebuilder/v4/cmd.goos=$(go env GOOS) \
      -X sigs.k8s.io/kubebuilder/v4/cmd.goarch=$(go env GOARCH) \
      -X sigs.k8s.io/kubebuilder/v4/cmd.gitCommit= \
      -X sigs.k8s.io/kubebuilder/v4/cmd.buildDate=$(date -u +'%Y-%m-%dT%H:%M:%SZ')" \
    -o bin/kubebuilder
}

package() {
    install -D -m0755 "$srcdir/$_pkgname/bin/kubebuilder" "$pkgdir/usr/bin/kubebuilder"

    "${pkgdir}/usr/bin/kubebuilder" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubebuilder"
    "${pkgdir}/usr/bin/kubebuilder" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubebuilder"
}
