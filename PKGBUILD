pkgname=gspot-git
_pkgname=gspot
pkgver=0.0.20.r0.gdc2c74d
pkgrel=1
pkgdesc='Spotify TUI And CLI written in Go'
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
  go build -buildmode=pie -trimpath -ldflags="-linkmode=external -s -w -X 'git.asdf.cafe/abs3nt/${_pkgname}/src/components/cli.Version=v${pkgver}'" -mod=readonly -modcacherw .
}

package() {
  cd "${_pkgname}"
  install -Dm755 ${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
  install -Dm644 completions/_${_pkgname} "$pkgdir"/usr/share/zsh/site-functions/_${_pkgname}
  install -Dm644 completions/${_pkgname} "$pkgdir"/usr/share/bash-completion/completions/${_pkgname}
}
