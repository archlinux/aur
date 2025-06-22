# Maintainer:

## options
: ${_widgets:=qt6}
: ${_branch=develop}

_pkgname="transgui"
pkgname="$_pkgname-git"
pkgver=5.18.8.r1.ga704302
pkgrel=1
pkgdesc="Transmission BitTorrent client (${_widgets^})"
url="https://github.com/lighterowl/transgui"
license=("GPL-2.0-or-later")
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
)

provides=("transgui=${pkgver%%.g*}")
conflicts=(
  "transgui"
  "transgui-gtk"
  "transgui-qt"
)

options=('!strip' '!debug')

_pkgsrc="lighterowl.transgui"
source=("$_pkgsrc"::"git+$url.git#branch=${_branch:-develop}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g;s&\.[a-zA-Z]+\.&.&'
}

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth 1

  # set compiler options
  sed -E 's&<CustomOptions Value=".*".*/>&<CustomOptions Value="-O3 -Sa -CX -XX -k--sort-common -k--as-needed -k-z -krelro -k-z -know"/>&' \
    -i "transgui.lpi"
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

  lazbuild "${_laz_opts[@]}" "$_pkgsrc/transgui.lpi"
}

package() {
  install -Dm755 "$_pkgsrc/units/transgui" "$pkgdir/usr/bin/transgui"

  install -Dm644 "$_pkgsrc/transgui.png" -t "$pkgdir/usr/share/pixmaps/"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/transgui.desktop" << END
[Desktop Entry]
Name=Transmission Remote GUI
Comment=Cross platform remote GUI for the Transmission daemon
Exec=transgui %U
Icon=transgui
Terminal=false
Type=Application
Categories=Network;FileTransfer;P2P;GTK;
MimeType=application/x-bittorrent;application/x-torrent;x-scheme-handler/magnet;
END

  install -Dm644 "$_pkgsrc/lang"/transgui.* -t "$pkgdir/usr/share/transgui/lang"
  rm "$pkgdir/usr/share/transgui/lang/transgui.template"
}
