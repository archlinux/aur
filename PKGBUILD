# Maintainer: Byeonghoon Yoo <bhyoo@bhyoo.com>

pkgname=pi-coding-agent-bin
_pkgname=pi-coding-agent
pkgver=0.84.4
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
sha256sums_x86_64=('c2f3c3e6a1850bd87654cc3ca8811013272397c3d042a4e2a64c43ee1b423972')
sha256sums_aarch64=('135580f6b942151646e67b8b866d987d28ce3cff5a497030775ddd29659f943d')

package() {
    install -d "${pkgdir}/opt"
    cp -a --no-preserve=ownership "${srcdir}/pi" "${pkgdir}/opt/${_pkgname}"

    install -d "${pkgdir}/usr/bin"
    ln -s "../../opt/${_pkgname}/pi" "${pkgdir}/usr/bin/pi"

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
