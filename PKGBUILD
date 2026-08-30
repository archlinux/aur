# Maintainer: Amit Padhan <amitpadhan525@gmail.com>
pkgname=linux-eye-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight real-time Linux security and endpoint detection monitor (EDR)"
arch=('any')
url="https://github.com/amitpadhan525/linux-eye"
license=('MIT')
depends=('python' 'python-yaml' 'python-psutil' 'python-inotify-simple' 'python-pyudev' 'systemd')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
provides=('linux-eye')
conflicts=('linux-eye')
source=("git+https://github.com/amitpadhan525/linux-eye.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/linux-eye"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "1.0.0"
}

build() {
    cd "${srcdir}/linux-eye"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/linux-eye"
    python -m installer --destdir="${pkgdir}" dist/*.whl

    # Install configuration to /etc/linux-eye
    install -Dm644 config/config.yaml "${pkgdir}/etc/linux-eye/config.yaml"

    # Install systemd service
    install -Dm644 systemd/linux-eye.service "${pkgdir}/usr/lib/systemd/system/linux-eye.service"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
