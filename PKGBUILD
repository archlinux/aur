# Maintainer: Mario Oenning <mo-son at mailbox dot org>

_pkgname=pacseek
pkgname=pacseek-git
pkgver=1.8.2.238.36a078a
pkgrel=1
pkgdesc='A terminal user interface for searching and installing Arch Linux packages (git version)'
arch=('any')
url="https://github.com/moson-mo/$_pkgname"
license=('MIT')
depends=('pacman')
optdepends=('xdg-utils: open URL on click support'
            'fakeroot: display upgrades support')
provides=('pacseek')
conflicts=('pacseek')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

prepare(){
  mkdir -p build/
}

pkgver() {
  cd "$_pkgname"
  printf "%s.%s.%s" "$(grep 'version' internal/pacseek/ui.go | cut -d\" -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  export GOPATH="$srcdir"/gopath
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -tags=next"

  go build -o ../build .
}

package() {
  cd "$_pkgname"
  
  # bin
  install -Dm755 ../build/$_pkgname "$pkgdir"/usr/bin/$_pkgname

  # license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # .desktop
  install -Dm644 "assets/$_pkgname.desktop" "$pkgdir/usr/share/applications/org.moson.$_pkgname.desktop"
  
  # icon
  install -Dm644 "assets/$_pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
  
  # man page
  install -Dm644 "doc/pacseek.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
