pkgname=bloodyad
pkgver=2.5.7
pkgrel=2
pkgdesc="Active Directory privilege escalation swiss army knife"
arch=('x86_64')
url="https://github.com/CravateRouge/bloodyAD"
license=('MIT')

depends=('python')
makedepends=('python-build' 'python-pip' 'python-hatchling')

optdepends=('krb5: For Kerberos authentication')

provides=('bloodyad')
conflicts=('bloodyad')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/CravateRouge/bloodyAD/archive/v${pkgver}.tar.gz")
sha256sums=('3d33e20ce3e21002709ccbf33d007af359a7eb6bf9c6d1c516eaf877ee97f319')

_pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
_pkgroot="/opt/bloodyad"
_pylib="${_pkgroot}/lib/python${_pyver}/site-packages"

# Explicit dependency list from pyproject.toml
_deps=(
  "cryptography==44.0.2"
  "badldap>=0.7.7"
  "winacl==0.1.9"
  "asn1crypto==1.5.1"
  "kerbad>=0.5.12"
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

    # Remove build-location metadata embedded by pip for the local wheel
    rm -f "${pkgdir}${_pylib}/bloodyad-${pkgver}.dist-info/direct_url.json"

    # Wrapper using real entrypoint
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bloodyad" << EOF
#!/bin/bash
# Use only the package's vendored Python dependencies, not system site-packages.
export PYTHONPATH="${_pylib}"
exec python -S -W ignore::SyntaxWarning -c "from bloodyAD.main import main; main()" "\$@"
EOF

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/bloodyAD" << EOF
#!/bin/bash
export PYTHONPATH="${_pylib}"
exec python -S -W ignore::SyntaxWarning -c "from bloodyAD.main import main; main()" "\$@"
EOF

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
