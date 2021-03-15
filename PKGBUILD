# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

_id=pjmbgaakjkbhpopmakjoedenlfdmcdgm
_name=browserpass-extension
pkgname=browserpass-chrome
pkgver=3.7.2
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
sha256sums=('554cfcb8f657ae8149378059b6283393eff213184b6c716ca8b085407c26b251'
            'SKIP'
            '88c5889f0ef1f64a5e08408b51ce47a991087966b1bf127ec0ec39c9d7111f50')
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
