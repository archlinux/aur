# Maintainer: Sandwich <sandwich@archworks.co>
#
# The Netskope Client .deb is proprietary and not publicly redistributable.
# Obtain STAgent_amd64.deb from your Netskope tenant admin console
# (Settings -> Tools -> Downloads -> Linux) and place it next to this
# PKGBUILD before running makepkg.

pkgname=netskope-client-bin
pkgver=135.1.4.2595
pkgrel=1
pkgdesc='Netskope Client (NSClient) endpoint agent for SASE/SWG'
arch=('x86_64')
url='https://www.netskope.com/'
license=('LicenseRef-Netskope-EULA')
depends=(
    'nss'
    'gtk3'
    'webkit2gtk-4.1'
    'libayatana-appindicator'
    'hicolor-icon-theme'
)
makedepends=('patchelf')
provides=('netskope-client' 'nsclient')
conflicts=('netskope-client' 'nsclient')
options=('!strip' '!debug' '!emptydirs')
install="${pkgname}.install"

_debfile="STAgent_amd64.deb"
_debsha256='ed23bddf058321d9a85d412dca6da4fc23062716229d96a494bbb5dd647b2b2a'

source=()
sha256sums=()

prepare() {
    local _deb="${startdir}/${_debfile}"
    if [[ ! -s "${_deb}" ]]; then
        error "${_debfile} is missing from ${startdir}."
        error "Place STAgent_amd64.deb next to the PKGBUILD before running makepkg."
        error "Download it from your Netskope tenant admin console:"
        error "  Settings -> Tools -> Downloads -> Linux (.deb)"
        return 1
    fi
    if ! echo "${_debsha256}  ${_deb}" | sha256sum -c --status; then
        warning "${_debfile} sha256 does not match the version this PKGBUILD was tested with."
        warning "expected: ${_debsha256}"
        warning "Continuing anyway (Netskope rebuilds the .deb per tenant)."
    fi
    bsdtar -xf "${_deb}" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}"
}

package() {
    cp -a "${srcdir}/opt" "${pkgdir}/opt"

    local ui="${pkgdir}/opt/netskope/stagent/stAgentUI"
    patchelf --replace-needed libwebkit2gtk-4.0.so.37 libwebkit2gtk-4.1.so.0       "${ui}"
    patchelf --replace-needed libjavascriptcoregtk-4.0.so.18 libjavascriptcoregtk-4.1.so.0 "${ui}"
    patchelf --replace-needed libappindicator3.so.1 libayatana-appindicator3.so.1  "${ui}"

    install -Dm644 "${pkgdir}/opt/netskope/stagent/scripts/stagentd.service" \
        "${pkgdir}/usr/lib/systemd/system/stagentd.service"
    install -Dm644 "${pkgdir}/opt/netskope/stagent/scripts/stagentapp.service" \
        "${pkgdir}/usr/lib/systemd/user/stagentapp.service"
    install -Dm644 "${pkgdir}/opt/netskope/stagent/scripts/stagentui.desktop" \
        "${pkgdir}/usr/share/applications/stagentui.desktop"
}
