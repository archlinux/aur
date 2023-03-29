# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=molly-brown
pkgname=molly-brown-git
pkgver=r181.2c3225c
pkgrel=3
pkgdesc='full-featured Gemini server implemented in Go'
arch=('x86_64')
url="https://tildegit.org/solderpunk/molly-brown"
license=('custom')
makedepends=('go' 'git')
conflicts=('molly-brown')
provides=('molly-brown')
backup=("etc/molly.conf")
source=("git+https://tildegit.org/solderpunk/molly-brown.git"
        "${_pkgname}.conf"
        "${_pkgname}.service"
        "${_pkgname}.sysusers"
        "${_pkgname}.tmpfiles")
sha256sums=('SKIP'
            '56468d70515e9a2bf2cfebd96f3ce253e7843910f531619125a553198b2b26c7'
            '147b34e2544ac86603aeed16b37e354a5dfcf9092939c66df2fff7a5ad1e52c7'
            'b026a6f0aee9d6c0a71ef702e59ba3c2b5f84a9e5ab77a17dfe3a28137be2ea8'
            '6154ecf97c4dba46065e00993e22b2b140608c25174c1b340123cedf220ba8c1')


pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "$_pkgname"
  mkdir -p build/
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
  install -vDm755 ${_pkgname}/build/${_pkgname} "${pkgdir}"/usr/bin/${_pkgname}
  install -vDm644 ${_pkgname}.conf "${pkgdir}"/etc/molly.conf
  install -vDm644 ${_pkgname}/LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
  
  # Log folder
  install -vdm 755 "${pkgdir}"/var/log/${_pkgname}/

  # SystemD integration
  install -vDm644 ${_pkgname}.service "${pkgdir}"/usr/lib/systemd/system/${_pkgname}.service
  install -vDm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${_pkgname}.conf
  install -vDm644 ${_pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${_pkgname}.conf
}
