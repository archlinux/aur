# Maintainer: Yellow <yellow@example.com>
pkgname=nuvio-desktop-bin
_pkgver=0.1.13-alpha
pkgver=0.1.13alpha
pkgrel=2
pkgdesc="Desktop media app to browse, organize, and play media from sources you add"
arch=('x86_64')

# upstream https://github.com/NuvioMedia/NuvioDesktop does not support linux
url="https://github.com/aelrased/NuvioDesktop"
license=('GPL-3.0-or-later')
provides=('nuvio' 'nuvio-desktop')
conflicts=('nuvio' 'nuvio-desktop')

depends=(
  'ffmpeg'            # libav* (codec/format/filter/device stack)
  'libcdio'           # libcdio.so
  'libcdio-paranoia'  # libcdio_paranoia.so, libcdio_cdda.so
  'libdvdnav'         # libdvdnav.so
  'libbluray'         # libbluray.so
  'luajit'            # libluajit-5.1.so
  'rubberband'        # librubberband.so
  'zimg'              # libzimg.so
  'lcms2'             # liblcms2.so
  'libarchive'        # libarchive.so
  'libpulse'          # libpulse.so
  'libpipewire'       # libpipewire-0.3.so
  'libglvnd'          # libEGL.so, libGL.so
  'mesa'              # libgbm.so
  'libx11'            # libX11.so
  'libxext'           # libXext.so
  'libxfixes'         # libXfixes.so
  'libxrandr'         # libXrandr.so
  'libxss'            # libXss.so
  'libxpresent'       # libXpresent.so
  'libxkbcommon'      # libxkbcommon.so
  'wayland'           # libwayland-client.so, libwayland-cursor.so
  'vulkan-icd-loader' # vulkan ICD loading
)
options=('!strip' '!debug')  # prebuilt binaries: don't strip, don't emit a debug package
source=("nuvio-${_pkgver}.deb::${url}/releases/download/${_pkgver}/nuvio_${_pkgver}_amd64.deb")
noextract=("nuvio-${_pkgver}.deb")
sha256sums=('46016f91c727ceaedc3e3940a815f7919206322bbede105b8d51e38827883952')

package() {
  bsdtar -xf "${srcdir}/nuvio-${_pkgver}.deb" -C "${srcdir}" data.tar.xz
  bsdtar -xpf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  rm -f "${pkgdir}/opt/nuvio/AppRun" \
        "${pkgdir}/opt/nuvio/Nuvio.desktop" \
        "${pkgdir}/opt/nuvio/Nuvio.png"

  install -Dm644 "${pkgdir}/opt/nuvio/lib/nuvio-Nuvio.desktop" \
    "${pkgdir}/usr/share/applications/nuvio.desktop"
  install -Dm644 "${pkgdir}/opt/nuvio/lib/Nuvio.png" \
    "${pkgdir}/usr/share/pixmaps/nuvio.png"
  sed -i 's|^Icon=.*|Icon=nuvio|' "${pkgdir}/usr/share/applications/nuvio.desktop"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod go-w {} +
}
