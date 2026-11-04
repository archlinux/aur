# Maintainer: Romain Bertrand <romaintb@noreply.codeberg.org>
pkgname=fgj
pkgver=0.6.1
pkgrel=1
pkgdesc="A command-line tool for working with Forgejo instances (including Codeberg.org)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://codeberg.org/romaintb/fgj"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/romaintb/fgj/archive/v${pkgver}.tar.gz")
sha256sums=('1033add9e8ce34c4545d7d9ceecee1cf0363ec108d6bbd76cee31d07e8429b58')

prepare() {
  cd "${pkgname}"
  mkdir -p build
}

build() {
  cd "${pkgname}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -ldflags "-X codeberg.org/romaintb/fgj/cmd.version=${pkgver}" -o build/${pkgname} .
}

check() {
  cd "${pkgname}"
  go test ./...
}

package() {
  cd "${pkgname}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 <("build/${pkgname}" completion bash) "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 <("build/${pkgname}" completion fish) "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 <("build/${pkgname}" completion zsh) "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
