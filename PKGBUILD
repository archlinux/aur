# Maintainer: RadicalMuffinMan <support@moonfin.app>
# Written by the Moonfin release workflow. Edits here are overwritten.
pkgname=moonfin-bin
pkgver=2.5.0
pkgrel=1
pkgdesc='Jellyfin & Emby media client for Linux (binary release)'
arch=('x86_64')
url='https://github.com/Moonfin-Client/Moonfin-Core'
license=('GPL-3.0-or-later')
depends=('gtk3' 'glib2' 'libsecret' 'webkit2gtk-4.1' 'mpv' 'harfbuzz-icu')
provides=('moonfin')
conflicts=('moonfin')
# The binary and the bundled libraries ship stripped already, and
# makepkg's pass over a prebuilt Flutter bundle can break it.
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Moonfin-Client/Moonfin-Core/releases/download/${pkgver}/Moonfin_Linux_v${pkgver}.tar.gz")
sha256sums=('82db8eb331f9ce1ce67418b2be7a1b0ce15f8d0543d139e6daeffa370519ce15')

package() {
  cd "${srcdir}/moonfin-${pkgver}"

  # Everything except the shared files is the app itself. Listing what
  # to skip rather than what to take keeps this working when the
  # Flutter bundle gains a directory.
  install -dm755 "${pkgdir}/usr/lib/moonfin"
  for entry in *; do
    case "${entry}" in
      share|README.txt) continue ;;
    esac
    cp -a "${entry}" "${pkgdir}/usr/lib/moonfin/"
  done
  chmod 755 "${pkgdir}/usr/lib/moonfin/moonfin" \
    "${pkgdir}/usr/lib/moonfin/moonfin-bin"

  # These come from the depends list, and the launcher searches the
  # bundled lib directory first, so leftover copies would shadow the
  # system ones.
  for lib in mpv ass secret-1 avcodec avdevice avfilter avformat \
    avutil postproc swresample swscale va va-drm va-wayland va-x11 \
    vdpau; do
    rm -f "${pkgdir}/usr/lib/moonfin/lib/lib${lib}.so."*
  done

  # The launcher in the bundle reads its own directory to find the
  # libraries, so it is called by its real path rather than linked to.
  install -dm755 "${pkgdir}/usr/bin"
  printf '%s\n' '#!/bin/sh' 'exec /usr/lib/moonfin/moonfin "$@"' \
    > "${pkgdir}/usr/bin/moonfin"
  chmod 755 "${pkgdir}/usr/bin/moonfin"

  install -Dm644 share/applications/org.moonfin.linux.desktop \
    -t "${pkgdir}/usr/share/applications"
  install -Dm644 share/metainfo/org.moonfin.linux.metainfo.xml \
    -t "${pkgdir}/usr/share/metainfo"
  install -Dm644 share/icons/hicolor/512x512/apps/org.moonfin.linux.png \
    -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -Dm644 share/pixmaps/org.moonfin.linux.png \
    -t "${pkgdir}/usr/share/pixmaps"
}
