# Maintainer:
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>
# Contributor: Dobroslaw Kijowski <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

_pkgbase='transgui'
pkgbase="$_pkgbase-git"
pkgver=5.18.0.r88.gb1f5c23
pkgrel=1
pkgdesc='A feature rich cross platform Transmission BitTorrent client. Faster and has more functionality than the built-in web GUI.'
url="https://github.com/transmission-remote-gui/transgui"
license=("GPL-2.0-or-later")
arch=('i686' 'x86_64')

pkgname=(
  "$_pkgbase-qt-git"
  "$_pkgbase-gtk-git"
)

makedepends=(
  'git'
  'gtk2'
  'lazarus'
  'qt5pas'
)

provides=("transgui=${pkgver%%.r*}")
conflicts=("transgui")

_pkgsrc="$_pkgbase"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
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

  cd "$_pkgsrc"
  mkdir -p "${srcdir:?}/build-qt" "${srcdir:?}/build-gtk"
}

package_transgui-qt-git() {
  depends=('qt5pas')

  provides+=("transgui-qt=${pkgver%%.r*}")
  conflicts+=(
    "transgui-gtk"
    "transgui-qt"
  )

  cd "$_pkgsrc"
  make clean

  lazbuild "transgui.lpi" \
    --lazarusdir="/usr/lib/lazarus" \
    --widgetset="qt5" \
    --primary-config-path=../build-qt

  _package_common
}

package_transgui-gtk-git() {
  depends=('gtk2')

  provides+=("transgui-gtk=${pkgver%%.r*}")
  conflicts+=(
    "transgui-gtk"
    "transgui-qt"
  )

  cd "$_pkgsrc"
  make clean

  lazbuild "transgui.lpi" \
    --lazarusdir="/usr/lib/lazarus" \
    --widgetset="gtk2" \
    --primary-config-path=../build-gtk

  _package_common
}

_package_common() {
  install -Dm755 "units/transgui" "$pkgdir/usr/bin/transgui"

  install -Dm644 "lang"/transgui.* -t "$pkgdir/usr/share/transgui/lang" 
  install -Dm644 README.md history.txt LICENSE -t "$pkgdir/usr/share/doc/$pkgbase"

  install -Dm644 "transgui.png" "$pkgdir/usr/share/pixmaps/transgui.png"
  install -Dm644 "$srcdir/transgui.desktop" "$pkgdir/usr/share/applications/transgui.desktop"

  rm "$pkgdir/usr/share/transgui/lang/transgui.template"
}
