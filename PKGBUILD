# Maintainer: bbj <benigno at duck dot com>
pkgname=k3k-bin
pkgver=1.0.2
pkgrel=1
pkgdesc='Kubernetes in Kubernetes - CLI tool for creating and managing K3s clusters within Kubernetes'
arch=('x86_64' 'aarch64')
url='https://github.com/rancher/k3k'
license=('Apache-2.0')
provides=('k3k')
conflicts=('k3k')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/rancher/k3k/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}::https://github.com/rancher/k3k/releases/download/v${pkgver}/k3kcli-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/rancher/k3k/releases/download/v${pkgver}/k3kcli-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('3a2404e7782505ed52e4a6410dbfc1d457d8b8d70697278079937e062b0f7984')
sha256sums_aarch64=('3a588ee2ad81dea6f9ca725a3fb1cd1764527679a77bff0e4ecb9691df6ddf46')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/k3kcli"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

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
    "${pkgdir}/usr/bin/k3kcli" --kubeconfig "${_kubeconfig}" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/k3kcli"
    "${pkgdir}/usr/bin/k3kcli" --kubeconfig "${_kubeconfig}" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_k3kcli"
    "${pkgdir}/usr/bin/k3kcli" --kubeconfig "${_kubeconfig}" completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/k3kcli.fish"
}
