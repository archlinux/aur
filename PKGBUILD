# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=molly-brown
pkgname=molly-brown-git
pkgver=r122.e42c366
pkgrel=1
pkgdesc='full-featured Gemini server implemented in Go'
arch=('x86_64')
url="https://tildegit.org/solderpunk/molly-brown"
license=('custom')
makedepends=('go' 'git')
conflicts=('molly-brown')
provides=('molly-brown')
backup=("etc/molly.conf")
source=("git+https://tildegit.org/solderpunk/molly-brown.git"
        "molly-brown.sysusers")
sha256sums=('SKIP'
            'b026a6f0aee9d6c0a71ef702e59ba3c2b5f84a9e5ab77a17dfe3a28137be2ea8')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$_pkgname"
  mkdir -p build/
  # No mod file
  go mod init "${url#https://}"
  go mod tidy
}

build() {
  cd "$_pkgname"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build .
}

package() {
  cd "$_pkgname"
  install -vDm755 build/${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
  install -vDm644 example.conf "$pkgdir"/etc/molly.conf
  install -vDm644 contrib/init/${_pkgname}.service.example "$pkgdir"/usr/lib/systemd/system/${_pkgname}.service
  install -vDm644 LICENSE "$pkgdir"/usr/share/licenses/${_pkgname}/LICENSE
  install -vDm644 ../${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
}
