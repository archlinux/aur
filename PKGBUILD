# Maintainer: Harsh Narayan Jha <harshnj at proton dot me>
# Contributor: mdmrk <mariodavo.20@gmail.com>
_pkgname=Eden
pkgname=eden-nightly-bin

_tagstamp=1788724149
_buildcommit=11de264541
_upstream_tag="v${_tagstamp}.${_buildcommit}"

pkgver="${_tagstamp}.${_buildcommit}"
pkgrel=1
pkgdesc="Nightly release of the Eden Nintendo Switch emulator (PGO optimized)"
arch=('x86_64')
url="https://git.eden-emu.dev/eden-ci/nightly"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme')
options=(!strip)
provides=('eden')
conflicts=('eden')
_appimage="Eden-Linux-${_buildcommit}-amd64-clang-pgo.AppImage"
source=("${_appimage}::https://nightly.eden-emu.dev/${_upstream_tag}/${_appimage}")
sha256sums=('b52dfd4ecf0f475b565a95cbc581e33c0e355862c9c287ddfb70a5e9f284f1fc')

prepare() {
    chmod +x "${_appimage}"
    "./${_appimage}" --appimage-extract
}

build() {
    sed -i \
      -e "s|^Exec=.*|Exec=/usr/bin/eden|" \
      -e "s|^Icon=.*|Icon=eden|" \
      -e "s|^TryExec=.*|TryExec=eden|" \
      -e "s|^Name=.*|Name=Eden (Nightly)|" \
      squashfs-root/*.desktop
}

package() {
    install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    install -Dm644 squashfs-root/*.desktop \
        "${pkgdir}/usr/share/applications/eden-nightly.desktop"

    # Install icon (SVG if available, fallback to PNG)
    if compgen -G "squashfs-root/*.svg" > /dev/null; then
        install -Dm644 squashfs-root/*.svg \
            "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eden.svg"
    elif compgen -G "squashfs-root/*.png" > /dev/null; then
        install -Dm644 squashfs-root/*.png \
            "${pkgdir}/usr/share/pixmaps/eden.png"
    fi

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/eden"

    # Install MIME types
    cat > eden-nightly.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
  <mime-type type="application/x-nx-nro">
    <glob pattern="*.nro"/>
  </mime-type>
  <mime-type type="application/x-nx-nso">
    <glob pattern="*.nso"/>
  </mime-type>
  <mime-type type="application/x-nx-nsp">
    <glob pattern="*.nsp"/>
  </mime-type>
  <mime-type type="application/x-nx-xci">
    <glob pattern="*.xci"/>
  </mime-type>
</mime-info>
EOF
    install -Dm644 eden-nightly.xml "${pkgdir}/usr/share/mime/packages/eden-nightly.xml"
}

post_install() {
    update-mime-database /usr/share/mime &> /dev/null || true
    update-desktop-database -q || true
}

post_upgrade() {
    post_install
}

post_remove() {
    update-mime-database /usr/share/mime &> /dev/null || true
    update-desktop-database -q || true
}
