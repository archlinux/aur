# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=seabird
pkgver=0.2.2
pkgrel=1
pkgdesc='Native Kubernetes desktop client'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://getseabird.github.io'
license=('MPL-2.0')
depends=('gtksourceview5' 'libadwaita' 'vte4')
makedepends=('git' 'go' 'gobject-introspection')
options=('!emptydirs' '!lto')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/get${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
b2sums=('9a16bce212d80799e46cf1989de0a539fad52f502a49bcc5fb3bb44d260220057fc9f1806265b756c366d95d0e12a925a9e8ef077c0dca24fec14cc18e57db0e'
        'c8e36b0ac8dd4c1b1b47802926fa52ae03d699b245c78a7b47a6652dc62d9e943eecf94af2a901c9801de71d12d47adf14b024b9f7446e4cd3bef426ba47a119')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -X main.branch=master -linkmode=external"
  go generate ./...
  go build -o seabird -ldflags="${_LDFLAGS}" .
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/seabird" \
    "${pkgdir}/usr/bin/seabird"

  # icon
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/internal/icon/${pkgname}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  # desktop file
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # docs
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
