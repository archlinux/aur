# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-dock-hyprland')
pkgver=0.1.0
pkgrel=1
pkgdesc="GTK3-based dock for Hyprland Wayland compositor"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-dock-hyprland"
license=('MIT')
provides=('nwg-dock-hyprland')
conflicts=('nwg-dock-hyprland-git' 'nwg-dock-hyprland-bin')
makedepends=('go')
depends=('gtk3' 'gtk-layer-shell')
optdepends=('nwg-drawer: default application launcher')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-dock-hyprland/archive/v"$pkgver".tar.gz")

md5sums=('7285f67cba8697a1540f8d9f0eba30a0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -v -o bin/"$pkgname" *.go
}

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/"$pkgname"/images
  install -Dm644 -t "$pkgdir"/usr/share/"$pkgname"/images/ "$pkgname"-"$pkgver"/images/*
  install -Dm644 -t "$pkgdir"/usr/share/"$pkgname"/ "$pkgname"-"$pkgver"/config/*
  install -Dm755 -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/bin/"$pkgname"
}
