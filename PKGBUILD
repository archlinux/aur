# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="usacloud"
pkgver=1.15.0
pkgrel=1
pkgdesc="CLI client for the Sakura Cloud"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/sacloud/${pkgname}"
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go')
_pkgsrc="${url##*/}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}")
sha256sums=('c5c7107a8b3208a162e2165c23f05a3a29e525b45989152ec2162b5fab936006')

prepare() {
  export GOMODCACHE="${srcdir}/go-mod-cache"

  cd "${srcdir}/${_pkgsrc}"
  go mod download -x
  find "${GOMODCACHE}" -type d -exec chmod 755 {} +
  find "${GOMODCACHE}" -type f -exec chmod 644 {} +

  mkdir -p "build" "completions"
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
    -X ${url#https://}/${pkgname}/pkg/version.Revision=$(git rev-parse --short HEAD)" \
    .

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  go test ./...
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "AUTHORS"     "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Modules/${pkgname}/${pkgname}.ps1"
}
