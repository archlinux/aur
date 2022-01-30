# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=drill-search
pkgver=571+90+gb5ecb6a6
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling"
arch=('x86_64')
url="https://drill.software"
license=('GPL2')
depends=('bash' 'gtk3' 'xdg-utils')
makedepends=('dmd' 'dub' 'git')
_commit=b5ecb6a6a40c5c814c06d3e202c9c90efe690b47
source=("git+https://github.com/yatima1460/Drill.git#commit=$_commit")
conflicts=("$pkgname-cli" "$pkgname-gtk")
replaces=("$pkgname-cli" "$pkgname-gtk")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Drill"
  git describe --tags --exclude latest | sed 's/^v//;s/-/+/g'
}

build() {
  cd "$srcdir/Drill"

  pushd src
  dub build -b release -c CLI --force --parallel --verbose --arch="$CARCH"
  dub build -b release -c GTK --force --parallel --verbose --arch="$CARCH"
  popd
}

package() {
  cd "$srcdir/Drill"

  pushd "src/Build/Drill-CLI-linux-$CARCH-release"
  install -Dm755 "$pkgname-cli" "$pkgdir/opt/$pkgname/$pkgname"
  popd

  pushd "src/Build/Drill-GTK-linux-$CARCH-release"
  install -Dm755 "$pkgname-gtk" -t "$pkgdir/opt/$pkgname/"
  cp -r Assets "$pkgdir/opt/$pkgname/"
  install -Dm644 Assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "Assets/$pkgname-gtk.desktop" -t \
    "$pkgdir/usr/share/applications/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
  ln -s "/opt/$pkgname/$pkgname-gtk" "$pkgdir/usr/bin/"
  popd

  rm  "$pkgdir/opt/$pkgname/Assets/"{*.desktop,*.svg,*.xpm,README.md}
}
