# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-menu')
pkgver=0.1.3
pkgrel=1
pkgdesc="MenuStart for sway and other wlroots-based compositors"
arch=('any')
url="https://github.com/nwg-piotr/nwg-menu"
license=('MIT')
provides=('nwg-menu')
makedepends=('go')
depends=('gtk3' 'gtk-layer-shell')
optdepends=('foot: to open .desktop files with Terminal=true'
            'thunar: to open files and directories')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-menu/archive/v"$pkgver".tar.gz")

md5sums=('542ffe1db1cc93dc2791f431d8b5d132')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -o bin/nwg-menu *.go
}

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/"$pkgname"/desktop-directories
  install -Dm644 -t "$pkgdir"/usr/share/"$pkgname"/desktop-directories/ "$pkgname"-"$pkgver"/desktop-directories/*
  install -Dm644 -t "$pkgdir"/usr/share/"$pkgname" "$pkgname"-"$pkgver"/menu-start.css
  install -Dm755 -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/bin/nwg-menu
  
  cd "$srcdir/$pkgname-$pkgver"
  install -D -t "$pkgdir"/usr/share/licenses/"$pkgname" LICENSE
  install -D -t "$pkgdir"/usr/share/doc/"$pkgname" README.md
}
