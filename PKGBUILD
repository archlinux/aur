# Maintainer: LightQuantum <cy.n01@outlook.com>
pkgname=calorina-git
_pkgname=calorina
pkgver=4.1.0.r0.g6843422
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
         '14dc2936e63fe910017e18ab006747a2')

pkgver() {
    cd $_pkgname
    git describe --long --tags |sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  CGO_ENABLED=0 go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname cmd/${_pkgname}d/main.go
}

package() {
  cd "${srcdir}/"

  install -Dm755 $_pkgname/$_pkgname "$pkgdir"/usr/bin/${_pkgname}d
  install -Dm644 $_pkgname.service "$pkgdir"/usr/lib/systemd/system/$_pkgname.service
  install -Dm644 $_pkgname/share/config.toml "$pkgdir"/etc/$_pkgname/config.toml
}
