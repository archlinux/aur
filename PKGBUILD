pkgname=memcardpro-git
_pkgname=memcardpro
pkgver=0.0.3.r14.gaba967e
pkgrel=1
pkgdesc='Utility for 8BitMods MemCard PRO'
arch=('x86_64')
url="https://github.com/bodgit/${_pkgname}"
license=('BSD')
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
  go build .
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
