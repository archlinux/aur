pkgname=bloodyad
pkgver=2.5.4
pkgrel=2
pkgdesc="Active Directory privilege escalation swiss army knife"
arch=('x86_64')
url="https://github.com/CravateRouge/bloodyAD"
license=('MIT')

depends=('python')
makedepends=('python-build' 'python-pip')

optdepends=('krb5: For Kerberos authentication')

provides=('bloodyad')
conflicts=('bloodyad')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CravateRouge/bloodyAD/archive/v${pkgver}.tar.gz")
sha256sums=('2c04f013963a616ef21bee964b7c5c641b0d2c3ae51be6d65a7485bc4b5e4513')

_pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
_pkgroot="/opt/bloodyad"
_pylib="${_pkgroot}/lib/python${_pyver}/site-packages"

# Explicit dependency list from pyproject.toml
_deps=(
  "cryptography==44.0.2"
  "badldap>=0.7.5"
  "winacl==0.1.9"
  "asn1crypto==1.5.1"
  "kerbad>=0.5.10"
)

build() {
    cd "${srcdir}/bloodyAD-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/bloodyAD-${pkgver}"

    install -d "${pkgdir}${_pylib}"

    # Install dependencies first
    python -m pip install \
        --target="${pkgdir}${_pylib}" \
        --no-compile \
        "${_deps[@]}"

    # Install the built wheel (no deps)
    python -m pip install \
        --target="${pkgdir}${_pylib}" \
        --no-deps \
        --no-compile \
        dist/*.whl

    # Wrapper using real entrypoint
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bloodyad" << EOF
#!/bin/bash
export PYTHONPATH="${_pylib}:\$PYTHONPATH"
export PYTHONWARNINGS="ignore::SyntaxWarning"
exec python -c "from bloodyAD.main import main; main()" "\$@"
EOF

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bloodyAD" << EOF
#!/bin/bash
export PYTHONPATH="${_pylib}:\$PYTHONPATH"
export PYTHONWARNINGS="ignore::SyntaxWarning"
exec python -c "from bloodyAD.main import main; main()" "\$@"
EOF

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
