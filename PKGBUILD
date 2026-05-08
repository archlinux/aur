# Maintainer: Angelo Gazzola <(firstname) @ nglgzz.com>
pkgname=neo4j-desktop
pkgver=2.1.4
pkgrel=1
pkgdesc="GUI for managing local and remote Neo4j Graph databases"
arch=('x86_64')
url=http://neo4j.org/
license=(custom)
makedepends=('imagemagick')
depends=('fuse')
optdepends=('gnome-keyring: Adds support for storing secrets')
options=(!strip)
_appimage="${pkgname}-offline-${pkgver}-${CARCH}.AppImage"
source=("${_appimage}::https://neo4j.com/artifact.php?name=${_appimage}")
noextract=("${_appimage}")
md5sums=('e374e3d9bf8dc42e9bc1251461d5be69')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

build() {
    # Adjust .desktop so it will work outside AppImage container
    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${pkgname}|" "squashfs-root/${pkgname}.desktop" \
        "squashfs-root/${pkgname}.desktop"

    # The AppImage contains only an icon of size 1024x1024, so
    # we need to generate the other icons for it to show
    # consistently in the UI.
    icons_dir="squashfs-root/usr/share/icons/hicolor"
    src_icon="${icons_dir}/1024x1024/apps/${pkgname}.png"

    for size in 16 32 48 64 128 256 512; do
      mkdir -p "${icons_dir}/${size}x${size}/apps/"
      magick "$src_icon" -resize "${size}x${size}" "${icons_dir}/${size}x${size}/apps/${pkgname}.png"
    done

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    # install -Dm644 "${srcdir}/LICENSE"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Icon images
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -n "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
