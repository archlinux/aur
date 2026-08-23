# Maintainer: Alexei Colin <ac at alexeicolin dot com>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

# ID copied from URL of the extension in the Chrome Web Store
_id=ciifpadakeohfnnneflckhojbldkkllp

pkgname=parcel-chromium
pkgver=1.0.6
pkgrel=2
pkgdesc="Chromium browser extension for zx2c4's pass (password manager)"
arch=('any')
url="https://github.com/parcel-pm/parcel"
license=('ISC')
depends=("parcel>=${pkgver}")
optdepends=('libarchive: inspect bundled host script with bsdtar')
# Can't build the extension from source, because needs to be signed by Google.
source=("${pkgname}-${pkgver}.crx::${url}/releases/download/v${pkgver}/parcel-chrome-${pkgver}.crx"
        "${pkgname}-${pkgver}.crx.asc::${url}/releases/download/v${pkgver}/parcel-chrome-${pkgver}.crx.asc")
noextract=("${pkgname}-${pkgver}.crx")
sha256sums=('267c6e3a50a8cea9add8caf9006e38b0e3ec847cdf52e4e58d60d772318df8d3'
            'SKIP')
validpgpkeys=('82ED663067C6017BAA4BC752EB670BF2B1131683'
              'B0908ED59A96C9882BED9A942A51761511A30253'
              '88FF14D6294AF4036B7F00FF676A3C09E2E47A72'
              '56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

install="${pkgname}.install"

prepare() {
    # Create extension json
    cat << EOF > "${_id}".json
{
    "external_crx": "/usr/lib/${pkgname}/${pkgname}-${pkgver}.crx",
    "external_version": "${pkgver}"
}
EOF
}

package() {
    install -Dm644 -t "${pkgdir}/usr/share/chromium/extensions/" "${_id}.json"
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "${pkgname}-${pkgver}.crx"

    # Link to json manifest file installed by parcel package
    local _nmh_dir="/etc/chromium/native-messaging-hosts"
    install -dm755 "${pkgdir}${_nmh_dir}"
    ln -sf "/usr/lib/parcel/hosts/chrome/com.github.erayd.parcel.json" "${pkgdir}${_nmh_dir}"
}

# vim:set ts=4 sw=4 et:
