# Maintainer: Josef Andersson <josefandersson@tuta.io>
#
# Installs the prebuilt saur binary from a published release. No build step.
# After cutting a new release, bump pkgver and run `updpkgsums` to refresh hashes.

pkgname=saur-bin
_binname=saur
pkgver=1.2.0
pkgrel=1
pkgdesc="A safer AUR helper with Claude security review baked in"
arch=('x86_64' 'aarch64')
url="https://git.josf.dev/josefandersson/saur"
license=('MIT')
depends=('claude-code')          # runtime: the `claude` CLI (authenticated)
provides=('saur')
conflicts=('saur')
# Do NOT strip: this is a bun standalone executable with the app bundle appended after the ELF.
# `strip` (which makepkg runs by default) corrupts that trailer, so the binary falls back to bun's
# own CLI — `saur update` then runs `bun update`. Keep the binary byte-for-byte as shipped.
options=('!strip')

_relbase="https://git.josf.dev/josefandersson/saur/releases/download/v${pkgver}"
_rawbase="https://git.josf.dev/josefandersson/saur/raw/tag/v${pkgver}"

source=("LICENSE-${pkgver}::${_rawbase}/LICENSE"
        "README-${pkgver}.md::${_rawbase}/README.md")
source_x86_64=("${_binname}-${pkgver}-x86_64::${_relbase}/saur-linux-x64")
source_aarch64=("${_binname}-${pkgver}-aarch64::${_relbase}/saur-linux-arm64")

# Hashes are rewritten from the actual built artifacts by packaging/ci-aur-publish.sh.
# To bump by hand: run `updpkgsums` here after the release assets are live.
sha256sums=('2c1933e87f06646fff53ead8554e5d3243a7e969fbeea777bcb8673e9a7904aa' '289aeed941d46fbb453ab16b51290fb5530e763e90e910db98627a81f1a1c82f')
sha256sums_x86_64=('636c0670defb448d89dc0a913c101796e419a18d3c2d0ddf3b1fabc7385b7c7e')
sha256sums_aarch64=('ce998a77148b116d2498f320fb915bdeec2a66ced699c43fc76f58d84b69d485')

package() {
	install -Dm755 "${_binname}-${pkgver}-${CARCH}" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "README-${pkgver}.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
