# Maintainer: Mario Oenning <mo-son at mailbox dot org>

pkgname=pacseek
pkgver=0.2.5
pkgrel=1
pkgdesc='A terminal user interface for searching and installing Arch Linux packages'
arch=('x86_64')
url="https://github.com/moson-mo/$pkgname"
license=('GPL2')
depends=('pacman')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c2a196857a57f614adb3d914668ab0933f805544cc405aa4d44c3a10c1a89917')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build .
}

package() {
  cd "$pkgname-$pkgver"

  # bin
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # .desktop
  install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/org.moson.$pkgname.desktop"
  
  # icon
  install -Dm644 "assets/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}
