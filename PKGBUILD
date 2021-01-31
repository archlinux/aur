# Maintainer: Feakster <feakster at posteo dot eu>

### Info ###
pkgname=simplenote-electron-arm-bin
_pkgname=${pkgname%-electron-arm-bin}
pkgver=2.5.0
_appimage="simplenote-electron-${pkgver}-${CARCH}.AppImage"
pkgrel=3
pkgdesc='The simplest way to keep notes'
arch=('armv7h' 'aarch64')
url='https://github.com/Automattic/simplenote-electron'
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme' 'libxss' 'mesa' 'nss')
optdepends=(
    'libnotify: desktop notifications'
    'noto-fonts-emoji: emoji support'
    'ttf-joypixels: emoji support'
)
makedepends=('zlib')
provides=('simplenote')
options=(!strip)
install="$pkgname.install"
source_armv7h=("simplenote-electron-${pkgver}-armv7h.AppImage"::"${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-armv7l.AppImage")
source_aarch64=("simplenote-electron-${pkgver}-aarch64.AppImage"::"${url}/releases/download/v${pkgver}/Simplenote-linux-${pkgver}-arm64.AppImage")
noextract=($_appimage)
b2sums_armv7h=('23da95334418715375f484e1549dcd8a4107f07fa963053045701b16b8b5ba5b26afac25e0ccd0401895828a30db4c8d40d8b77a61193825fca04918184ff7fa')
b2sums_aarch64=('f28a8f71b80c2e17d531cb860708f6ca441a0c27c214b30daf96d5eb138f93f070090e30dee7a7c485556a5f33f2c8fb3d6bc0afc9da6fd0ebc1bd6f69db98d1')

### Prepare ###
prepare() {
    ## Change Directory ##
    cd "$srcdir"

    ## Mark AppImage as Executable ##
    chmod a+x $_appimage

    ## Extract AppImage into squashfs-root Directory ##
    ./$_appimage --appimage-extract

    ## Remove Unneccessary Directories/Files ##
    rm squashfs-root/AppRun
    rm squashfs-root/$_pkgname.png
    rm squashfs-root/.DirIcon
    
    ## Fix Permissions ##
    find squashfs-root -type d -exec chmod 0755 {} \;
    find squashfs-root -type f -name '*.so' -exec chmod 0644 {} \;
    
    ## Replace Shared Objects with Symlinks ##
    for SO in EGL GLESv2 vulkan
    do
        ln -fs /usr/lib/${SO}.so squashfs-root/lib${SO}.so
    done
    
    ## Modify Desktop File ##
    sed -i \
    -e "s|^Exec=AppRun$|Exec=/usr/bin/${_pkgname}|" \
    -e '/^X-AppImage-Version=.*/d' \
    -e '/^Path=.*/d' \
    squashfs-root/${_pkgname}.desktop
    echo "Path=/opt/${_pkgname}" >> squashfs-root/${_pkgname}.desktop
}

### Package ###
package() {
    ## Change Directory ##
    cd "$srcdir"

    ## Create Installation Directory Structure ##
    install -dm0755 "$pkgdir"/usr/bin
    install -dm0755 "$pkgdir"/opt/$_pkgname
    install -dm0755 "$pkgdir"/usr/share/{applications,icons}
    install -dm0755 "$pkgdir"/usr/share/licenses/$pkgname

    ## Install Icons ##
    cp -RL squashfs-root/usr/share/icons/hicolor "$pkgdir"/usr/share/icons/
    rm -rf squashfs-root/usr

    ## Move AppImage Contents to /opt/$_pkgname ##
    cp -RT squashfs-root "$pkgdir"/opt/$_pkgname
}
