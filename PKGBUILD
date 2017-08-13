# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=lastpass
pkgver=4.1.54
pkgrel=1
_universalver=4.1.44
_chromever=4.1.52
_amo_file=670267
_crx_id=hdokiejnpimakedhajhdlcegeplioahd
pkgdesc="The Universal LastPass installer for Firefox, Chrome, and Opera"
arch=('i686' 'x86_64')
url="https://lastpass.com"
license=('custom')
makedepends=('unzip')
optdepends=('firefox'
            'chromium'
            'google-chrome'
            'opera')
# Apparently, API endpoints are all the rage -- so this isn't actually a file...
source=("${pkgname}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/file/${_amo_file}/"
        "lpchrome-${_chromever}.crx::${url}/lpchrome_linux.crx"
        "lplinux-${_universalver}.tar.bz2::${url}/lplinux.tar.bz2"
        "com.lastpass.nplastpass.json"
        "lastpass_policy_sources.json"
        "lastpass_policy_install.json"
        "License.txt")
noextract=("${pkgname}-${pkgver}.xpi"
           "lpchrome-${_chromever}.crx")
sha256sums=('2d930174c7c2c9d9e37d5d5ee857a89a50670d914e552914c5a79ad72f299c21'
            '47937f48972b73f024a1e616547405d41e368cb3756f97958423d20d2196762d'
            'adb0e91f8d212d34dbb85db0b11738fe36db1a741ad5674d7070c4019a9fc75e'
            'e8eb3b585809d6644807727c5bd0a74ead96dd2c5a7e6d2ce29e0b6ea28b9e59'
            'f82b920620575654fcbc0baf9b5d6c275835cbfc05b779ad309de5c6411c8bc9'
            '1c061cb5352d84dd6cde4dd6ce3889d41a31fd38acc4d97a7d69709e3d5ac693'
            '17a871edf1134c498f6e91465f5b3138ba5af7d822e4c253cda81ab929906388')

# 64-bit?
if [[ $CARCH = x86_64 ]]; then
    _64=64
fi

prepare() {
    cd "${srcdir}"

    tail -c +307 lpchrome-${_chromever}.crx > lpchrome-${_chromever}.zip
    unzip -qqo lpchrome-${_chromever}.zip -d lpchrome-${_chromever}

    unzip -qqo "${pkgname}-${pkgver}.xpi" -d "${pkgname}-${pkgver}"
}

package() {
    cd "${srcdir}"

    # Firefox
    _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' ${pkgname}-${pkgver}/install.rdf)"
    _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
    # Should this extension be unpacked or not?
    if grep '<em:unpack>true</em:unpack>' ${pkgname}-${pkgver}/install.rdf > /dev/null; then
        install -dm755 "${_extension_dest}"
        cp -R ${pkgname}-${pkgver}/* "${_extension_dest}"
        chmod -R ugo+rX "${_extension_dest}"
    else
        install -Dm644 ${pkgname}-${pkgver}.xpi "${_extension_dest}.xpi"
    fi

    # Chrome(ium)
    install -Dm755 lplinux/nplastpass$_64 "$pkgdir"/usr/lib/lastpass/nplastpass
    for i in opt/chrome chromium chromium-dev; do
        install -Dm644 com.lastpass.nplastpass.json "$pkgdir"/etc/$i/native-messaging-hosts/com.lastpass.nplastpass.json
        install -Dm644 lastpass_policy_sources.json "$pkgdir"/etc/$i/policies/managed/lastpass.json
    done
    for i in google-chrome chromium ; do
        install -Dm644 lastpass_policy_install.json "$pkgdir"/usr/share/$i/extensions/hdokiejnpimakedhajhdlcegeplioahd.json
    done

    # Opera
    install -Dm755 lpchrome-${_chromever}/libnplastpass${_64}.so "${pkgdir}"/usr/lib/opera/plugins/libnplastpass.so

    install -Dm644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
