# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_pkgname=serenity
pkgname=${_pkgname}-git
pkgver=r11.306a414
pkgrel=1
pkgdesc='The configuration generator for sing-box'
arch=('i686' 'x86_64')
url='https://github.com/SagerNet/serenity'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('sing-box'
            'bash-completion: bash completions'
            'zsh-completions: zsh completitons')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
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
  go build -buildmode=pie -trimpath -tags with_acme -ldflags="-linkmode external -s -w" -mod=readonly -modcacherw -o serenity ../cmd/serenity
  go run ../cmd/serenity completion bash >bash-completion
  go run ../cmd/serenity completion fish >fish-completion
  go run ../cmd/serenity completion zsh >zsh-completion
}

package() {
  cd "${_pkgname}"
  install -Dm755 build/serenity "${pkgdir}/usr/bin/serenity"
  install -Dm644 build/bash-completion "${pkgdir}/usr/share/bash-completion/completions/serenity"
  install -Dm644 build/fish-completion "${pkgdir}/usr/share/fish/vendor_completions.d/serenity.fish"
  install -Dm644 build/zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_serenity"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/serenity/LICENSE"
}
