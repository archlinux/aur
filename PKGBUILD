# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

_id=pjmbgaakjkbhpopmakjoedenlfdmcdgm
_name=browserpass-extension
pkgname=browserpass-chrome
pkgver=3.2.2
pkgrel=1
pkgdesc="Chrome extension for Browserpass, browser extension for zx2c4's pass (password manager)"
arch=('any')
url="https://github.com/browserpass/${_name}"
license=('ISC')
depends=('browserpass')
source=("${pkgname}-${pkgver}.crx::${url}/releases/download/${pkgver}/browserpass-github-${pkgver}.crx"
        "${pkgname}-${pkgver}.crx.asc::${url}/releases/download/${pkgver}/browserpass-github-${pkgver}.crx.asc"
        "https://raw.githubusercontent.com/browserpass/browserpass-extension/master/LICENSE")
noextract=("${pkgname}-${pkgver}.crx")
sha256sums=('3f395e9e39f3220a31c46b28f62f347bb7286849b6bfe769eb96d15cd6d2bc63'
            'SKIP'
            'f9fc49e2b3977f857bf3cbfbeb193bab8b2e17545978c162409d5270e6e0405a')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

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
    install -Dm644 -t "${pkgdir}/opt/google/chrome/extensions/" "${_id}.json"
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}/" "${pkgname}-${pkgver}.crx"

    # Install host json from browserpass package
    install -dm755 "${pkgdir}/etc/opt/chrome/native-messaging-hosts/"
    ln -sf "/usr/lib/browserpass/hosts/chromium/com.github.browserpass.native.json" "${pkgdir}/etc/opt/chrome/native-messaging-hosts/"

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}

# vim:set ts=4 sw=4 et:
