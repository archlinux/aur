# Maintainer:

## options
: ${_widgets=qt6}
: ${_commit=34fa5f9e778111c22dc1e72c6c0a0fff8233831c} # 9.9.1

## basic info
_pkgname="peazip"
pkgname="$_pkgname"
pkgver=9.9.1
pkgrel=2
pkgdesc="Cross-platform file and archive manager (${_widgets^})"
url="https://github.com/peazip/PeaZip"
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')

makedepends=(
  'git'
  'lazarus'
  'xmlstarlet'
)
optdepends=(
  'unace'
  'upx'
)

case "${_widgets::1}" in
  g)
    depends+=("${_widgets}")
    ;;
  q)
    depends+=("${_widgets}pas")
    ;;
esac

options=('!debug')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#commit=$_commit")
sha256sums=('SKIP')

_packets=(
  "$_pkgsrc"/peazip-sources/dev/metadarkstyle/metadarkstyle.lpk
  "$_pkgsrc"/peazip-sources/dev/project_pea.lpi
  "$_pkgsrc"/peazip-sources/dev/project_peach.lpi
)

prepare() {
  # support qt6
  sed -E -e 's&IFDEF LCLQT5&IF DEFINED(LCLQT5) OR DEFINED(LCLQT6)&' -i "$_pkgsrc/peazip-sources/dev/peach.pas"

  # modify compiler options
  for i in ${_packets[@]}; do
    xmlstarlet edit --inplace --delete '//Other' "$i"
    sed -E 's&(</CompilerOptions>)&<Other><CustomOptions Value='\''-O3 -Sa -CX -XX -k"--sort-common --as-needed -z relro -z now"'\''/></Other>\n\1&' \
      -i "$i"
  done
}

_pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  mkdir -p build

  local _laz_opts=(
    --build-all
    --cpu="$CARCH"
    --lazarusdir="/usr/lib/lazarus"
    --os=linux
    --primary-config-path=build
    --widgetset="$_widgets"
  )

  for i in ${_packets[@]}; do
    lazbuild "${_laz_opts[@]}" "$i"
  done
}

package() {
  depends+=(
    'brotli'
    'p7zip'
    'zstd'
  )
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
  local _dir _file
  for _file in 7z/7z brotli/brotli unace/unace upx/upx zstd/zstd; do
    _dir="$(dirname $_file)"
    install -dm755 "$pkgdir/usr/lib/peazip/res/bin/$_dir/"
    ln -sf "/usr/bin/$_dir" "$pkgdir/usr/lib/peazip/res/bin/$_file"
  done

  install -d "$pkgdir"/usr/bin/
  ln -sf /usr/lib/peazip/peazip "$pkgdir/usr/bin/peazip"
  ln -sf /usr/lib/peazip/pea "$pkgdir/usr/bin/pea"
}
