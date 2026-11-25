# Maintainer: czyt <czytcn@gmail.com>
pkgname=noop
pkgver=1.0.10
pkgrel=1
pkgdesc="Your own AI team: Claude Code and Codex agents that run on your own machines and only ask when they really need you"
arch=('any')
url="https://huacnlee.github.io/noop/"
license=('MIT')
depends=('bash' 'bun')
optdepends=('claude-code: run the agents with Claude Code'
            'codex: run the agents with Codex'
            'github-cli: let the agents work on GitHub'
            'git: keep a local copy of the code the agents change')

# The machine side is the program of the repository, run with bun. The release
# carries the web client that the machine serves to the browsers.
source=("noop-${pkgver}.tar.gz::https://github.com/huacnlee/noop/archive/refs/tags/v${pkgver}.tar.gz"
        "noop-web-${pkgver}.tar.gz::https://github.com/huacnlee/noop/releases/download/v${pkgver}/noop-web.tar.gz")
# The web client is unpacked into the package, not into the build directory.
noextract=("noop-web-${pkgver}.tar.gz")
sha256sums=('01f2212a26b89b14200cb7e7221636d53a250680e80ab38798febc8af2ac09c8'
            '2911b1211b60eb192083ab29891453af84aa381d9958ddc04ec40f247a326108')

package() {
    # The program finds its own code around the file it runs, so the tree is
    # installed as it is.
    install -d "${pkgdir}/usr/lib/noop"
    cp -a "${srcdir}/noop-${pkgver}/src" "${srcdir}/noop-${pkgver}/cloud" \
          "${srcdir}/noop-${pkgver}/templates" "${srcdir}/noop-${pkgver}/presets" \
          "${srcdir}/noop-${pkgver}/web" "${pkgdir}/usr/lib/noop/"

    # The web client of the release is served by the machine itself.
    install -d "${pkgdir}/usr/lib/noop/app/dist/web/noop"
    tar --no-same-owner -xzf "${srcdir}/noop-web-${pkgver}.tar.gz" \
        -C "${pkgdir}/usr/lib/noop/app/dist/web/noop"
    # The program remembers which release the web client came from, so it does
    # not try to fetch it again while the version is the current one.
    sha256sum "${srcdir}/noop-web-${pkgver}.tar.gz" | cut -d' ' -f1 \
        > "${pkgdir}/usr/lib/noop/app/dist/web/.release"

    # The machine reads the list of MCP servers from the client app.
    install -Dm644 "${srcdir}/noop-${pkgver}/app/mcp-servers.ts" \
        "${pkgdir}/usr/lib/noop/app/mcp-servers.ts"

    install -Dm644 "${srcdir}/noop-${pkgver}/package.json" \
        "${pkgdir}/usr/lib/noop/package.json"
    install -Dm644 "${srcdir}/noop-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # The commands follow the installer of the upstream project.
    install -Dm755 "${srcdir}/noop-${pkgver}/bin/noop" "${pkgdir}/usr/lib/noop/bin/noop"
    install -Dm755 "${srcdir}/noop-${pkgver}/bin/hub" "${pkgdir}/usr/lib/noop/bin/hub"
    install -d "${pkgdir}/usr/bin"
    ln -s /usr/lib/noop/bin/noop "${pkgdir}/usr/bin/noop"
    ln -s /usr/lib/noop/bin/hub "${pkgdir}/usr/bin/hub"
}
