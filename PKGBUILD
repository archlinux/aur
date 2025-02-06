# Maintainer: PoDiax <pd@pdx.ovh>

pkgname='storyboarder-appimage'
pkgver=2.1.0
pkgrel=1
pkgdesc="The best way to visualize your story. It makes it easy to visualize a story as fast you can draw stick figures."
provides=('storyboarder')
depends=('zlib' 'hicolor-icon-theme')
makedepends=('desktop-file-utils')
url='https://wonderunit.com/storyboarder/'
arch=('x86_64')
source=("https://github.com/wonderunit/storyboarder/releases/download/v${pkgver}/Storyboarder-${pkgver}-linux-x86_64.AppImage")
sha256sums=('aa068c49665ba72a9177351a3bf1c1ed15262c0481854f462cf4e556767b8b32')
license=('unknown')
options=(!strip)
_filename="Storyboarder-${pkgver}-linux-x86_64.AppImage"

prepare() {
    chmod +x "${_filename}"
    ./"${_filename}" --appimage-extract

    if [[ -f squashfs-root/storyboarder.desktop ]]; then
        sed -i "s|Exec=AppRun|Exec=/usr/bin/storyboarder|" "squashfs-root/storyboarder.desktop"
    fi

    chmod -R a-x+rX squashfs-root/usr
}

package() {
    install -Dm755 "${_filename}" "${pkgdir}/opt/storyboarder/${_filename}"

    if [[ -f squashfs-root/storyboarder.desktop ]]; then
        install -Dm644 squashfs-root/storyboarder.desktop "${pkgdir}/usr/share/applications/storyboarder.desktop"
    fi

    cp -ar squashfs-root/usr/share/icons "${pkgdir}/usr/share/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/storyboarder/${_filename} "${pkgdir}/usr/bin/storyboarder"
}
