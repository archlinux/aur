# Maintainer: Plague-doctor <plague at privacyrequired dot com>
# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=pcloud-drive
pkgver=1.8.6
pkgrel=1
pkgdesc='pCloud drive. Electron edition.'
arch=('x86_64')
url='https://www.pcloud.com/'
license=('custom')
depends=('fuse3')
makedepends=('sed')
replaces=('pcloud-git' 'pcloud')
source=('LICENSE'
        "${pkgname}-${pkgver}-${pkgrel}::https://p-def4.pcloud.com/cBZxtfsXBZ3FFf0sZHsOiZ7Z95YQ37Z2ZZwjpZkZ9G8FVZbZi7ZIFZz5ZXVZa0ZxJZlFZzXZppZB0ZP7ZAJZV7ZM0dakZbpLDX8oR0CfRCxFdrw6qiLel1M9y/pcloud"
)
validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')
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
