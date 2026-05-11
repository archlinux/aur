# Maintainer: Christos Longros <chris.longros@gmail.com>

pkgname=itksnap-bin
_pkgname=itksnap
pkgver=4.4.0
_build=20250909
pkgrel=3
pkgdesc="Interactive 3D medical image segmentation tool (ITK-SNAP, prebuilt binary)"
arch=('x86_64')
url="https://www.itksnap.org"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'libglvnd'
  'fontconfig'
  'dbus'
  'glib2'
  'libxkbcommon-x11'
  'libxkbcommon'
  'libx11'
  'libxcb'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-keysyms'
  'xcb-util-renderutil'
  'xcb-util-wm'
  'libpng'
  'zlib'
  'zstd'
  'brotli'
  'pcre2'
  'expat'
  'bzip2'
  'systemd-libs'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!strip')
source=("https://sourceforge.net/projects/itk-snap/files/itk-snap/${pkgver}/itksnap-${pkgver}-${_build}-Linux-x86_64.tar.gz"
        "itksnap.desktop")
sha256sums=('10524c143d329c197a6ce05ac112dcd5686f9c0d4b3b985c2287c02de923948c'
            '5ffdbb0f8ebad80ebb463a6471abc2b9a202f8032f4d70a58cee999d694173ce')

_bins=(itksnap itksnap-wt c2d c3d c4d c3d_affine_tool greedy greedy_template_average greedy_propagation multi_chunk_greedy)

package() {
  local _srcdir="$srcdir/itksnap-${pkgver}-${_build}-Linux-x86_64"

  install -dm755 "$pkgdir/opt/itksnap-bin"
  cp -a "$_srcdir/bin" "$_srcdir/lib" "$_srcdir/translations" "$pkgdir/opt/itksnap-bin/"

  install -dm755 "$pkgdir/usr/bin"
  for b in "${_bins[@]}"; do
    printf '#!/bin/sh\nexec /opt/itksnap-bin/bin/%s "$@"\n' "$b" > "$pkgdir/usr/bin/$b"
    chmod 755 "$pkgdir/usr/bin/$b"
  done

  install -Dm644 "$srcdir/itksnap.desktop" "$pkgdir/usr/share/applications/itksnap.desktop"
}
