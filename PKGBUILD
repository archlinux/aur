# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="html2markdown"
pkgver=2.3.1
pkgrel=1
pkgdesc="Convert HTML to Markdown. Even works with entire websites and can be extended through rules."
arch=('aarch64' 'i686' 'x86_64')
url="https://html-to-markdown.com"
_url="https://github.com/JohannesKaufmann/html-to-markdown"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="html-to-markdown"
source=("${_pkgsrc}::git+${_url}.git#tag=v${pkgver}")
b2sums=('9217607bdd69ad74320656f66346eee4237ec433243e80dafc5c190a745a5dc1898610ebe62d1e7f7d992a7250b1633b9af46a4652c8afbc78ace49dac370c38')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -v -o "build/${pkgname}" -ldflags "\
    -X main.version=${pkgver}-${pkgrel} \
    -X main.commit=$(git rev-parse HEAD) \
    -X main.date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
    ./"cli/${pkgname}"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -vDm644 "ESCAPING.md" "${pkgdir}/usr/share/doc/${pkgname}/ESCAPING.md"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
