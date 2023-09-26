# Maintainer: Sieve Lau <sievelau@gmail.com>

pkgname=mosdns-git
pkgver=r784.b753642
pkgrel=1
pkgdesc="A DNS forwarder"
arch=('x86_64')
url="https://github.com/IrineSistiana/mosdns"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'go')
optdepends=('bash-completion: bash completions'
            'zsh-completions: zsh completitons')
backup=('etc/mosdns/config.yaml')
source=("${pkgname%-git}::git+https://github.com/IrineSistiana/mosdns"
        "mosdns.service")
sha512sums=('SKIP'
            '24fe05400b65259cb3c7f5a59f81ce6ee15787d9151ad23b8850aa0e44061c1a4e58882d11ccaa0e3c00ccf531a1b79fe4d28262663af67328ea4a2fba69e4de')

pkgver() {
  cd $srcdir/${pkgname%-git}
  (
    set -o pipefail  
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  mkdir -p "${pkgname%-git}/build"
}

build() {
  cd "${pkgname%-git}/build"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build -buildmode=pie -trimpath -ldflags="-linkmode external -s -w -X main.version=$(git describe --tags --long --always)" -mod=readonly -modcacherw -o mosdns ../
  go run ../ config gen config.yaml
  go run ../ completion bash >bash-completion
  go run ../ completion zsh >zsh-completion
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 "build/mosdns" "${pkgdir}/usr/bin/mosdns"
  install -Dm644 "build/config.yaml" "${pkgdir}/etc/mosdns/config.yaml"
  install -Dm644 "build/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/mosdns"
  install -Dm644 "build/zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_mosdns"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/mosdns/LICENSE"

  cd "${srcdir}"
  install -Dm644 "mosdns.service" "${pkgdir}/usr/lib/systemd/system/mosdns.service"
}
