# Maintainer: cihan shibne123@gmail.com
pkgname=deadlock-server-picker
pkgver=1.3.5
pkgrel=1
pkgdesc="A native Linux tool to block/unblock Deadlock game server relays using iptables"
arch=('any')
url="https://github.com/shibne/DeadlockServerPicker-linux"
license=('GPL-3.0-only')
depends=('python' 'python-rich' 'iptables')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=(
    'nftables: alternative firewall backend (modern replacement for iptables)'
    'bash-completion: for bash shell completions'
    'fish: for fish shell completions'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ef2169c08a5da083e74f5f1f65d59b09c18bf6e279d2cebcb28ab74836b7a0c1')

build() {
    cd "${srcdir}/DeadlockServerPicker-linux-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/DeadlockServerPicker-linux-${pkgver}"
    
    # Install the Python package
    python -m installer --destdir="${pkgdir}" dist/*.whl
    
    # Install shell completions
    install -Dm644 completions/deadlock-server-picker.bash \
        "${pkgdir}/usr/share/bash-completion/completions/deadlock-server-picker"
    install -Dm644 completions/deadlock-server-picker.bash \
        "${pkgdir}/usr/share/bash-completion/completions/dsp"
    
    install -Dm644 completions/deadlock-server-picker.zsh \
        "${pkgdir}/usr/share/zsh/site-functions/_deadlock-server-picker"
    install -Dm644 completions/deadlock-server-picker.zsh \
        "${pkgdir}/usr/share/zsh/site-functions/_dsp"
    
    install -Dm644 completions/deadlock-server-picker.fish \
        "${pkgdir}/usr/share/fish/vendor_completions.d/deadlock-server-picker.fish"
    install -Dm644 completions/deadlock-server-picker.fish \
        "${pkgdir}/usr/share/fish/vendor_completions.d/dsp.fish"
    
    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install systemd service files
    install -Dm644 systemd/deadlock-server-picker.service \
        "${pkgdir}/usr/lib/systemd/system/deadlock-server-picker.service"
    install -Dm644 systemd/deadlock-server-picker.user.service \
        "${pkgdir}/usr/lib/systemd/user/deadlock-server-picker.service"
}
