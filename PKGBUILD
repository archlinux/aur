# Maintainer: Plague-doctor <plague at privacyrequired dot com>
# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=pcloud-drive
pkgver=1.8.5
pkgrel=1
pkgdesc='pCloud drive. Electron edition.'
arch=('x86_64')
url='https://www.pcloud.com/'
license=('custom')
depends=('fuse3')
makedepends=('sed')
replaces=('pcloud-git' 'pcloud')
source=('LICENSE'
        "${pkgname}-${pkgver}-${pkgrel}::https://p-def4.pcloud.com/cBZXcBo1fZvMkjzWZZZBSm837Z2ZZwjpZkZBxkFVZH0Zp5Z6VZakZ5JZekZEJZD5Zy7ZRXZzXZ2JZqXZ7kZmK5IkZPSnDBEysIXpjklULAf68KX4MXUok/pcloud"
)
validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')
sha256sums=('d512ec90082d82ef0e1fe5d7b14d63ae835f955d3119436d5c08761ff4e3366a'
            '1c2dbb2afd2bc574205ca2e00e39632f1e95286481f7fe6ae6699684b1d3c9b7'
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
