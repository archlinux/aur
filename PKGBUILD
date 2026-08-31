# Maintainer: WindustH <windusth2006@gmail.com>

_pkgname=music-tui
pkgname=$_pkgname-git
pkgver=0.1.7
pkgrel=1
pkgdesc="Terminal music player backed by MPD, with covers, synced lyrics and a visualizer."
arch=('x86_64' 'aarch64')
url="https://github.com/WindustH/music-tui"
license=('MIT')
depends=('mpd' 'chafa' 'sqlite')
makedepends=('git' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-stable" "$_pkgname-bin")
options=('!lto')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$_pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
  cp -r doc "$pkgdir/usr/share/doc/$_pkgname/"
}
