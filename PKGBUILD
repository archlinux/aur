# Maintainer:

## options
: ${_widgets=qt6}

_pkgname="peazip"
pkgname="$_pkgname"
pkgver=10.6.1
pkgrel=1
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

_pkgsrc="PeaZip-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"https://github.com/peazip/PeaZip/archive/$pkgver.$_pkgext")
sha256sums=('93d5145d09279db1b168469251e4b3b64b59ea13b2cfb0f487e1fd26a5d40b6b')

_packets=(
  "$_pkgsrc"/peazip-sources/dev/metadarkstyle/metadarkstyle.lpk
  "$_pkgsrc"/peazip-sources/dev/project_pea.lpi
  "$_pkgsrc"/peazip-sources/dev/project_peach.lpi
)

prepare() {
  # use system binaries
  sed -E -e 's&(\bHSYSBIN\b\s*)=\s*[0-9];&\1= 2;&' \
    -i "$_pkgsrc/peazip-sources/dev/peach.pas"

  # set paths, needs trailing slash
  sed -E \
    -e 's&(\bHBINPATH\b\s*)=\s*'\'\'';&\1= '\''/usr/bin/'\'';&' \
    -e 's&(\bHSHAREPATH\b\s*)=\s*'\'\'';&\1= '\'"/usr/share/$_pkgname/"\'';&' \
    -i "$_pkgsrc/peazip-sources/dev/peach.pas"

  # check for version mismatch
  local PEAZIPVERSION PEAZIPREVISION
  PEAZIPVERSION=$(grep -Po1 "(?<=PEAZIPVERSION\s?=\s?')([0-9.]+)(?=';)" "$_pkgsrc/peazip-sources/dev/peach.pas")
  PEAZIPREVISION=$(grep -Po1 "(?<=PEAZIPREVISION\s?=\s?')([0-9.]+)(?=';)" "$_pkgsrc/peazip-sources/dev/peach.pas")
  if [[ "$pkgver" != "${PEAZIPVERSION:-0.0}${PEAZIPREVISION:=.0}" ]]; then
    printf "%s    warning: %sversion mismatch.%s %s != %s\n" \
      "$(
        tput setaf 3
        tput bold
      )" \
      "$(tput setaf 7)" \
      "$(tput sgr0)" \
      "$pkgver" \
      "${PEAZIPVERSION:-0.0}${PEAZIPREVISION:=.0}"
  fi

  # remove buttons from about dialog
  local _buttons=(
    Form_peach.baboutbin
    Form_peach.baboutchangelog
    Form_peach.baboutfaq
    Form_peach.baboutlocalhelp
    Form_peach.baboutplugindir
    Form_peach.baboutplugins
    Form_peach.baboutremoveunace
    Form_peach.baboutremoveunrar
    Form_peach.baboutsupport
    Form_peach.baboutthemes
    Form_peach.babouttos
    Form_peach.babouttracker
    Form_peach.babouttranslations
    Form_peach.baboutup
    Form_peach.baboutweb
  )
  for i in ${_buttons[@]}; do
    sed -E -e "/^${i//./\\.}.Caption:=/s&^.*\$&${i}.Visible:=False;&" -i "$_pkgsrc/peazip-sources/dev/peach.pas"
  done

  # compiler/linker options
  for i in ${_packets[@]}; do
    xmlstarlet edit --inplace --delete '//Other' "$i"
    sed -E 's&(</CompilerOptions>)&<Other><CustomOptions Value="-O3 -Sa -CX -XX -k--sort-common -k--as-needed -k-z -krelro -k-z -know -k-z -kibt -k-z -kshstk"/></Other>\n\1&' \
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
  mkdir -pm755 "$pkgdir/usr/share/$_pkgname"
  cp -a "$_path_src"/{icons,lang,themes} "$pkgdir/usr/share/$_pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
