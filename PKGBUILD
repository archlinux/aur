pkgname=zournal-git
pkgver=r59.a3e0713
pkgrel=2
pkgdesc="A journal app for detective games"
arch=('x86_64' 'aarch64')
url="https://github.com/SimoneFelici/Zournal"
license=('MIT')
makedepends=('git' 'zig')
source=(
  "git+${url}.git"
  "https://sqlite.org/2026/sqlite-amalgamation-3530300.zip"
  )
sha256sums=('SKIP'
            '646421e12aac110282ef8cc68f1a62d4bb15fc7b8f09da0b53e29ee690500431')
provides=('zournal')
conflicts=('zournal-bin')

pkgver() {
  cd "$srcdir/Zournal"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/Zournal"

  mkdir -p lib

  cp "$srcdir/sqlite-amalgamation-3530300/sqlite3.c" lib/
}

build() {
  cd "$srcdir/Zournal"
  zig build -Doptimize=ReleaseFast
}

package() {
  cd "$srcdir/Zournal"

  install -Dm755 "zig-out/bin/zournal" "$pkgdir/usr/bin/zournal"
  install -Dm644 "resources/zournal.desktop" "$pkgdir/usr/share/applications/zournal.desktop"
}
