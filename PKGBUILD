# Maintainer: Henry-ZHR <henry-zhr@qq.com>
pkgname=mosdns
pkgver=5.1.3
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
_tag=ac99eb16953d9b4e2fbfeb2281fbf21c83daecdc # git rev-parse "v${pkgver}"
source=("${pkgname}::git+${url}.git#tag=${_tag}"
        "mosdns-sysusers.conf"
        "mosdns.service")
sha512sums=('SKIP'
            '6388385b26b0a37d519482537c976c559ff050c8cf0135be0a7bfc75538bd0c13e0e6487b165e7e06b7b3f0e9ecb802eaf105e62a315c77eed2e3161f690d184'
            'f54f076eb392aa7b9dc9b50018fca63668eefa4f15a7373d44a1a237158e621248e96c9ac72405660c9a1c5de684604514e809b2b12bae6b201bacbe7fc2b560')

prepare() {
  mkdir -p "${pkgname}/build"
}

build() {
  cd "${pkgname}/build"
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
