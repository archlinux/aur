# Maintainer: petrovichest <caludesaul@pm.me>
pkgname=niri-battery-keeper-bin
_pkgname=niri-battery-keeper
pkgver=0.3.0
pkgrel=1
pkgdesc="Keeps battery on a Niri laptop by reining in background apps via systemd cgroups"
arch=('x86_64')
url="https://github.com/petrovichest/niri-battery-keeper"
license=('MIT')
depends=('systemd' 'wayland' 'libxkbcommon')
optdepends=('polkit: for the TDP root-helper install flow from the GUI'
            'niri: required for the daemon to manage windows')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
# The release tarball intentionally doesn't ship the systemd unit, the
# desktop entry, or the icon (they're embedded in the binary or only
# needed at install-time). Fetch each from the matching git tag so the
# package always matches the binary version.
source=(
    "${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/niri-battery-keeper-x86_64-linux.tar.gz"
    "${_pkgname}.service::${url}/raw/v${pkgver}/systemd/niri-battery-keeper.service"
    "${_pkgname}.desktop::${url}/raw/v${pkgver}/assets/niri-battery-keeper.desktop"
    "${_pkgname}.svg::${url}/raw/v${pkgver}/assets/niri-battery-keeper.svg"
)
# Real sha256sums are substituted by the release CI pipeline.
sha256sums=('17fb7ea72e3bb9dd74f58269e8e1c414652262ca20f368055fef82bf9cad6277' '225c9eaa706798836be7825e42f9b7fb64b24115282e3691c3743a2bc5b7d851' 'c57c0d1b4e4d47c684f2e51ab73f5e71e5778a3a4d78fa6ad4af2f044bedf930' '80b0168f05200ec07882e0971a2983eeba882f2c8a7d41ab3d4c2b55bfbe287a')

package() {
    cd "${srcdir}/${_pkgname}-v${pkgver}-x86_64-linux"

    install -Dm755 niri-battery-keeper \
        "${pkgdir}/usr/bin/niri-battery-keeper"
    install -Dm644 "${srcdir}/${_pkgname}.service" \
        "${pkgdir}/usr/lib/systemd/user/niri-battery-keeper.service"
    install -Dm644 "${srcdir}/${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/niri-battery-keeper.desktop"
    install -Dm644 "${srcdir}/${_pkgname}.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/niri-battery-keeper.svg"
    install -Dm644 config.example.toml \
        "${pkgdir}/usr/share/doc/${_pkgname}/config.example.toml"
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
