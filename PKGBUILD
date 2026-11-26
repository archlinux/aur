# Maintainer: Joop Kiefte <ikojba at gmail dot com>
pkgname=accolade
pkgver=0.13.0
pkgrel=1
pkgdesc="Screenplay editor for Fountain, with PDF/HTML/FDX export"
arch=('x86_64' 'aarch64')
url="https://github.com/LaPingvino/accolade"
license=('GPL-3.0-or-later')
depends=('glibc' 'hicolor-icon-theme' 'libgl' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi'
         'libxxf86vm' 'libxkbcommon' 'wayland')
makedepends=('go' 'pkgconf' 'mesa')
conflicts=('accolade-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e486447b23d5825e990f302d79bff559596b2b17bffe6b2f06ae3be6b667b39a')

prepare() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  go mod download -modcacherw
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  # accessibility: screen readers (AT-SPI2, Orca) through the Fyne fork
  go build -tags accessibility -ldflags "-linkmode=external -X main.version=$pkgver" -o accolade .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 accolade "$pkgdir/usr/bin/accolade"
  install -Dm644 packaging/linux/accolade.desktop "$pkgdir/usr/share/applications/eu.kiefte.Accolade.desktop"
  install -Dm644 Icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/accolade.png"
  install -Dm644 packaging/linux/accolade-fountain.xml "$pkgdir/usr/share/mime/packages/accolade-fountain.xml"
  install -Dm644 README.md NEWS AUTHORS -t "$pkgdir/usr/share/doc/$pkgname"
}
