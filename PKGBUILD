# Maintainer:

## useful links
# https://github.com/transmission-remote-gui/transgui

## options
: ${_build_gtk2:=true}
: ${_build_gtk3:=false}
: ${_build_qt5:=true}
: ${_build_qt6:=false}

: ${_build_git:=true}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="transgui"
pkgbase="$_pkgname${_pkgtype:-}"
pkgver=5.18.0.r90.g25df397
pkgrel=1
pkgdesc="Feature-rich client for Transmission Remote"
url="https://github.com/transmission-remote-gui/transgui"
license=("GPL-2.0-or-later")
arch=('i686' 'x86_64')

unset pkgname
[[ "${_build_gtk2::1}" == "t" ]] && pkgname+=("$_pkgname-gtk2${_pkgtype:-}")
[[ "${_build_gtk3::1}" == "t" ]] && pkgname+=("$_pkgname-gtk3${_pkgtype:-}")
[[ "${_build_qt5::1}" == "t" ]] && pkgname+=("$_pkgname-qt5${_pkgtype:-}")
[[ "${_build_qt6::1}" == "t" ]] && pkgname+=("$_pkgname-qt6${_pkgtype:-}")

makedepends=(
  'git'
  'lazarus'
)

[[ "${_build_gtk2::1}" == "t" ]] && makedepends+=('gtk2')
[[ "${_build_gtk3::1}" == "t" ]] && makedepends+=('gtk3')
[[ "${_build_qt5::1}" == "t" ]] && makedepends+=('qt5pas')
[[ "${_build_qt6::1}" == "t" ]] && makedepends+=('qt6pas')

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
  cat >transgui.desktop <<END
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

  mkdir -p build-gtk{2,3}
  mkdir -p build-qt{5,6}
}

_package_common() {
  install -Dm644 "lang"/transgui.* -t "$pkgdir/usr/share/transgui/lang"
  #install -Dm644 README.md history.txt LICENSE -t "$pkgdir/usr/share/doc/$pkgbase"

  install -Dm644 "transgui.png" -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 "$srcdir/transgui.desktop" -t "$pkgdir/usr/share/applications/"

  rm "$pkgdir/usr/share/transgui/lang/transgui.template"
}

package_transgui-gtk2-git() {
  depends=('gtk2')

  provides+=("transgui-gtk=${pkgver%%.r*}")

  cd "$_pkgsrc"
  make clean

  lazbuild "transgui.lpi" \
    --lazarusdir="/usr/lib/lazarus" \
    --widgetset="gtk2" \
    --primary-config-path=../build-gtk2

  install -Dm755 "units/transgui" "$pkgdir/usr/bin/transgui"

  _package_common
}

package_transgui-gtk3-git() {
  depends=('gtk3')

  provides+=("transgui-gtk=${pkgver%%.r*}")

  cd "$_pkgsrc"
  make clean

  lazbuild "transgui.lpi" \
    --lazarusdir="/usr/lib/lazarus" \
    --widgetset="gtk3" \
    --primary-config-path=../build-gtk3

  install -Dm755 "units/transgui" "$pkgdir/usr/bin/transgui"

  _package_common
}

package_transgui-qt5-git() {
  depends=('qt5pas')

  provides+=("transgui-qt=${pkgver%%.r*}")

  cd "$_pkgsrc"
  make clean

  lazbuild "transgui.lpi" \
    --lazarusdir="/usr/lib/lazarus" \
    --widgetset="qt5" \
    --primary-config-path=../build-qt5

  install -Dm755 "units/transgui" "$pkgdir/usr/bin/transgui"

  _package_common
}

package_transgui-qt6-git() {
  depends=('qt6pas')

  provides+=("transgui-qt=${pkgver%%.r*}")

  cd "$_pkgsrc"
  make clean

  lazbuild -B "transgui.lpi" \
    --lazarusdir="/usr/lib/lazarus" \
    --widgetset="qt6" \
    --primary-config-path=../build-qt6

  install -Dm755 "units/transgui" "$pkgdir/usr/bin/transgui"

  _package_common
}
