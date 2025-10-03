# Maintainer:

## options
: ${_widgets:=qt6}

_pkgname="lazpaint"
pkgname="$_pkgname-git"
pkgver=7.3.r26.gd6e7cc4
pkgrel=1
pkgdesc="Image editor written in Free Pascal with Lazarus (${_widgets^})"
url="https://github.com/bgrabitmap/lazpaint"
license=('GPL-3.0-or-later')
arch=('x86_64')

case "${_widgets::1}" in
  g)
    depends=("${_widgets}")
    ;;
  q)
    depends=("${_widgets}pas")
    ;;
esac

makedepends=(
  'git'
  'lazarus'
  'xmlstarlet'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

options=('!strip' '!debug')

_pkgsrc="$_pkgname"
source=(
  "git+https://github.com/bgrabitmap/lazpaint.git"
  "git+https://github.com/bgrabitmap/bgrabitmap.git"
  "git+https://github.com/bgrabitmap/bgracontrols.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

_packets=(
  bgrabitmap/bgrabitmap/bgrabitmappack.lpk
  bgracontrols/bgracontrols.lpk
  lazpaint/lazpaintcontrols/lazpaintcontrols.lpk
  lazpaint/lazpaint/lazpaint.lpi
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  # modify compiler options
  for i in ${_packets[@]}; do
    xmlstarlet ed -L \
      -d "//CompilerOptions/Other" \
      -s "//CompilerOptions" -t elem -n Other -v "" \
      -s "//CompilerOptions/Other" -t elem -n CustomOptions -v "" \
      -a "//CompilerOptions/Other/CustomOptions" -t attr -n Value \
      -v "-O3 -Sa -CX -XX -k--sort-common -k--as-needed -k-z -krelro -k-z -know" \
      "$i"
  done
}

build() {
  mkdir -p build

  local _laz_opts=(
    --build-all
    --build-mode=Release
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
  depends+=('python')

  local _release="$_pkgsrc/lazpaint/release"
  local _resources="$_pkgsrc/resources"

  # exec
  install -Dm755 "$_release"/bin/lazpaint -t "$pkgdir/usr/bin/"

  # icon
  install -Dm644 "$_resources"/icon/128x128.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"

  # desktop
  install -Dm644 "$_release"/debian/applications/lazpaint.desktop -t "$pkgdir/usr/share/applications/"

  # man
  install -Dm644 "$_release/debian/man/man1/lazpaint.1" -t "$pkgdir/usr/share/man/man1/"

  # resources
  install -dm755 "$pkgdir/usr/share/$_pkgname/scripts"
  cp -r "$_release"/bin/i18n "$pkgdir/usr/share/$_pkgname/"
  cp -r "$_release"/bin/models "$pkgdir/usr/share/$_pkgname/"
  cp -r "$_resources"/scripts/{lazpaint,*.py} "$pkgdir/usr/share/$_pkgname/scripts/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
