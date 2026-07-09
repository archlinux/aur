# Maintainer: Yellow <yellow@example.com>
pkgname=nuvio-desktop-bin
_pkgver=0.1.9-alpha
pkgver=0.1.9alpha
pkgrel=1
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
source=("nuvio-${_pkgver}.deb::${url}/releases/download/${_pkgver}/Nuvio-${_pkgver}_amd64.deb")
noextract=("nuvio-${_pkgver}.deb")
sha256sums=('e19f978cea7d820436d694650e03f08a82d23f226aa65b1352d2da99d69a1db6')

package() {
  bsdtar -xf "${srcdir}/nuvio-${_pkgver}.deb" -C "${srcdir}" data.tar.xz
  bsdtar -xpf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  rm -f "${pkgdir}/opt/nuvio/AppRun" \
        "${pkgdir}/opt/nuvio/Nuvio.desktop" \
        "${pkgdir}/opt/nuvio/Nuvio.png"

  # The .deb ships 775 directories and some 777 files; normalize to Arch
  # conventions (755 dirs, drop group/other write from files, keep exec bits).
  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod go-w {} +
}
