# Based off of: https://daveparrish.net/posts/2019-11-16-Better-AppImage-PKGBUILD-template.html
# Maintainer: Jackal32 <jxckal32 at gmail dot com>
# Contributor: ZachAR3 <Zach4R3@gmail.com>

_pkgname=Eden
pkgname="eden-preview-pgo-bin"
pkgver=0.2.0
_upstreamver=v0.2.0 # private var used for download URL since "-" isn't valid in pkgver
pkgrel=1
pkgdesc="The Eden Nintendo Switch emulator AppImage for preview builds such as release candidates (PGO build)."
arch=('x86_64')
url="https://git.eden-emu.dev/eden-emu/eden"
license=('GPL-3.0-or-later')
depends=('zlib' 'hicolor-icon-theme')
conflicts=('eden-preview-bin')
provides=('eden-preview')
options=(!strip)
_appimage="${_pkgname}-Linux-${pkgver}-amd64.AppImage"
source_x86_64=(
	"${_appimage}::https://git.eden-emu.dev/eden-emu/eden/releases/download/${_upstreamver}/${_pkgname}-Linux-${_upstreamver}-amd64-clang-pgo.AppImage"
	"eden-preview.xml::https://git.eden-emu.dev/eden-emu/eden/raw/tag/v${pkgver}/dist/dev.eden_emu.eden.xml"
)
sha256sums_x86_64=(
	'68c8b5ace9772b0016a73c77089968b84708dace06ae5c9a472e21fab030465f'
	'c3b5931f7dee681f00bbbb4ceecb26c2bfd0e56bb00e58e85ebd98eb700b84e7'
)

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

# Fix .desktop file executable and icon
build() {
  sed -i \
    -e "s|^Exec=.*|Exec=/usr/bin/eden-preview|" \
    -e "s|^Icon=.*|Icon=eden-preview|" \
    -e "s|^TryExec=.*|TryExec=eden-preview|" \
    -e "s|^Name=.*|Name=Eden Preview|" \
    "squashfs-root/dev.eden_emu.eden.desktop"
}

package() {
  install -Dm644 eden-preview.xml "${pkgdir}/usr/share/mime/packages/eden-preview.xml"
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -Dm644 "squashfs-root/dev.eden_emu.eden.desktop" \
    "${pkgdir}/usr/share/applications/eden-preview.desktop"

  # copy icon
  install -Dm644 "squashfs-root/dev.eden_emu.eden.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eden-preview.svg"

  install -dm755 "${pkgdir}/usr/bin"

  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/eden-preview"
}

# Update mime database for file associations
post_install() {
  update-mime-database /usr/share/mime || true
}

