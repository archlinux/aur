# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=k3k
pkgver=1.1.0
pkgrel=1
pkgdesc='Kubernetes in Kubernetes - CLI tool for creating and managing K3s clusters within Kubernetes'
arch=('x86_64' 'aarch64')
url='https://github.com/rancher/k3k'
license=('Apache-2.0')
makedepends=('go')
provides=('k3k')
conflicts=('k3k-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rancher/k3k/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8ef1ea06300e18fe48a217b12144f28f1a168c3d356261fc3d75a53d8087bb7d')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    export GOFLAGS='-trimpath -mod=readonly -modcacherw'
    go build \
        -ldflags="-w -s -X github.com/rancher/k3k/pkg/buildinfo.Version=v${pkgver}" \
        -o k3kcli ./cli
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 k3kcli "${pkgdir}/usr/bin/k3kcli"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # dummy kubeconfig for completion generation (k3kcli requires valid config)
    local _kubeconfig="${srcdir}/.kubeconfig"
    cat > "${_kubeconfig}" <<-EOF
	apiVersion: v1
	kind: Config
	clusters:
	- cluster:
	    server: https://localhost:6443
	  name: dummy
	contexts:
	- context:
	    cluster: dummy
	    user: dummy
	  name: dummy
	current-context: dummy
	users:
	- name: dummy
	  user: {}
	EOF

    # shell completions
    ./k3kcli --kubeconfig "${_kubeconfig}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/k3kcli"
    ./k3kcli --kubeconfig "${_kubeconfig}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_k3kcli"
    ./k3kcli --kubeconfig "${_kubeconfig}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/k3kcli.fish"
}
