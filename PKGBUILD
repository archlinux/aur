# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=mosdns
pkgver=5.3.3
pkgrel=1
pkgdesc="A DNS forwarder"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/IrineSistiana/mosdns"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'go')
backup=('etc/mosdns/config.yaml')
_tag='71e7753f71af56002c8fad16bd0b68e1284e984d' # git rev-parse "v${pkgver}"
source=("${pkgname}::git+${url}.git#tag=${_tag}"
        "mosdns-sysusers.conf"
        "mosdns.service")
sha512sums=('SKIP'
            '6388385b26b0a37d519482537c976c559ff050c8cf0135be0a7bfc75538bd0c13e0e6487b165e7e06b7b3f0e9ecb802eaf105e62a315c77eed2e3161f690d184'
            '9322e4ee53f192e59622a34488920c162f9ce6a921e45eebd3780b18efbe4461fa1de4a3fe4706b3bfc7682cdaca3c37c84083b3942146c9a6e405ef0b712f88')

prepare() {
  mkdir -p "${pkgname}/build"
}

build() {
  cd "${pkgname}/build"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  go build \
    -o mosdns \
    -v \
    -buildmode=pie \
    -trimpath \
    -ldflags="-linkmode external -s -w -X main.version=$(git describe --tags --long --always)" \
    -mod=readonly \
    -modcacherw \
    ../
  go run ../ config gen config.yaml
  go run ../ completion bash >bash-completion
  go run ../ completion zsh >zsh-completion
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "build/mosdns" "${pkgdir}/usr/bin/mosdns"
  install -Dm644 "build/config.yaml" "${pkgdir}/etc/mosdns/config.yaml"
  install -Dm644 "build/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/mosdns"
  install -Dm644 "build/zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_mosdns"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/mosdns/LICENSE"

  cd "${srcdir}"
  install -Dm644 "mosdns-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/mosdns.conf"
  install -Dm644 "mosdns.service" "${pkgdir}/usr/lib/systemd/system/mosdns.service"
}
