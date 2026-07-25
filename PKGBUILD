# Maintainer: Philipp Gerard <philipp.gerard@zeitdenken.de>

pkgname=filen-menubar-bin
_pkgname=filen-menubar
pkgver=0.1.27
pkgrel=1
pkgdesc="Lightweight system tray app for Filen cloud sync"
arch=('x86_64')
url="https://github.com/philippgerard/filen-menubar"
license=('MIT')
# Arch equivalents of the .deb's Depends: libgtk-3-0, libwebkit2gtk-4.1-0,
# libayatana-appindicator3-1. The .deb also pulls nodejs, but only because
# its sync backend is assumed to come from npm; filen-cli-bin ships a
# standalone binary that needs no node, so nodejs is optional here.
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
optdepends=('filen-cli-bin: sync backend, standalone binary (recommended)'
            'nodejs: only needed if you install @filen/cli through npm instead')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
# Prebuilt upstream binary: leave it exactly as shipped.
options=(!strip !debug !lto)

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Filen.Menubar_${pkgver}_amd64.deb"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
# .deb is an ar archive; unpack it explicitly in package().
noextract=("${pkgname}-${pkgver}.deb")
sha256sums=('1d78f8785c241d08193b45e9c97fe6aea39b8659831cdbad77a773d9b78eb11c'
            '63d3d5dbe2ed4b855613bc1d0cdaa541583985329fd66b4179f937eb55ded130')

package() {
    local _debdir="${srcdir}/_deb"

    rm -rf "$_debdir"
    install -d "$_debdir"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "$_debdir"
    bsdtar -xf "$_debdir"/data.tar.* -C "$pkgdir" usr/

    chmod 755 "${pkgdir}/usr/bin/${_pkgname}"

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
}
