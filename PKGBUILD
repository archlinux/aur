# Maintainer: Jasmin <jasmin@example.com>
pkgname=promptfoo
pkgver=0.120.10
pkgrel=1
pkgdesc="Test and evaluate LLM outputs - AI red teaming, pentesting, and vulnerability scanning"
arch=('any')
url="https://github.com/promptfoo/promptfoo"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
optdepends=(
    'python: for Python providers'
    'ollama: for local Ollama models'
)
provides=('promptfoo' 'pf')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('5bf85fba31a0ef4b3363a14d549af2ea9dc5e63c4631e6398e49cdf2dea57e10')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Remove package.json references to $pkgdir
    find "${pkgdir}" -name 'package.json' -exec sed -i "s|${pkgdir}||g" {} +

    # Install license
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
