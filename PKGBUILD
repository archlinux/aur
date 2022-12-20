# Maintainer: Maxim Baz <archlinux at maximbaz dot com>

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
        "${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/browserpass/browserpass-extension/master/LICENSE")
noextract=("${pkgname}-${pkgver}.crx")
b2sums=('b32b63746206cef46e0386f8e1788fc3a0ce9baca847e4f3e59dea1dc006ed7e8909df351427ead179c1e2ef73a2c439babbeb632f0323ad71ddcd338a1ec75a'
        'SKIP'
        '9e54d91167393d3f3159c3598aa729434c1e7d8ef39083aa40ba6241c9b4b560c64bac1af43efa7be2dac72d8c35413b057b9f67eb41934e10bd8c733437e407')
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

    install -Dm644 "${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
