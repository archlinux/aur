# Maintainer: Yellow <yellow@example.com>
pkgname=nuvio-desktop-bin
_pkgver=0.1.37-alpha
pkgver=0.1.37alpha
pkgrel=1
pkgdesc="Desktop media app to browse, organize, and play media from sources you add"
arch=('x86_64')

url="https://github.com/NuvioMedia/NuvioDesktop"
license=('GPL-3.0-or-later')
provides=('nuvio' 'nuvio-desktop')
conflicts=('nuvio' 'nuvio-desktop')

depends=(
  'alsa-lib'
  'brotli'
  'bzip2'
  'expat'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib-networking'
  'glibc'
  'gst-libav'
  'gst-plugins-good'
  'libglvnd'
  'libpng'
  'libx11'
  'libxcomposite'
  'libxext'
  'libxi'
  'libxrender'
  'libxtst'
  'mpv'
  'webkit2gtk-4.1'
  'xdg-utils'
)
options=('!strip' '!debug')  # prebuilt binaries: don't strip, don't emit a debug package
source=("nuvio-${_pkgver}.deb::${url}/releases/download/${_pkgver}/Nuvio-Linux-${CARCH}-${_pkgver}.deb")
noextract=("nuvio-${_pkgver}.deb")
sha256sums=('72bf0c43635735277fa351cbaaddbf575a0f2cdfd9a25cb8bd8ff847568a1afb')

package() {
  bsdtar -xf "${srcdir}/nuvio-${_pkgver}.deb" -C "${srcdir}" data.tar.zst
  bsdtar -xpf "${srcdir}/data.tar.zst" -C "${pkgdir}"

  install -Dm644 "${pkgdir}/opt/nuvio/lib/Nuvio.png" \
    "${pkgdir}/usr/share/pixmaps/nuvio.png"
  sed -i 's|^Icon=.*|Icon=nuvio|' "${pkgdir}/usr/share/applications/nuvio.desktop"

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod go-w {} +
}
