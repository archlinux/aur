# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="html2markdown"
pkgver=2.4.0
pkgrel=1
pkgdesc="Convert HTML to Markdown. Even works with entire websites and can be extended through rules."
arch=('aarch64' 'i686' 'x86_64')
url="https://html-to-markdown.com"
_url="https://github.com/JohannesKaufmann/html-to-markdown"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="${_url##*/}"
source=("${_pkgsrc}::git+${_url}.git#tag=v${pkgver}")
b2sums=('654c854582f24bcf752c7ade03e6b8bad95898ecec4fdc942b0643894108e2e654c0533bae80edae44b61858ce52e506f3e4400eba606b14b0cce1a2708ed7e4')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go get -v ./...
  chmod -R ug+Xwr "${GOMODCACHE}"

  mkdir -p "build"
}

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOCACHE="${srcdir}/go-cache"
  export GOMODCACHE="${srcdir}/go-mod-cache"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd "${srcdir}/${_pkgsrc}"
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
