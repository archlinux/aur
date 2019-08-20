# Maintainer: LightQuantum <cy.n01@outlook.com>
pkgname=calorina-git
_pkgname=calorina
pkgver=3.2.1.r0.g8978847
pkgrel=1
pkgdesc='Project Calorina - a complete rewrite of cleardns'
arch=('x86_64')
url="https://gitlab.com/NickCao/calorina"
license=('GPL3')
makedepends=('go')
backup=("etc/$_pkgname/config.toml")
source=("git+https://gitlab.com/NickCao/$_pkgname"
    calorina.service)
md5sums=('SKIP'
         '2e9c6347d4876f4ac42243a01af8dfad')

pkgver() {
    cd $_pkgname
    git describe --long --tags |sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname cmd/$_pkgname-dns-demo/main.go
}

package() {
  cd "${srcdir}/"

  install -Dm755 $_pkgname/$_pkgname "$pkgdir"/usr/bin/$_pkgname
  install -Dm644 $_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
  install -Dm644 $_pkgname@.service "$pkgdir"/usr/lib/systemd/system/$_pkgname@.service
  install -Dm644 $_pkgname/cmd/$_pkgname-dns-demo/config.toml "$pkgdir"/etc/$_pkgname/config.toml
}
