# Maintainer: Guru <anjanaya@gmail.com>
pkgname=agent-browser
pkgver=0.45.0
pkgrel=1
pkgdesc="Headless browser automation CLI for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/vercel-labs/agent-browser"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm' 'jq')
options=('!debug')
# Since 0.45.0 the native CLI ships as a per-platform npm package, not inside the main tarball
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
source_x86_64=("${pkgname}-native-${pkgver}-x86_64.tgz::https://registry.npmjs.org/@agent-browser/cli-linux-x64-gnu/-/cli-linux-x64-gnu-${pkgver}.tgz")
source_aarch64=("${pkgname}-native-${pkgver}-aarch64.tgz::https://registry.npmjs.org/@agent-browser/cli-linux-arm64-gnu/-/cli-linux-arm64-gnu-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('81dc341752891b7e47c0c58226a9ecfe563066c5e69fed1628f1e01bc9b789c1')
sha256sums_x86_64=('6f94b49e3393e41d4c7355dca461d0d650addbf3adcc1ddca8a9af335ebe04f6')
sha256sums_aarch64=('ae36beee3d602231fcb910f66989e4b7c27fe1a5f8455bd2191929fc47606f13')

package() {
    # --offline: the native binary comes from the per-arch source above; npm then skips the
    # unfetchable optional platform package (--omit=optional is ignored for -g on npm 12)
    /usr/bin/npm install -g --ignore-scripts --offline --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Fix permissions
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # Native binary under the bin/ name the launcher tries first (scripts/native.js)
    local _arch=x64
    [[ ${CARCH} == aarch64 ]] && _arch=arm64
    install -Dm755 "${srcdir}/package/bin/agent-browser" "${pkgdir}/usr/lib/node_modules/${pkgname}/bin/agent-browser-linux-${_arch}"
    # Link the command straight to it, as the launcher itself would on first run
    ln -sf "../lib/node_modules/${pkgname}/bin/agent-browser-linux-${_arch}" "${pkgdir}/usr/bin/${pkgname}"

    # Remove references to pkgdir/srcdir from package.json
    local tmppackage="$(mktemp)"
    local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
    jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
    mv "${tmppackage}" "${pkgjson}"
    chmod 644 "${pkgjson}"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"

    # Install license
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
