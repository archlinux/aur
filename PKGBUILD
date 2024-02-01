# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=seabird
pkgver=0.0.22
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
b2sums=('eedb461e5dde9572d774ad1de4044e7aa89d59e2309ee8a983af3c6a083be6d8ccf569938d7df448fe896af33ca63adeabc88b7dbbc4c5f30897c239e8e43bd3'
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
