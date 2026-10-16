# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=pi-coding-agent-bin
_pkgname=pi-coding-agent
pkgver=1.3.0
pkgrel=1
pkgdesc="Coding agent CLI with read, bash, edit, write tools and session management (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/earendil-works/pi"
license=('MIT')
depends=('glibc' 'gcc-libs')
optdepends=(
    'git: repository-aware workflows and session integration'
    'ripgrep: faster in-repository search'
)
provides=("${_pkgname}=${pkgver}" 'pi')
conflicts=("${_pkgname}" 'pi-coding-agent-git')
# Prebuilt Bun standalone binary: stripping ELF symbols corrupts the embedded
# runtime payload, and the executable resolves its sibling assets (package.json,
# node_modules, theme, export-html, wasm) relative to the real binary path. Ship
# the bundle untouched under /opt and expose it via a /usr/bin symlink.
options=('!strip' '!debug' '!lto')

_tag="v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/earendil-works/pi/${_tag}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/${_tag}/pi-linux-x64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/${_tag}/pi-linux-arm64.tar.gz")

sha256sums=('0457f5bcec3b3b211605dfb5d1a49042fd638f3686a410fe099c24a25af13c48')
sha256sums_x86_64=('24f5be328b66d4da36876296989501974f43ab8434fbb57c35c523a3ea505ded')
sha256sums_aarch64=('7fd2ea14fca390ebf9f47438baaef07c4b3d13db7cc8e459831118391b7ea65b')

package() {
    install -d "${pkgdir}/opt"
    cp -a --no-preserve=ownership "${srcdir}/pi" "${pkgdir}/opt/${_pkgname}"

    install -d "${pkgdir}/usr/bin"
    ln -s "../../opt/${_pkgname}/pi" "${pkgdir}/usr/bin/pi"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
