# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=drill-search
pkgver=571+100+g04683dbf
pkgrel=3
pkgdesc="Search files without indexing, but clever crawling"
arch=('x86_64')
url="https://drill.software"
license=('GPL-2.0-or-later')
depends=('bash' 'gtk3' 'xdg-utils')
makedepends=('dmd' 'dub' 'git')
_commit=04683dbf0d40510543db748c0a3c1a88524c5f8d
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
  export DFLAGS='-L-zrelro -L-znow'

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
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"
  ln -s "/opt/$pkgname/$pkgname-gtk" "$pkgdir/usr/bin/"
  popd

  rm  "$pkgdir/opt/$pkgname/Assets/"{*.desktop,*.svg,*.xpm,README.md}
}
