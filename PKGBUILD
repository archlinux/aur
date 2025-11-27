# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_pkgname=v2dat
pkgname=${_pkgname}-git
pkgver=r2.47b8ee5
pkgrel=2
pkgdesc="A cli tool that can unpack v2ray data packages"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/urlesistiana/v2dat"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=('git' 'go')
conflicts=(${_pkgname})
provides=(${_pkgname})
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  mkdir -p "${_pkgname}/build"
}

build() {
  cd "${_pkgname}/build"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -o "${_pkgname}" \
    -v \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode external -s -w" \
    -mod=readonly \
    -modcacherw \
    ../
  go run ../ completion bash >bash-completion
  go run ../ completion fish >fish-completion
  go run ../ completion zsh >zsh-completion
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 bash-completion "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 fish-completion "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
