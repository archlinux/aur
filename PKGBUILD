# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
# Project: nwg-shell for sway, https://github.com/nwg-piotr/nwg-shell
pkgname=('nwg-dock')
pkgver=0.2.1
pkgrel=1
pkgdesc="GTK3-based dock for sway Wayland compositor"
arch=('x86_64')
url="https://github.com/nwg-piotr/nwg-dock"
license=('MIT')
provides=('nwg-dock')
conflicts=('nwg-dock-git' 'nwg-dock-bin')
makedepends=('go')
depends=('gtk3' 'gtk-layer-shell')
optdepends=('nwg-drawer: default application launcher')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nwg-piotr/nwg-dock/archive/v"$pkgver".tar.gz")

md5sums=('0f131bab16370f892ee71ffda68327c7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  export GOPATH="${srcdir}"/go
  export PATH=$PATH:$GOPATH/bin
  go build -o bin/"$pkgname" *.go
}

package() {
  cd "$srcdir"
  install -d "$pkgdir"/usr/share/"$pkgname"/images
  install -Dm644 -t "$pkgdir"/usr/share/"$pkgname"/images/ "$pkgname"-"$pkgver"/images/*
  install -Dm644 -t "$pkgdir"/usr/share/"$pkgname"/ "$pkgname"-"$pkgver"/config/*
  install -Dm755 -t "$pkgdir"/usr/bin "$pkgname"-"$pkgver"/bin/"$pkgname"
}
