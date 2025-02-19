pkgname=ytui-music
pkgver=2.0.0.rc1.4.g3c13769
_pkgver=2.0.0-rc1
pkgrel=1
pkgdesc="Youtube client in terminal for music (lightweight youtube client)"
arch=('x86_64')
url="https://github.com/sudipghimire533/ytui-music"
license=('GPL2')
provides=(${pkgname})
conflicts=(${pkgname}-bin)
depends=("mpv" "youtube-dl" "sqlite")
makedepends=('cargo' 'git' 'sqlite' 'pkg-config')
source=("git+$url.git")
sha256sums=('SKIP')
options=("!buildflags")

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"

  git submodule init
  
  export MPV_SOURCE=/usr/bin/mpv
}

build() {
  cd "$srcdir/$pkgname"

  cargo build --all --release --features build_libmpv
}

package() {
  cd "$srcdir/$pkgname"
  
  install -Dm755 "target/release/ytui_music" "$pkgdir/usr/bin/ytui-music"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

