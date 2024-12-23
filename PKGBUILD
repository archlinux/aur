# Maintainer:

## options
: ${_widgets=qt6}
: ${_commit=c68f4cda022fed633c1b51cbe7718d60c58da2ba} # 10.1.0

_pkgname="peazip"
pkgname="$_pkgname"
pkgver=10.1.0
pkgrel=2
pkgdesc="Cross-platform file and archive manager (${_widgets^})"
url="https://github.com/peazip/PeaZip"
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')

makedepends=(
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

_pkgsrc="PeaZip-$_commit"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver-${_commit::7}.$_pkgext"::"https://github.com/peazip/PeaZip/archive/$_commit.$_pkgext")
sha256sums=('SKIP')

_packets=(
  "$_pkgsrc"/peazip-sources/dev/metadarkstyle/metadarkstyle.lpk
  "$_pkgsrc"/peazip-sources/dev/project_pea.lpi
  "$_pkgsrc"/peazip-sources/dev/project_peach.lpi
)

prepare() {
  # support qt6
  sed -E -e 's&IFDEF LCLQT5&IF DEFINED(LCLQT5) OR DEFINED(LCLQT6)&g' -i "$_pkgsrc/peazip-sources/dev/peach.pas"

  # use system binaries
  sed -E -e 's&(\bHSYSBIN\b\s*)=\s*[0-9];&\1= 2;&' \
    -i "$_pkgsrc/peazip-sources/dev/peach.pas"

  # set paths, needs trailing slash
  sed -E \
    -e 's&(\bHBINPATH\b\s*)=\s*'\'\'';&\1= '\''/usr/bin/'\'';&' \
    -e 's&(\bHSHAREPATH\b\s*)=\s*'\'\'';&\1= '\'"/usr/share/$_pkgname/"\'';&' \
    -i "$_pkgsrc/peazip-sources/dev/peach.pas"

  # modify compiler options
  for i in ${_packets[@]}; do
    xmlstarlet edit --inplace --delete '//Other' "$i"
    sed -E 's&(</CompilerOptions>)&<Other><CustomOptions Value='\''-O3 -Sa -CX -XX -k"--sort-common --as-needed -z relro -z now"'\''/></Other>\n\1&' \
      -i "$i"
  done
}

build() {
  local _laz_opts=(
    --build-all
    --cpu="$CARCH"
    --lazarusdir='/usr/lib/lazarus'
    --os='linux'
    --primary-config-path='config'
    --widgetset="$_widgets"
  )

  for i in ${_packets[@]}; do
    lazbuild "${_laz_opts[@]}" "$i"
  done
}

package() {
  depends+=(
    '7zip'
    'brotli'
    'zstd'
  )
  depends+=('hicolor-icon-theme')

  local _path_src

  # binaries
  _path_src="$_pkgsrc/peazip-sources/dev"
  install -Dm755 "$_path_src/peazip" "$pkgdir/usr/bin/peazip"
  install -Dm755 "$_path_src/pea" "$pkgdir/usr/bin/pea"

  # icons
  _path_src="$_pkgsrc/peazip-sources/res/share/icons"
  install -Dm644 "$_path_src"/peazip_{7z,rar,zip}.png -t "$pkgdir/usr/share/icons/hicolor/256x256/mimetypes"
  install -Dm644 "$_path_src"/peazip_{add,extract,browse,convert}.png -t "$pkgdir/usr/share/icons/hicolor/256x256/actions"

  # launcher
  _path_src="$_pkgsrc/peazip-sources/res/share/batch/freedesktop_integration"
  install -Dm644 "$_path_src"/peazip.png -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "$_path_src"/peazip.desktop -t "$pkgdir/usr/share/applications"

  # res
  _path_src="$_pkgsrc/peazip-sources/res/share"
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp --reflink=auto -a "$_path_src"/{icons,lang,themes} "$pkgdir/usr/share/$_pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
