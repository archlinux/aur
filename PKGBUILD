# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=k3k-bin
pkgver=1.2.0
pkgrel=2
pkgdesc='Kubernetes in Kubernetes - CLI tool for creating and managing K3s clusters within Kubernetes'
arch=('x86_64' 'aarch64')
url='https://github.com/rancher/k3k'
license=('Apache-2.0')
provides=('k3k')
conflicts=('k3k')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/rancher/k3k/v${pkgver}/LICENSE"
        "README.md-${pkgver}::https://raw.githubusercontent.com/rancher/k3k/v${pkgver}/README.md")
source_x86_64=("${pkgname}-${pkgver}::https://github.com/rancher/k3k/releases/download/v${pkgver}/k3kcli-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}::https://github.com/rancher/k3k/releases/download/v${pkgver}/k3kcli-linux-arm64")
sha256sums=('c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4'
            '0c3537aa7e6baad00fa0c20c5a053dc295472a8813eaa0866db53a601bf70797')
sha256sums_x86_64=('35a95255ab10cdd688e00527092d30a68b709bba1ba70903c07885fae4015f4c')
sha256sums_aarch64=('04efce0968e7e7fd61f06e5f0f1aa15eed5cdda1fca6a71e1995baa6e1f88ea6')

package() {
    install -Dm755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/k3kcli"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

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
