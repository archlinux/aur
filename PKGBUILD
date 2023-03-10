pkgname=haunt-go-git
_pkgname=haunt
pkgver=0.2.6.r2.gec35355
pkgrel=1
pkgdesc='Live reload and task automation for go apps'
arch=('x86_64')
url="https://git.asdf.cafe/abs3nt/${_pkgname}"
license=('GPL')
provides=(${_pkgname})
conflicts=(${_pkgname})
makedepends=('go')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -buildmode=pie -trimpath -ldflags="-linkmode=external -s -w -X 'github.com/abs3ntdev/haunt/cmd.Version=v${pkgver}'" -mod=readonly -modcacherw .
  ./${_pkgname} completion zsh > ${_pkgname}_zsh
  ./${_pkgname} completion bash > ${_pkgname}_bash
  ./${_pkgname} completion fish > ${_pkgname}_fish
}

package() {
  cd "${_pkgname}"
  install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
  install -Dm644 ${_pkgname}_zsh "$pkgdir"/usr/share/zsh/site-functions/_${_pkgname}
  install -Dm644 ${_pkgname}_bash "$pkgdir"/usr/share/bash-completion/completions/${_pkgname}
  install -Dm644 ${_pkgname}_fish "$pkgdir"/usr/share/fish/vendor_completions.d/${_pkgname}.fish
}
