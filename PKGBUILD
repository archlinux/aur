# Maintainer: Plague-doctor <plague at privacyrequired dot com>
# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=pcloud-drive
pkgver=1.8.6
pkgrel=6
pkgdesc='pCloud drive. Electron edition.'
arch=('x86_64')
url='https://www.pcloud.com/'
license=('custom')
depends=('fuse2')
replaces=('pcloud-git' 'pcloud')
_api_code='XZM0dakZjHLyhvrBu0BXRSmnTXNHbSbiodj7'
_api_response="$(curl -s "https://api.pcloud.com/getpublinkdownload?code=${_api_code}")"
_dlhost="$(echo ${_api_response} | grep -E -o '[a-zA-Z0-9\-]+\.pcloud\.com' | head -n 2 | sort -R | head -n 1)"
_dlpath="$(echo ${_api_response} | grep -E -o "\"path\":\s{0,1}\".+\"" | cut -d '"' -f 4 | tr -d '\\')"
source=('LICENSE'
        "${pkgname}-${pkgver}-${pkgrel}::https://${_dlhost}${_dlpath}"
)
sha256sums=('d512ec90082d82ef0e1fe5d7b14d63ae835f955d3119436d5c08761ff4e3366a'
            'db01bf8a151b80e99ba54c25a06276c109f81538c0d6e417deefc2f14f55525c'
)
_shortname='pcloud'

prepare() {
    chmod +x ${pkgname}-${pkgver}-${pkgrel}
    ./${pkgname}-${pkgver}-${pkgrel} --appimage-extract
}

package() {
    cd "$srcdir"

    install -d "$pkgdir"/{/usr/bin,opt}
    install -d "${pkgdir}/usr/share/icons/hicolor"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd squashfs-root/
    find . -type d -exec chmod 755 {} \;
    cp -r . "${pkgdir}/opt/${_shortname}/"
    cp -r usr/share/icons/ "${pkgdir}/usr/share/"
    ln -s "/opt/${_shortname}/${_shortname}" "${pkgdir}/usr/bin/${_shortname}"
    install -Dm644 ${_shortname}.desktop "${pkgdir}/usr/share/applications/${_shortname}.desktop"
    sed -i 's/AppRun/pcloud/' "${pkgdir}/usr/share/applications/${_shortname}.desktop"
    sed -i 's/Name=pcloud/Name=pCloud/' "${pkgdir}/usr/share/applications/${_shortname}.desktop"
    chmod 755 "${pkgdir}/opt/${_shortname}"
}
