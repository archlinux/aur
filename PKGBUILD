# Maintainer: jullanggit <jullanggit@proton.me>
_pkgname=anymex
_PkgName=AnymeX
pkgname=${_pkgname}-bin
pkgver=3.1.1
pkgrel=1
arch=(x86_64)
pkgdesc='An Open Source app for Tracking Multi Service (AL, MAL, SIMKL)'
url="https://github.com/RyanYuuki/${_PkgName}"
license=(MIT)
provides=(${_pkgname}=${pkgver})
depends=('libepoxy' 'gdk-pixbuf2' 'pango' 'webkit2gtk-4.1' 'harfbuzz' 'libsoup3' 'glibc' 'fontconfig' 'cairo' 'hicolor-icon-theme' 'glib2' 'gcc-libs' 'mpv' 'zlib-ng-compat' 'gtk3' 'at-spi2-core')
conflicts=(anymex)
_appimage="${_PkgName}-${pkgver}.AppImage"
source=("${_appimage}::${url}/releases/download/v3.1.1/${_PkgName}-Linux.AppImage"
        "LICENSE-${pkgver}.md::https://raw.githubusercontent.com/RyanYuuki/AnymeX/refs/tags/v3.1.1/LICENSE.md")
noextract=(${_appimage})
sha256sums=('8d011eafa9d4a2d3c17d7cd7c477a37bb889f9edda5fd9dd98280d881e1a6c0d' 'SKIP')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract >/dev/null
}

build() {
    chmod -R a-x+rX squashfs-root/usr
    chmod +x squashfs-root/usr/bin/anymex
}

package() {
    install -dm755 "${pkgdir}/usr/"
    mv "${srcdir}"/squashfs-root/usr/* "${pkgdir}/usr/"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<DESKTOP
[Desktop Entry]
Version=${pkgver}
Type=Application
Name=${_PkgName}
GenericName=${_PkgName}
Comment=${pkgdesc}
Exec=${_pkgname}
Icon=${_pkgname}
Terminal=false
Categories=Utility;Application;
Keywords=${_pkgname};anime
StartupNotify=true
DESKTOP
}
