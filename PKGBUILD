# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=('drill-search-cli' 'drill-search-gtk')
pkgbase=drill-search
pkgver=571+65+gb2a8b9fe
pkgrel=1
pkgdesc="Search files without indexing, but clever crawling"
arch=('x86_64')
url="https://drill.software"
license=('GPL2')
makedepends=('dmd' 'dub' 'git' 'gtk3')
_commit=b2a8b9fe278cc2474f87fb1d626d70574d6aa72f
source=("git+https://github.com/yatima1460/Drill.git#commit=$_commit"
#source=("$pkgbase-$pkgver.tar.gz::https://github.com/yatima1460/Drill/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgbase"
        "$pkgbase-gtk.desktop")
sha256sums=('SKIP'
            'b875f928546aee7855cb1db9afc8ab3f1a8a34d43de5bbd62f7076d7ba9f3917'
            '5bafb37baf608a3168abba2ab9ea174a1d0f0472f52d3222ea0a05957c997c50')

pkgver() {
  cd $srcdir/Drill
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $srcdir/Drill
  echo "$pkgver" > DRILL_VERSION
  dub build -b release -c CLI --force --parallel --verbose --arch="$CARCH"
  dub build -b release -c GTK --force --parallel --verbose --arch="$CARCH"
}

package_drill-search-cli() {
  pkgdesc+=" (CLI version)"
  depends=('bash')

  cd "$srcdir/Drill/Build/Drill-CLI-linux-$CARCH-release"
  install -d "$pkgdir/"{opt/$pkgname,usr/bin}
  cp -r Assets "$pkgdir/opt/$pkgname"
  install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
  install -Dm755 "$srcdir/$pkgbase" "$pkgdir/usr/bin/$pkgname"
  echo "/opt/$pkgname/$pkgname" "\$@" >> "$pkgdir/usr/bin/$pkgname"
}

package_drill-search-gtk() {
  pkgdesc+=" (GTK version)"
  depends=('gtk3' 'xdg-utils')

  cd "$srcdir/Drill/Build/Drill-GTK-linux-$CARCH-release"
  install -d "$pkgdir/"{opt/$pkgname,usr/bin}
  cp -r Assets "$pkgdir/opt/$pkgname"
  install -Dm755 "$pkgname" -t "$pkgdir/opt/$pkgname"
  install -Dm755 "$srcdir/$pkgbase" "$pkgdir/usr/bin/$pkgname"
  echo "/opt/$pkgname/$pkgname" "\$@" >> "$pkgdir/usr/bin/$pkgname"
  install -Dm644 Assets/icon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 "$srcdir/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications"
}
