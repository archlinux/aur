# Maintainer: Tim Quelch <tim@tquelch.com>

_pkgname="bazecor"
_branch="development"
pkgname="${_pkgname}-git"
pkgver=1.0.0beta15.2516
pkgrel=1
pkgdesc="Graphical configurator for Dygma Raise. Development branch"
url="https://github.com/Dygmalab/Bazecor"
license=("GPL3")
depends=("fuse")
makedepends=("yarn" "git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=("x86_64")
source=("${pkgname}::git+https://github.com/Dygmalab/Bazecor.git#branch=${_branch}")
cksums=("SKIP")
options=(!strip)

pkgver() {
    cd "$srcdir/$pkgname" || return
    printf "%s.%s" \
        "$(grep "\"version\":" package.json | \
        sed -e 's/^.*"\S*".*"\(\S*\)".*$/\1/')" \
        "$(git rev-list --count HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname" || return
    yarn || /bin/true           # yarn errors, but seems to still work
}

build() {
    cd "$srcdir/$pkgname" || return
    yarn run build:linux

    _appimage=$(find . -iname "*.AppImage")
    chmod +x "${_appimage}"
    cd .. || return
    ${srcdir}/${pkgname}/"${_appimage}" --appimage-extract

    sed -i -E "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
    chmod -R a-x+rX squashfs-root/usr
}

package() {
    # AppImage
    _appimage=$(find ${srcdir}/${pkgname} -iname "*.AppImage")
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

    # Symlink AppImage
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

    # Desktop file
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop"\
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Icons
    install -dm755 "${pkgdir}/usr/share/"
    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
}
