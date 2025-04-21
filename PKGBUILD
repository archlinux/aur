# Maintainer: Norbert Preining <norbert@preining.info>
# Contributor: Maxim Baz <archlinux at maximbaz dot com>

_id=pjmbgaakjkbhpopmakjoedenlfdmcdgm
_name=browserpass-extension
pkgname=browserpass-chrome
pkgver=3.10.2
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
b2sums=('ba38d8dfdb90a700cb0116f2343e59506834c8f0008e37863f671b2271c125d9b68897ed30ce1a25f86e02d6d01e3aa2eba33735f40656159d22c369b3f57844'
        'SKIP'
        '9e54d91167393d3f3159c3598aa729434c1e7d8ef39083aa40ba6241c9b4b560c64bac1af43efa7be2dac72d8c35413b057b9f67eb41934e10bd8c733437e407')
validpgpkeys=('56C3E775E72B0C8B1C0C1BD0B5DB77409B11B601')

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
