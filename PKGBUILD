# Maintainer: Joost Bremmer <joost@madeofmagicandwires.online>
# Contributor: keylo99 <keylo99official@gmail.com>

pkgname=pkgtop
pkgdesc="Interactive package manager & resource monitor (stable version)"
pkgver=2.1
pkgrel=2
arch=('any')
url="https://github.com/keylo99/pkgtop"
license=('GPL3')
makedepends=('go-pie' 'git')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.zip::https://github.com/keylo99/${pkgname}/archive/${pkgver}.zip")
sha256sums=('c660ecd03767a6f1cb37b295b36569ba44352905946ee50af1b9558ec7988ca1')

prepare() {
  mkdir -p "${srcdir}/gopath"
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath" GO111MODULE="auto"
  go get -d ./...
  go build \
    -buildmode=pie \
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
