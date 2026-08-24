# Maintainer: AkitaOnRails <fabio.akita@gmail.com>
pkgname=mangaplus-reader-bin
pkgver=0.9.7
pkgrel=1
pkgdesc="Personal-use desktop reader for MANGA Plus (talks to the official API with your own deviceSecret)"
arch=('x86_64')
url="https://github.com/akitaonrails/frank_mangaplus"
license=('MIT')
depends=('webkit2gtk-4.1' 'hicolor-icon-theme' 'fuse2')
provides=('mangaplus-reader')
conflicts=('mangaplus-reader')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/FRANK.MANGA+_${pkgver}_amd64.AppImage")
sha256sums=('7e27141c471097bd6f7b361ef217ae9673a055d197d1382fb497fbcec528566a')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/mangaplus-reader/mangaplus-reader.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    # The bundle's .desktop file points at Exec=mangaplus-desktop
    # and StartupWMClass=mangaplus-desktop (both come from the
    # binary name Tauri uses). Symlink under that name so the
    # launcher resolves cleanly and WM_CLASS-based taskbar
    # grouping works. Keep mangaplus-reader as the friendlier
    # alias users were already typing.
    ln -s /opt/mangaplus-reader/mangaplus-reader.AppImage \
        "${pkgdir}/usr/bin/mangaplus-desktop"
    ln -s /opt/mangaplus-reader/mangaplus-reader.AppImage \
        "${pkgdir}/usr/bin/mangaplus-reader"

    # Tauri names the .desktop file after productName — for v0.4.0
    # onward that's "FRANK MANGA+", so it ships as
    # "FRANK MANGA+.desktop" with a space and a plus sign. Find
    # it by glob rather than hardcoding the filename (which is
    # exactly the bug that hid the launcher through v0.5.0).
    desktop_src=$(find "${srcdir}/squashfs-root/usr/share/applications/" \
        -maxdepth 1 -name '*.desktop' -print -quit)
    if [[ -n "$desktop_src" && -f "$desktop_src" ]]; then
        install -Dm644 "$desktop_src" \
  "${pkgdir}/usr/share/applications/mangaplus-reader.desktop"
    fi

    # Icons keep their bundle name (mangaplus-desktop.png) so
    # the .desktop file's Icon=mangaplus-desktop reference
    # resolves without sed rewriting.
    for size in 32x32 128x128 256x256; do
        for cand in "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}/apps/"*.png; do
  [[ -f "$cand" ]] || continue
  install -Dm644 "$cand" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/mangaplus-desktop.png"
  break
        done
    done
}
