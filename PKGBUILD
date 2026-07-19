pkgname=gephgui-wry-bin
pkgver=5.8.0
pkgrel=1
pkgdesc="Geph desktop GUI"
arch=('x86_64')
url="https://github.com/geph-official/gephgui-wry"
download_url="https://github.com/geph-official/gephgui-pkg/releases/download"
_xdotool_pkgver=3.20211022.1
license=('MPL-2.0' 'BSD-3-Clause')
provides=('gephgui-wry')
conflicts=('gephgui-wry' 'geph5-client' 'geph5-client-git')
depends=(
  'webkit2gtk-4.1'
  'polkit'
  'nftables'
  'iproute2'
  'libx11'
  'libxtst'
  'libxinerama'
  'libxkbcommon'
)
makedepends=('patchelf')
options=('!strip' '!debug')
source=(
  "gephgui-wry-bin-$pkgver.deb::$download_url/v$pkgver/geph-linux-${pkgver}.deb"
  "geph.png::https://raw.githubusercontent.com/geph-official/gephgui-pkg/refs/heads/master/flatpak/icons/256x256/apps/io.geph.GephGui.png"
  "xdotool-${_xdotool_pkgver}.tar.gz::https://github.com/jordansissel/xdotool/releases/download/v${_xdotool_pkgver}/xdotool-${_xdotool_pkgver}.tar.gz"
)
sha256sums=('eb1204ed2479b1128913fe5de6efa59bc90fe9df9412f1e8d8a29e7248c85374'
            '6b1ee5653cdc69a4e92125950cca5f2bd8114cd786a9a686aa31692b9fcc287a'
            '96f0facfde6d78eacad35b91b0f46fecd0b35e474c03e00e30da3fdd345f9ada')

build() {
  make -C "xdotool-${_xdotool_pkgver}" WITHOUT_RPATH_FIX=1
}

package() {
  bsdtar -xf "${srcdir}/data.tar.zst" -C "$pkgdir"

  install -Dm755 "${srcdir}/xdotool-${_xdotool_pkgver}/libxdo.so.3" \
    "$pkgdir/usr/lib/gephgui-wry/libxdo.so.3"
  install -Dm644 "${srcdir}/xdotool-${_xdotool_pkgver}/COPYRIGHT" \
    "$pkgdir/usr/share/licenses/$pkgname/xdotool-COPYRIGHT"
  install -Dm644 "${srcdir}/geph.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/geph.png"
  patchelf --set-rpath '$ORIGIN/../lib/gephgui-wry' "$pkgdir/usr/bin/gephgui-wry"

  find "$pkgdir" -type d -exec chmod 755 {} +
  find "$pkgdir" -type f -exec chmod 644 {} +
  find "$pkgdir/usr/bin" -type f -exec chmod 755 {} + 2>/dev/null || true
  find "$pkgdir/usr/lib" -type f -exec chmod 755 {} + 2>/dev/null || true
}
