# Maintainer: Jamison Lahman <jamison+aur@lahman.dev>
# Contributor:

pkgname=nature-sounds
pkgver=0.2.8
pkgrel=3
pkgdesc="A lightweight, nature sounds player for the command-line."
arch=('x86_64' 'aarch64')
url="https://github.com/jmelahman/nature-sounds"
license=('MIT')
depends=('alsa-utils')
makedepends=('gcc' 'git' 'go')
_commit='7f823a6e14e7670d308b4c7149501d6dfcc24e8d'
source=("$pkgname::git+$url.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname" || exit

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname" || exit
  go mod download -modcacherw
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  cd "$pkgname" || exit

  CGO_ENABLED=1 go build -buildmode=pie -trimpath -modcacherw -ldflags="-X main.version=v$pkgver -X main.commit=$_commit -s -w" -o "$pkgname"
}

package() {
  cd "$pkgname" || exit

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
