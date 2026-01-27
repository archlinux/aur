# Maintainer: JBeard <beardcoin@protonmail.com>
pkgname=clawdbot
_npmver=2026.1.24-3
pkgver=2026.1.24.3
pkgrel=1
pkgdesc="Personal AI assistant supporting Claude, Ollama, and other LLMs - the lobster way 🦞"
arch=('any')
url="https://github.com/clawdbot/clawdbot"
license=('MIT')
depends=('nodejs>=22')
optdepends=(
    'ollama: Local LLM support'
    'chromium: Browser automation features'
)
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${_npmver}.tgz")
noextract=("${pkgname}-${_npmver}.tgz")
sha256sums=('a00acd33ac20787fbd342db2bc36db15b2483f88e1f8b159cf1bc37a6eb1a828')

package() {
    # Install using npm to a prefix
    npm install -g \
        --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" \
        "${srcdir}/${pkgname}-${_npmver}.tgz"

    # Fix permissions (npm installs as root with weird perms)
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    find "${pkgdir}/usr" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/usr/bin/"* 2>/dev/null || true

    # Make node files executable
    find "${pkgdir}/usr/lib/node_modules/${pkgname}" -name "*.js" -path "*/bin/*" -exec chmod 755 {} + 2>/dev/null || true

    # Install license from the package
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    if [[ -f "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" ]]; then
        ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
