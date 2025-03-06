# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
pkgname=flclash-bin
_pkgname=flclash
pkgver=0.8.78
pkgrel=1
pkgdesc="A multi-platform proxy client based on ClashMeta,simple and easy to use, open-source and ad-free."
arch=('x86_64')
url="https://github.com/chen08209/FlClash"
license=('GPL-3.0-only')
conflicts=("flclash-git" "flclash")
install="flclash.install"
depends=(
  'cairo'
  'at-spi2-core'
  'hicolor-icon-theme'
  'libdbusmenu-glib'
  'gtk3'
  'libepoxy'
  'pango'
  'gdk-pixbuf2'
  'harfbuzz'
  'fontconfig'
  'libayatana-indicator'
  'ayatana-ido'
  'glib2'
  'glibc'
  'gcc-libs'
  'zlib'
  'libayatana-appindicator'
  'libkeybinder3'
)
makedepends=(
  'patchelf'
)
source=(
	"${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
)
sha256sums=('4fa485227ff4ac21ae534ef5200b14db4bb0ae91ce6159a269a5f8f20688a604')

package() {
    msg "Converting debian package..."
    cd "$srcdir"
    tar -I zstd -xvf data.tar.zst -C "$pkgdir"

    # runpath
    patchelf --set-rpath '$ORIGIN/lib' "$pkgdir"/usr/share/FlClash/FlClash
    for i in "$pkgdir"/usr/share/FlClash/lib/*.so; do
      echo "find so $i"
      [ -z "$(patchelf --print-rpath "$i")" ] && continue
      patchelf --set-rpath '$ORIGIN' "$i"
    done

    # permissions
    chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
