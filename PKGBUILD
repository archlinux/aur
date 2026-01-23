# Maintainer: Guru <anjanaya@gmail.com>
pkgname=ralph-tui
pkgver=0.4.0
pkgrel=1
pkgdesc="AI Agent Loop Orchestrator - terminal UI for automating task completion with AI coding agents"
arch=('any')
url="https://github.com/subsy/ralph-tui"
license=('MIT')
depends=('bun')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('0a44a6fc31d590171cafb88fad0ec6501e4ea9241cad8ab4e3e57ad8b1eb36cd')
noextract=("${pkgname}-${pkgver}.tgz")

prepare() {
    cd "${srcdir}"
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}.tgz" -C "${pkgname}-${pkgver}" --strip-components=1
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    bun install --production
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Install to /usr/lib/ralph-tui
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    cp -r . "${pkgdir}/usr/lib/${pkgname}"

    # Create wrapper script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/${pkgname}" << 'EOF'
#!/bin/sh
exec bun run /usr/lib/ralph-tui/dist/cli.js "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/${pkgname}"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
