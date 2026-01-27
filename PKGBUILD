# Maintainer: Jason <beardcoin@protonmail.com>
pkgname=moltbot
_npmname=clawdbot
_npmver=2026.1.24-3
pkgver=2026.1.24.3
pkgrel=1
pkgdesc="Personal AI assistant supporting Claude, Ollama, and other LLMs - the lobster way"
arch=('any')
url="https://molt.bot"
license=('MIT')
depends=('nodejs>=22')
optdepends=(
    'ollama: Local LLM support'
    'chromium: Browser automation features'
)
provides=('clawdbot')
conflicts=('clawdbot')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${_npmver}.tgz")
noextract=("${_npmname}-${_npmver}.tgz")
sha256sums=('a00acd33ac20787fbd342db2bc36db15b2483f88e1f8b159cf1bc37a6eb1a828')

package() {
    npm install -g \
        --prefix "${pkgdir}/usr" \
        --cache "${srcdir}/npm-cache" \
        "${srcdir}/${_npmname}-${_npmver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +
    find "${pkgdir}/usr" -type f -exec chmod 644 {} +
    chmod 755 "${pkgdir}/usr/bin/"* 2>/dev/null || true
    find "${pkgdir}/usr/lib/node_modules/${_npmname}" -name "*.js" -path "*/bin/*" -exec chmod 755 {} + 2>/dev/null || true

    # Create moltbot symlink (new name points to old binary)
    ln -sf clawdbot "${pkgdir}/usr/bin/moltbot"

    # License
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    if [[ -f "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" ]]; then
        ln -s "/usr/lib/node_modules/${_npmname}/LICENSE" \
            "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
