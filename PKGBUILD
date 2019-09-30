# Maintainer: Joost Bremmer <joost@madeofmagicandwires.online>
# Contributor: keylo99 <keylo99official@gmail.com>

pkgname=pkgtop
pkgdesc="Interactive package manager & resource monitor (stable version)"
pkgver=2.0
pkgrel=3
arch=('any')
url="https://github.com/keylo99/pkgtop"
license=('GPL3')
makedepends=('go' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.zip::https://github.com/keylo99/${pkgname}/archive/${pkgver}.zip")
sha256sums=('338b018fa6aa102ef97901949cc1001afc753a44c91e3acc7d41c949e333c9b9')

prepare() {
  mkdir -p "${srcdir}/gopath"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath" GO111MODULE="auto"
  go get -d ./...
  go build \
    -gcflags "all=-trimpath=$srcdir" \
    -asmflags "all=-trimpath=$srcdir" \
    -ldflags "-extldflags $LDFLAGS" \
    -v -o "./${pkgname}" ./src

  # Clear read-only module files after build so that makepkg -Cc still works
  GOPATH="${srcdir}/gopath" go clean -modcache
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dvm755 "${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}

# vim: set ts=2 sts=2 sw=2 et tw=80 :
