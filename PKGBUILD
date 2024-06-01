# Maintainer:
# Contributor: EatMyVenom <eat.my.venomm@gamil.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>
# Contributor: hagabaka

## options
: ${_widgets=qt5}

## basic info
_pkgname="peazip"
pkgname="$_pkgname-qt5"
pkgver=9.8.0
pkgrel=2
pkgdesc='Cross-platform file and archive manager'
url="https://github.com/peazip/PeaZip"
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')

depends=(
  '7-zip'
  'brotli'
  'zstd'
)
makedepends=(
  'git'
  'lazarus'
  'xmlstarlet'
)
optdepends=(
  'paq8o'
  'quad'
  'unace'
  'upx'
  'zpaq'
)

case "${_widgets::1}" in
  g)
    depends+=("${_widgets}")
    ;;
  q)
    depends+=("${_widgets}pas")
    ;;
esac

provides=('peazip')
conflicts=('peazip')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  # support qt6
  sed -E -e 's&IFDEF LCLQT5&IF DEFINED(LCLQT5) OR DEFINED(LCLQT6)&' -i "$_pkgsrc/peazip-sources/dev/peach.pas"

  # modify compiler options
  cd "$_pkgsrc/peazip-sources/dev"
  for i in metadarkstyle/*.lpk *.lpi; do
    xmlstarlet edit --inplace --delete '//Other' "$i"
    sed -E 's&(</CompilerOptions>)&<Other><CustomOptions Value='\''-O3 -Sa -CX -XX -k"--sort-common --as-needed -z relro -z now"'\''/></Other>\n\1&' \
      -i "$i"
  done
}

build() {
  cd "$_pkgsrc/peazip-sources/dev"
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset="$_widgets" --os=linux --cpu=$ARCH --add-package metadarkstyle/metadarkstyle.lpk
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset="$_widgets" --os=linux --cpu=$ARCH --build-all project_pea.lpi
  lazbuild --lazarusdir=/usr/lib/lazarus --widgetset="$_widgets" --os=linux --cpu=$ARCH --build-all project_peach.lpi
}

package() {
  depends+=('hicolor-icon-theme')

  # binary
  install -Dm755 "$_pkgsrc/peazip-sources/dev/peazip" "$pkgdir/usr/lib/peazip/peazip"
  install -Dm755 "$_pkgsrc/peazip-sources/dev/pea" "$pkgdir/usr/lib/peazip/pea"

  # icon
  cd "$srcdir/$_pkgsrc/peazip-sources/res/share/icons"
  install -Dm644 peazip_{7z,rar,zip}.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/mimetypes"
  install -Dm644 peazip_{add,extract,browse,convert}.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/actions"

  # desktop
  cd "$srcdir/$_pkgsrc/peazip-sources/res/share/batch/freedesktop_integration"
  install -Dm644 peazip.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 peazip.desktop -t "$pkgdir/usr/share/applications"

  # res
  cd "$srcdir/$_pkgsrc/peazip-sources/res/share"
  install -d "$pkgdir/usr/share/peazip"
  cp -r icons lang themes "$pkgdir/usr/share/peazip/"
  install -d "$pkgdir/usr/lib/peazip/res"
  ln -sf /usr/share/peazip "$pkgdir/usr/lib/peazip/res/share"

  # 3rdparty binary
  install -d "$pkgdir/usr/lib/peazip/res/bin"
  install -d "$pkgdir/usr/lib/peazip/res/bin/7z"
  ln -sf /usr/bin/7zz "$pkgdir/usr/lib/peazip/res/bin/7z/7z"
  for _file in brotli/brotli lpaq/lpaq8 paq/paq8o quad/bcm unace/unace upx/upx zpaq/zpaq zstd/zstd; do
    install -d "$pkgdir/usr/lib/peazip/res/bin/$(dirname $_file)/"
    ln -sf "/usr/bin/$(basename $_file)" "$pkgdir/usr/lib/peazip/res/bin/$_file"
  done

  install -d "$pkgdir"/usr/bin/
  ln -sf /usr/lib/peazip/peazip "$pkgdir/usr/bin/peazip"
  ln -sf /usr/lib/peazip/pea "$pkgdir/usr/bin/pea"
}
