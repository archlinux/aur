# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=pi-coding-agent-bin
_pkgname=pi-coding-agent
pkgver=0.82.1
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
sha256sums_x86_64=('884a9dec7e0b75a54c4d1933c93a7d45af1fbb81c32964c1dd45d67fac1f6544')
sha256sums_aarch64=('9e7036f89370c443235a2a0a8ccc91a9cc2b7f4af5ec20b2dad1c6f72aa916e6')

package() {
    install -d "${pkgdir}/opt"
    cp -a --no-preserve=ownership "${srcdir}/pi" "${pkgdir}/opt/${_pkgname}"

    install -d "${pkgdir}/usr/bin"
    ln -s "../../opt/${_pkgname}/pi" "${pkgdir}/usr/bin/pi"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
