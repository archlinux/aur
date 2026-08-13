# Maintainer: Philipp Gerard <philipp.gerard@zeitdenken.de>

pkgname=filen-menubar-bin
_pkgname=filen-menubar
pkgver=0.1.33
pkgrel=1
pkgdesc="Lightweight system tray app for Filen cloud sync"
arch=('x86_64')
url="https://github.com/philippgerard/filen-menubar"
license=('MIT' 'AGPL-3.0-only')
# Arch equivalents of the .deb's Depends: libgtk-3-0, libwebkit2gtk-4.1-0,
# libayatana-appindicator3-1. The patched sync backend is bundled and needs no
# system Node.js or separately installed Filen CLI.
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
# Prebuilt application and bundled backend: leave executable payloads intact.
options=(!strip !debug !lto)

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Filen.Menubar_${pkgver}_amd64.deb"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
# .deb is an ar archive; unpack it explicitly in package().
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('53029b868675ae953b3ee2b31cabf2f52d0b41dd5e22d24ec5fe46403790e128'
            '63d3d5dbe2ed4b855613bc1d0cdaa541583985329fd66b4179f937eb55ded130')

package() {
    local _debdir="${srcdir}/_deb"

    rm -rf "$_debdir"
    install -d "$_debdir"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "$_debdir"
    bsdtar -xf "$_debdir"/data.tar.* -C "$pkgdir" usr/

    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

    local _runtime="${pkgdir}/usr/lib/Filen Menubar/filen-cli/node"
    [[ -f "$_runtime" ]] || {
        echo "==> app-owned Node.js runtime was not present in the .deb payload" >&2
        return 1
    }
    chmod 755 "$_runtime"

    [[ ! -e "${pkgdir}/usr/bin/filen-menubar-cli" ]] || {
        echo "==> bundled runtime must remain app-private, not be installed on PATH" >&2
        return 1
    }

    local _entrypoint="${pkgdir}/usr/lib/Filen Menubar/filen-cli/filen-cli.cjs"
    [[ -f "$_entrypoint" ]] || {
        echo "==> bundled Filen CLI entrypoint was not present in the .deb payload" >&2
        return 1
    }

    local _keyring
    _keyring="$(find "${pkgdir}/usr/lib/Filen Menubar/filen-cli/node_modules/@jupiterpi/node-keyring" \
        -maxdepth 1 -type f -name '*.node' -print -quit)"
    [[ -n "$_keyring" ]] || {
        echo "==> bundled native keyring module was not present in the .deb payload" >&2
        return 1
    }

    # Upstream's productName ("Filen Menubar") becomes the desktop filename,
    # spaces and all. Match by glob so a productName change does not break us.
    local _desktop
    _desktop="$(find "${pkgdir}/usr/share/applications" -name '*.desktop' -print -quit)"
    [[ -n "$_desktop" ]] || {
        echo "==> no .desktop file in the .deb payload" >&2
        return 1
    }
    mv "$_desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # The .deb carries no copyright file, so install the license from the tag.
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    local _helper_license _node_license _third_party_notices _runtime_sbom
    _helper_license="$(find "${pkgdir}/usr/lib" -path '*/licenses/filen-cli/AGPL-3.0.txt' -print -quit)"
    [[ -n "$_helper_license" ]] || {
        echo "==> bundled Filen CLI license was not present in the .deb payload" >&2
        return 1
    }
    install -Dm644 "$_helper_license" \
        "${pkgdir}/usr/share/licenses/${pkgname}/AGPL-3.0.txt"

    _node_license="$(find "${pkgdir}/usr/lib" -path '*/licenses/filen-cli/NODE-LICENSE.txt' -print -quit)"
    _third_party_notices="$(find "${pkgdir}/usr/lib" -path '*/licenses/filen-cli/THIRD_PARTY_NOTICES.txt' -print -quit)"
    _runtime_sbom="$(find "${pkgdir}/usr/lib" -path '*/licenses/filen-cli/runtime.cdx.json' -print -quit)"
    [[ -n "$_node_license" && -n "$_third_party_notices" && -n "$_runtime_sbom" ]] || {
        echo "==> bundled runtime notices or SBOM were not present in the .deb payload" >&2
        return 1
    }
    install -Dm644 "$_node_license" \
        "${pkgdir}/usr/share/licenses/${pkgname}/NODE-LICENSE.txt"
    install -Dm644 "$_third_party_notices" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.txt"
}
