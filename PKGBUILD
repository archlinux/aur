# Maintainer: AkitaOnRails <fabio.akita@gmail.com>
pkgname=frank-scanlation-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Kindle-like desktop reader for ad-hoc scanlation websites, with new-chapter notifications"
arch=('x86_64')
url="https://github.com/akitaonrails/frank_scanlation"
license=('MIT')
depends=('webkit2gtk-4.1' 'hicolor-icon-theme' 'fuse2')
provides=('frank-scanlation')
conflicts=('frank-scanlation')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/FRANK.Scanlation_${pkgver}_amd64.AppImage")
sha256sums=('7db166b73269871191118df47216628bb50aab126bf90bca3be51678461f789e')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/frank-scanlation/frank-scanlation.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    # The bundle's .desktop file points at Exec=scanlation-desktop
    # and StartupWMClass=scanlation-desktop (both come from the
    # binary name Tauri uses). Symlink under that name so the
    # launcher resolves cleanly and WM_CLASS-based taskbar
    # grouping works. Keep frank-scanlation as the friendlier
    # alias.
    ln -s /opt/frank-scanlation/frank-scanlation.AppImage \
        "${pkgdir}/usr/bin/scanlation-desktop"
    ln -s /opt/frank-scanlation/frank-scanlation.AppImage \
        "${pkgdir}/usr/bin/frank-scanlation"

    # Tauri names the .desktop file after productName ("FRANK
    # Scanlation" → "FRANK Scanlation.desktop"). Find it by glob
    # rather than hardcoding the filename.
    desktop_src=$(find "${srcdir}/squashfs-root/usr/share/applications/" \
        -maxdepth 1 -name '*.desktop' -print -quit)
    if [[ -n "$desktop_src" && -f "$desktop_src" ]]; then
        install -Dm644 "$desktop_src" \
  "${pkgdir}/usr/share/applications/frank-scanlation.desktop"
    fi

    # Icons keep their bundle name (scanlation-desktop.png) so
    # the .desktop file's Icon= reference resolves without sed
    # rewriting.
    for size in 32x32 128x128 256x256; do
        for cand in "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}/apps/"*.png; do
  [[ -f "$cand" ]] || continue
  install -Dm644 "$cand" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/scanlation-desktop.png"
  break
        done
    done
}
