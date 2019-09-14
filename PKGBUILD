# Maintainer: Joost Bremmer <joost@madeofmagicandwires.online>
# Contributor: keylo99 <keylo99official@gmail.com>

pkgname=pkgtop
pkgdesc="Interactive package manager & resource monitor (stable version)"
pkgver=2.0
pkgrel=1
arch=('any')
url="https://github.com/keylo99/pkgtop"
license=('GPL3')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.zip::https://github.com/keylo99/${pkgname}/archive/${pkgver}.zip")
sha256sums=('f4db07ca551453b4061612c0f67258fba52c2a2ebc629f4ea4ef0e192b971f1f')

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
