# Maintainer: Sergei Sokolov <mohterbaord at gmail dot com>

pkgname=color-scheme-control
pkgver=0.1.0
pkgrel=2
pkgdesc='Utility for color scheme toggling written in Go and extensible by Lua'
arch=( 'x86_64' )
url="https://codeberg.org/mohterbaord/${pkgname}"
license=( 'MIT' )
makedepends=( 'go' )
depends=( 'systemd' )
install="${pkgname}.install"
source=( "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz" )
sha256sums=( '8cbf108489f78cf42950404e32de6fcee1b48a21fe011ca9c1bca00e1b8f1b48' )

_binary_name=csctl

prepare() {
  cd "./${pkgname}"
  mkdir -p ./build/completions
}

build() {
  cd "./${pkgname}"

  export CGO_ENABLED=0
  go build \
    -o "./build/${_binary_name}" \
    -ldflags "-s -w -X codeberg.org/mohterbaord/${pkgname}/cmd.version=${pkgver}" \
    -trimpath \
    .

  cd ./build

  "./${_binary_name}" completion bash >"./completions/${_binary_name}"
  "./${_binary_name}" completion zsh  >"./completions/_${_binary_name}"
  "./${_binary_name}" completion fish >"./completions/${_binary_name}.fish"
}

check() {
  cd "./${pkgname}"
  go test './...'
}

package() {
  cd "./${pkgname}"

  install -Dm755 "./build/${_binary_name}" \
    --target-directory="${pkgdir}/usr/bin"

  install -Dm644 "./build/completions/${_binary_name}" \
    --target-directory="${pkgdir}/usr/share/bash-completion/completions"

  install -Dm644 "./build/completions/_${_binary_name}" \
    --target-directory="${pkgdir}/usr/share/zsh/site-functions"

  install -Dm644 "./build/completions/${_binary_name}.fish" \
    --target-directory="${pkgdir}/usr/share/fish/vendor_completions.d"

  install -Dm644 "./systemd/${pkgname}.service" \
    --target-directory="${pkgdir}/usr/lib/systemd/user"

  install -Dm644 ./README.md \
    --target-directory="${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 ./LICENSE \
    --target-directory="${pkgdir}/usr/share/licenses/${pkgname}"
}
