# Maintainer: Alexei Colin <ac at alexeicolin dot com>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

pkgname=parcel
pkgver=1.0.6
pkgrel=1
pkgdesc="Native host for Parcel browser extension for zx2c4's pass password manager"
arch=('any')
url="https://github.com/parcel-pm/${pkgname}"
license=('ISC')
depends=('jq' 'gnupg' 'openssl')
makedepends=()
optdepends=("parcel-firefox: browser extension for Firefox"
            "parcel-chromium: browser extension for Chromium")
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('7392e28b0c25b11a689008edcb27c2d8fbc87f28c3cdc79ccb866e238fe76004'
            'SKIP')
validpgpkeys=('82ED663067C6017BAA4BC752EB670BF2B1131683'
              'B0908ED59A96C9882BED9A942A51761511A30253'
              '88FF14D6294AF4036B7F00FF676A3C09E2E47A72'
              '56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "parcel-host" "${pkgdir}/usr/bin/parcel-host"

    # Install manifests so that browser extension pkgs can link to them
    local _manifest_id="com.github.erayd.parcel"
    local _browser
    for _browser in "firefox" "chrome"
    do
        sed -i 's@/usr/local@/usr@' "example/${_manifest_id}.${_browser}.json"
        install -Dm644 "example/${_manifest_id}.${_browser}.json" \
            "${pkgdir}/usr/lib/parcel/hosts/${_browser}/${_manifest_id}.json"
    done
}

# vim:set ts=4 sw=4 et:
