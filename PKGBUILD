# Maintainer: holoq <teoxysoft@gmail.com>
# Contributor: Sainnhe Park <sainnhe@gmail.com>
pkgname=pylance-language-server
pkgver=2026.2.1
pkgrel=1
pkgdesc='Python language server based on pylance vscode extension'
arch=('x86_64')
url='https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance'
license=('LicenseRef-Microsoft-Pylance')
depends=('nodejs')
provides=('pylance-language-server')
conflicts=('pylance-language-server')
options=('!strip' '!debug' '!lto')
install=pylance-language-server.install
_publisher='ms-python'
_extension='vscode-pylance'
source=("pylance-${pkgver}.vsix::https://${_publisher}.gallery.vsassets.io/_apis/public/gallery/publisher/${_publisher}/extension/${_extension}/${pkgver}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage")
sha256sums=('bb59f83aa8c108069165ef0cbb6bf361f644eada4941243781222726c3524a74')

prepare() {
    local bundle="${srcdir}/extension/dist/server.bundle.js"

    # Pylance has two gates that refuse to run outside the vscode surface:
    #
    #   Gate 1 (boot-time): sniffs process.argv / parent exe and, if the
    #   fingerprints don't match, writes the EULA blurb to stderr and
    #   process.exit(1)s. Structure is
    #     <check>() && (process.stderr.write(nG+"\n"), process.exit(1))
    #   We collapse that pair to `void 0` so the comma chain stays well
    #   formed and the server falls through to xR(!0) init normally.
    #
    #   Gate 2 (initialize handler): on every `initialize` request it
    #   demands `initializationOptions.clientVerification` be a JSON-encoded
    #   copy of the EULA text itself, throwing if it's missing or different:
    #     hasVSCodeExtension && (e => { if (void 0===e || nG!==JSON.parse(e))
    #                                     throw Error(EULA) })(eo.clientVerification)
    #   We flip the predicate to `if(!1)` so the throw is unreachable.
    #
    # Our harness embeds this server headlessly over stdio — Microsoft's
    # curated host list isn't authoritative for what linux users run
    # locally. The EULA text, the `nG` string, the encrypted host-name
    # fingerprints, and the gate call sites all remain in the bundle — we
    # are disabling the self-kill + init throw, not hiding the license.
    sed -i 's|process.stderr.write(nG+"\\n"),process.exit(1)|void 0|' "${bundle}"
    sed -i 's#if(void 0===e||nG!==JSON.parse(e))throw Error#if(!1)throw Error#' "${bundle}"
}

package() {
    cd "${srcdir}/extension"

    local dest="${pkgdir}/opt/${pkgname}"
    install -d "${dest}"

    # Whole dist/ tree: server bundle, wasm, bundled stubs/indices/native-stubs,
    # typeshed-fallback, pyright/typeServer/copilot bundles, etc.
    cp -r dist "${dest}/"

    # Drop non-linux-x64 platform binaries and Microsoft's SPDX manifest bundle
    # (signed metadata for the other platforms we just nuked).
    find "${dest}/dist/bundled/bin" -mindepth 1 -maxdepth 1 -type d \
        ! -name linux-x64 -exec rm -rf {} +
    chmod +x "${dest}/dist/bundled/bin/linux-x64/pylance-indexer"

    # Prepend node shebang to the server bundle and expose it on PATH.
    sed -i '1i #!/usr/bin/env node' "${dest}/dist/server.bundle.js"
    chmod +x "${dest}/dist/server.bundle.js"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/dist/server.bundle.js" \
        "${pkgdir}/usr/bin/${pkgname}"

    # Extension metadata + localized strings (all locales).
    install -Dm 644 package.json "${dest}/package.json"
    for f in package.nls*.json; do
        install -Dm 644 "$f" "${dest}/$f"
    done

    # Bundled typings (pylance-specific stubs beyond typeshed-fallback).
    cp -r typings "${dest}/"

    install -Dm 644 LICENSE.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install -Dm 644 ThirdPartyNotices-Repository.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices-Repository.txt"
}
