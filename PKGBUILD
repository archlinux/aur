# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=seabird
pkgver=0.0.24
pkgrel=1
pkgdesc='Native Kubernetes desktop client'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://getseabird.github.io'
license=('MPL-2.0')
depends=('gtksourceview5' 'libadwaita')
makedepends=('git' 'go' 'gobject-introspection')
options=('!emptydirs' '!lto')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/get${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
b2sums=('6ec4c4b5a8b2a1fd8da1af47f1ddbd24b2d23182ac0443588c3bfda99197eb68f99716957ca7480f9ab8d73c0fc4387394227df1e8610bc1d017bf29d853a85d'
        'c8e36b0ac8dd4c1b1b47802926fa52ae03d699b245c78a7b47a6652dc62d9e943eecf94af2a901c9801de71d12d47adf14b024b9f7446e4cd3bef426ba47a119')

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  _LDFLAGS="-X main.version=${pkgver} -X main.branch=master -linkmode=external -extldflags ${LDFLAGS}"
  go generate ./...
  go build -o seabird -ldflags="${_LDFLAGS}" "."
}

package() {
  # binary
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}/seabird" \
    "${pkgdir}/usr/bin/seabird"

  # icon
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/icon/${pkgname}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"

  # desktop file
  install -D -m644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # docs
  install -D -m644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
