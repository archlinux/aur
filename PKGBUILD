# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgauthor="paulrobello"
pkgname="parllama"
pkgver=0.9.2
pkgrel=1
pkgdesc="TUI for Ollama and other LLM providers"

license=('MIT')
arch=('any')

_url_github="https://github.com/${pkgauthor}/${pkgname}"

provides=("${pkgname}")
makedepends=('python' 'uv')
depends=('python')

source=("${pkgname}-${pkgver}.tar.gz::${_url_github}/archive/v${pkgver}.tar.gz")
sha256sums=('2c2bb92eff73db90a658cb18c5d9138fc944f6edee332ac1263d8ffde8463de2')

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
