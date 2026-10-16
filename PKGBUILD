# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="paulrobello"
pkgname="parllama"
pkgver=0.10.1
pkgrel=1
pkgdesc="TUI for Ollama and other LLM providers"

license=('MIT')
arch=('any')

_url_github="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}")
makedepends=('python' 'uv')
depends=('python')

source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/v${pkgver}.tar.gz")
sha256sums=('e54804ffb8b15b877ac7906e5fdbacdfa489680928f6096f23fd6ac1f0e246a9')

package() {
    cd "${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/${pkgname}"
    uv venv --python python3 "${pkgdir}/opt/${pkgname}/venv"
    uv pip install --python "${pkgdir}/opt/${pkgname}/venv/bin/python" .

    find "${pkgdir}/opt/${pkgname}/venv/bin/" -type f -exec sed -e 's|#!.*/python|#!/opt/parllama/venv/bin/python\n|g' -i {} \+

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<EOF
#!/usr/bin/sh

exec /opt/${pkgname}/venv/bin/python -m ${pkgname} "\$@"
EOF

    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
