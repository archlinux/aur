# Maintainer:

## useful links
# https://github.com/transmission-remote-gui/transgui

## options
: ${_widgets:=qt6}

## basic info
_pkgname="transgui"
pkgname="$_pkgname-git"
pkgver=5.18.0.r90.g25df397
pkgrel=2
pkgdesc="Feature-rich client for Transmission Remote (${_widgets^})"
url="https://github.com/transmission-remote-gui/transgui"
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

provides=("transgui=${pkgver%%.r*}")
conflicts=(
  "transgui"
  "transgui-gtk"
  "transgui-qt"
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cat > transgui.desktop << END
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

  # set compiler options
  sed -E 's&<CustomOptions Value=".*".*/>&<CustomOptions Value='\''-O3 -Sa -CX -XX -k"--sort-common --as-needed -z relro -z now"'\''/>&' \
    -i "$_pkgsrc/transgui.lpi"
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
  install -Dm644 "transgui.desktop" -t "$pkgdir/usr/share/applications/"

  install -Dm644 "$_pkgsrc/lang"/transgui.* -t "$pkgdir/usr/share/transgui/lang"
  rm "$pkgdir/usr/share/transgui/lang/transgui.template"
}
