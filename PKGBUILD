# Maintainer:
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Matt Parnell/ilikenwf <parwok@gmail.com>
# Contributor: Dobroslaw Kijowski <dobo90_at_gmail.com>
# Contributor: Paul N. Maxwell <msg.maxwel@gmail.com>

_pkgbase='transgui'
pkgbase="$_pkgbase-git"
pkgname=("$_pkgbase-qt-git" "$_pkgbase-gtk-git")
pkgver=5.18.0.r86.g26a1e99
pkgrel=1
pkgdesc='A feature rich cross platform Transmission BitTorrent client. Faster and has more functionality than the built-in web GUI.'
arch=('i686' 'x86_64')
url="https://github.com/transmission-remote-gui/transgui"
license=("GPL2")
makedepends=(
  'git'
  'gtk2'
  'lazarus'
  'qt5pas'
)
source=(
  "$_pkgbase"::"git+$url"
  "transgui.desktop"
)
sha256sums=(
  'SKIP'
  '6c1723e084bd4afc908957e005dea60f919b42426d82cbcdee89239c64c6093d'
)

pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  cd "$srcdir/$_pkgbase"
  mkdir -p "$srcdir/build-qt" "$srcdir/build-gtk"
}

package_transgui-qt-git() {
  depends=('qt5pas')
  provides=(
    'transgui-gtk'
    'transgui-qt'
    'transmission-remote-gui'
  )
  conflicts=(${provides[@]})

  cd "$srcdir/$_pkgbase"
  make clean

  lazbuild "transgui.lpi" \
    --lazarusdir="/usr/lib/lazarus" \
    --widgetset="qt5" \
    --primary-config-path=../build-qt

  install -Dm755 "units/transgui" "$pkgdir/usr/bin/transgui"

  install -Dm644 "lang"/transgui.* -t "$pkgdir/usr/share/transgui/lang" 
  install -Dm644 README.md history.txt LICENSE -t "$pkgdir/usr/share/doc/$pkgbase"

  install -Dm644 "transgui.png" "$pkgdir/usr/share/pixmaps/transgui.png"
  install -Dm644 "$srcdir/transgui.desktop" "$pkgdir/usr/share/applications/transgui.desktop"

  rm "$pkgdir/usr/share/transgui/lang/transgui.template"
}

package_transgui-gtk-git() {
  depends=('gtk2')
  provides=(
    'transgui-gtk'
    'transgui-qt'
    'transmission-remote-gui'
  )
  conflicts=(${provides[@]})

  cd "$srcdir/$_pkgbase"
  make clean

  lazbuild "transgui.lpi" \
    --lazarusdir="/usr/lib/lazarus" \
    --widgetset="gtk2" \
    --primary-config-path=../build-gtk

  install -Dm755 "units/transgui" "$pkgdir/usr/bin/transgui"

  install -Dm644 "lang"/transgui.* -t "$pkgdir/usr/share/transgui/lang" 
  install -Dm644 README.md history.txt LICENSE -t "$pkgdir/usr/share/doc/$pkgbase"

  install -Dm644 "transgui.png" "$pkgdir/usr/share/pixmaps/transgui.png"
  install -Dm644 "$srcdir/transgui.desktop" "$pkgdir/usr/share/applications/transgui.desktop"

  rm "$pkgdir/usr/share/transgui/lang/transgui.template"
}
