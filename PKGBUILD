# Maintainer:

## options
: ${_widgets=qt6}

## basic info
_pkgname="winff"
pkgname="$_pkgname-git"
pkgver=1.6.4.r1.gac9211f
pkgrel=2
pkgdesc="FFmpeg frontend written in Free Pascal with Lazarus (${_widgets^})"
url="https://github.com/WinFF/winff"
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
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=(
  'winff'
  'winff-common'
)

options=('!debug')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
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

  lazbuild "${_laz_opts[@]}" "$_pkgsrc/winff/winff.lpr"
}

package() {
  depends+=('ffmpeg')

  install -Dm755 "$_pkgsrc"/winff/winff -t "$pkgdir/usr/bin/"

  install -Dm644 "$_pkgsrc"/winff/presets.xml -t "$pkgdir/usr/share/$_pkgname/"
  cp -a "$_pkgsrc"/winff/languages "$pkgdir/usr/share/$pkgname/"

  #install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  #cp -a docs/* "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 "$_pkgsrc"/winff/winff.1 -t "$pkgdir/usr/share/man/man1/"

  install -Dm644 "$_pkgsrc"/winff/winff-icons/48x48/winff.png -t "$pkgdir"/usr/share/pixmaps/

  install -Dm644 /dev/stdin "$pkgdir"/usr/share/applications/winff.desktop << END
[Desktop Entry]
Type=Application
Name=Winff
GenericName=Video converter
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
Terminal=false
StartupNotify=false
Categories=AudioVideo;AudioVideoEditing;Video;
END

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
