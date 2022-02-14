# Maintainer: cradcore <cradcore at zoho dot com>

### Info ###
pkgname=webmessage-bin
_pkgname=${pkgname%-bin}
pkgver=0.7.0
_appimage="WebMessage-${pkgver}.AppImage"
pkgrel=1
pkgdesc='A messaging client, meant to work with the WebMessage tweak for jailbroken iOS devices.'
arch=('x86_64')
provides=('webmessage')
options=(!strip)
source_x86_64=("https://github.com/sgtaziz/WebMessage/releases/download/v${pkgver}/${_appimage}")
sha256sums_x86_64=('892c243b7e3e90155b8676702ebe8f104c4ee0de5743954b2b4df3d681b4741f')

### Prepare ###
prepare() {
    cd ${srcdir}
    chmod a+x $_appimage
    ./$_appimage --appimage-extract

    find squashfs-root -type d -exec chmod 0755 {} \;
    find squashfs-root -type f -exec chmod 0644 {} \;
    find squashfs-root -type f -regex '^.+\.so\(\.[0-9]+\)?$' -exec chmod 0755 {} \;
    chmod 0755 squashfs-root/$_pkgname

    sed -i \
        -e "s|^Exec=.*|Exec=/usr/bin/$_pkgname %U|" \
        -e '/^TryExec=.*/d' \
        -e '/^X-AppImage-Version=.*/d' \
    squashfs-root/${_pkgname}.desktop
    echo "TryExec=/opt/$_pkgname/$_pkgname" >> squashfs-root/${_pkgname}.desktop
}

### Package ###
package() {
    ## Move AppImage Contents to /opt/$_pkgname ##
    install -dm0755 "$pkgdir"/opt/$_pkgname
    cp -RT "$srcdir"/squashfs-root "$pkgdir"/opt/$_pkgname

    ## SUID Sandbox ##
    chmod 4755 "$pkgdir"/opt/$_pkgname/chrome-sandbox

    ## Executable Binary ##
    install -dm0755 "$pkgdir"/usr/bin
    ln -fs /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname

    ## Icons ##
    for SIZE in 16 32 48 64 128 256 512 1024
    do
        install -dm0755 "$pkgdir"/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps
        ln -fs \
        /opt/$_pkgname/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${_pkgname}.png \
        "$pkgdir"/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/${_pkgname}.png
    done

    ## Desktop Entry ##
    install -dm0755 "$pkgdir"/usr/share/applications
    ln -fs \
    /opt/$_pkgname/${_pkgname}.desktop \
    "$pkgdir"/usr/share/applications/${_pkgname}.desktop
}

