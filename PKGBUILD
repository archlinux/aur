# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubebuilder
pkgdesc="SDK for building Kubernetes APIs"
pkgver=4.8.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('apache')
makedepends=(
    'go'
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/kubernetes-sigs/kubebuilder/archive/v${pkgver}.tar.gz"
)

sha256sums=(
    "7ca72b5640eced3cc8ff97c3165c1a0d6cfac1604f62a66d1c9fd389a9d79654"
)

build() {
    export GOPATH="$srcdir"/gopath
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$srcdir/$pkgname-$pkgver"

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
    install -D -m0755 "${srcdir}/$pkgname-$pkgver/bin/kubebuilder" "${pkgdir}/usr/bin/kubebuilder"

    "${pkgdir}/usr/bin/kubebuilder" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubebuilder"
    "${pkgdir}/usr/bin/kubebuilder" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubebuilder"
}
