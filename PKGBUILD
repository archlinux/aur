# Maintainer: Mario Oenning <mo-son at mailbox dot org>

pkgname=pacseek
pkgver=1.7.10
pkgrel=2
pkgdesc='A terminal user interface for searching and installing Arch Linux packages'
arch=('x86_64' 'aarch64')
url="https://github.com/moson-mo/$pkgname"
license=('MIT')
depends=('pacman')
makedepends=('go')
optdepends=('xdg-utils: open URL on click support'
            'fakeroot: display upgrades support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('cd2274551757914a5564bab697126ac69d644f7503b7e8bb16fcf3be0f334384')

prepare(){
  cd "$pkgname-$pkgver"
  mkdir -p build/
}

build() {
  cd "$pkgname-$pkgver"
  export GOPATH="$srcdir"/gopath
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
  
  # man page
  install -Dm644 "doc/pacseek.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
