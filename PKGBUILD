# Maintainer: enihcam <enihcam@noreply.gitcode.com>
pkgname=openjiuwen-web
pkgver=0.1.8
pkgrel=1
pkgdesc="OpenJiuwen Studio frontend: React + Vite SPA, served as static files via nginx"
arch=('x86_64')
url="https://gitcode.com/openJiuwen/agent-studio"
license=('Apache-2.0' 'LicenseRef-HarmonyOS-Sans-Fonts-1.0')
depends=('nginx')
makedepends=('nodejs' 'npm' 'git')
optdepends=(
    'openjiuwen-server: backend API at /api'
    'nginx-mainline: server with HTTP/2 + Brotli; the stock nginx is also fine'
)
# gitcode.com's archive URL returns SPA HTML (no real tarball endpoint exposed),
# so we use git+https:// directly. Anonymous clone is supported.
source=(
    "git+https://gitcode.com/openJiuwen/agent-studio.git#tag=v${pkgver}"
    "openjiuwen-web.nginx.conf"
    "HarmonyOS-Sans-Fonts.LICENSE"
)
sha256sums=(
    'SKIP'
    'SKIP'  # local file, versioned with PKGBUILD
    'SKIP'
)
# makepkg extracts git sources to ${srcdir}/agent-studio/ (basename, no version suffix)
_srcdir_repo=agent-studio

# The frontend has no package-lock.json shipped in the tag,
# so we use `npm install` (not `npm ci`).
# The build needs an expanded Node heap — match the upstream command.
export NODE_OPTIONS='--max-old-space-size=8192 --max-semi-space-size=256'

# Upstream bug: @assistant-ui/core@0.1.17 imports `tapClientLookup`,
# but @assistant-ui/store@0.2.14+ renamed it to `useClientLookup`.
# Pin store to the last good version (0.2.13) via npm overrides.
prepare() {
    local pkg="${srcdir}/${_srcdir_repo}/frontend/package.json"
    jq '.overrides = (.overrides // {}) + {"@assistant-ui/store": "0.2.13"}' \
        "${pkg}" > "${pkg}.tmp" && mv "${pkg}.tmp" "${pkg}"
}

build() {
    cd "${srcdir}/${_srcdir_repo}/frontend"

    # Install dependencies (resolves npm workspaces too)
    npm install --no-audit --no-fund --prefer-offline

    # Production build — produces dist/
    npm run build
}

package() {
    cd "${srcdir}/${_srcdir_repo}/frontend"

    # Install built SPA to FHS-compliant webapps path
    install -dm755 "${pkgdir}/usr/share/webapps/openjiuwen"
    cp -a dist/. "${pkgdir}/usr/share/webapps/openjiuwen/"

    # nginx sample config — user copies to /etc/nginx/sites-available/
    install -Dm644 "${srcdir}/openjiuwen-web.nginx.conf" \
        "${pkgdir}/etc/nginx/sites-available/openjiuwen-web.conf.example"

    # Licenses
    install -Dm644 "${srcdir}/${_srcdir_repo}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/HarmonyOS-Sans-Fonts.LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/HarmonyOS-Sans-Fonts.LICENSE"
}