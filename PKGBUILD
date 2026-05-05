# Maintainer: RandomChugokujin <randomchugokujin@tutamail.com>
pkgname=bloodyad
pkgver=2.5.4
pkgrel=1
pkgdesc="Active Directory privilege escalation swiss army knife"
arch=('any')
url="https://github.com/CravateRouge/bloodyAD"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-hatchling' 'python-pip')
optdepends=('krb5: For Kerberos authentication')
provides=('bloodyad')
conflicts=('bloodyad')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CravateRouge/bloodyAD/archive/v${pkgver}.tar.gz")
sha256sums=('2c04f013963a616ef21bee964b7c5c641b0d2c3ae51be6d65a7485bc4b5e4513')

_venv_dir="/opt/bloodyad/venv"

build() {
    cd "${srcdir}/bloodyAD-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/bloodyAD-${pkgver}"

    # Create virtual environment in package root
    python -m venv "${pkgdir}${_venv_dir}"

    # Upgrade pip/setuptools in venv
    "${pkgdir}${_venv_dir}/bin/pip" install --upgrade pip setuptools wheel

    # Install bloodyAD and all dependencies into venv
    "${pkgdir}${_venv_dir}/bin/pip" install dist/*.whl

    # Create wrapper script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bloodyad" << 'EOF'
#!/bin/bash
exec /opt/bloodyad/venv/bin/bloodyad "$@"
EOF

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bloodyAD" << 'EOF'
#!/bin/bash
exec /opt/bloodyad/venv/bin/bloodyAD "$@"
EOF

    # Install license and docs
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
