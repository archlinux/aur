# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Eric Berquist <eric dot berquist at gmail dot com>
# Contributor: Siôn le Roux <sinisterstuf@gmail.com>

pkgname=wakatime
epoch=1
pkgver='1.30.5'
pkgrel=1
pkgdesc="Command line interface used by all WakaTime text editor plugins"
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}-cli"
license=('BSD')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}-cli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed7a27e0ac841980b5b89574da99f7e0cb915d8dd9dd7c176a11703f974ad54e')

prepare () {
  cd "${srcdir}/${pkgname}-cli-${pkgver}"
  mkdir -p build  # create build dir
}

build () {
  cd "${srcdir}/${pkgname}-cli-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/"${pkgname}" ./main.go
}

package() {
  cd "${srcdir}/${pkgname}-cli-${pkgver}"
  install -Dm755 build/"${pkgname}" "${pkgdir}"/usr/bin/"${pkgname}"
  install -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
  install LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
