# Maintainer: Dee.H.Y <dongfengweixiao AT hotmail DOT com>
pkgname=flclash-bin
_pkgname=flclash
pkgver=0.8.62
pkgrel=3
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
)
optdepends=(
  'libayatana-appindicator: Display tray icon'
  'libkeybinder3: Multimedia key support under non Gnome setups'
)
makedepends=(
  'patchelf'
)
source=(
	"${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb"
)
sha256sums=('64f10d1c8bd1d710cebf06c1fd1fd2ca6c1bcb5ae77b4ebcba1ed92276ccded9')

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
