# Maintainer: Henry-ZHR <henry-zhr@qq.com>
_pkgname=serenity
pkgname=${_pkgname}-git
pkgver=1.0.0.alpha.9.r0.ga331a2f
pkgrel=1
pkgdesc='The configuration generator for sing-box'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://github.com/SagerNet/serenity'
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('sing-box')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
backup=('etc/serenity/config.json')
source=("${_pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
    -o serenity \
    -v \
    -buildmode pie \
    -ldflags "-X github.com/sagernet/serenity/constant.Version=${pkgver} -linkmode external -s -w" \
    -mod readonly \
    -modcacherw \
    -trimpath \
    ../cmd/serenity
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
  install -Dm644 release/config/config.json "${pkgdir}/etc/serenity/config.json"
  install -Dm644 release/config/serenity.service "${pkgdir}/usr/lib/systemd/system/serenity.service"
  install -Dm644 release/config/serenity@.service "${pkgdir}/usr/lib/systemd/system/serenity@.service"
}
