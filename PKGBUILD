# maintainer: SiYuan community (https://github.com/siyuan-note/siyuan/issues/new/choose)
# auto running on siyuan official repo
# PKGBUILD is modified from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=siyuan-appimage
# which is made by vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>
# had agreement with the author to use the PKGBUILD
# for change request, PLEASE MAKE A PR ON GITHUB REPO, keep commenting here would be ignored

pkgname=siyuan-bin
pkgver=3.8.0
pkgrel=1
pkgdesc="auto upload to AUR when SiYuan stable release"
arch=("x86_64")
url="https://b3log.org/siyuan"
license=("AGPL-3.0-only")
options=("!strip" "!debug")
depends=("fuse2")
optdepends=('pandoc: docx export')
source=("https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/siyuan-${pkgver}-linux.AppImage")
sha256sums=('SKIP')

_pkgname=siyuan-${pkgver}-linux.AppImage
noextract=("${_pkgname}")

prepare() {
    chmod +x "${_pkgname}"
    ./"${_pkgname}" --appimage-extract > /dev/null
}

build() {
    _desktop_file=$(find squashfs-root -maxdepth 1 -name "*.desktop" -print -quit)
    # Adjust .desktop so it will work outside of AppImage container
    sed -i \
        -e "s|Exec=AppRun|Exec=/opt/${pkgname}/${pkgname}.AppImage|" \
        -e "s+^Icon=.*+Icon=siyuan-bin+" \
        "${_desktop_file}"

    # Fix permissions; .AppImage permissions are 700 for all directories
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    _desktop_file=$(find squashfs-root -maxdepth 1 -name "*.desktop" -print -quit)
    # AppImage
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/opt/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/squashfs-root/THIRD_PARTY_NOTICES.md" "${pkgdir}/opt/${pkgname}/THIRD_PARTY_NOTICES.md"

    # Desktop file
    install -Dm644 "${srcdir}/${_desktop_file}" \
            "${pkgdir}/usr/share/applications/siyuan.desktop"

    # Icon images
    install -Dm644 "squashfs-root/resources/stage/icon.png" \
            "${pkgdir}/usr/share/icons/hicolor/512x512/apps/siyuan-bin.png"

    # Symlink executable
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/siyuan"

    # Symlink license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/opt/${pkgname}/THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
}
