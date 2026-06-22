# Maintainer: Sergei Sokolov <mohterbaord at gmail dot com>

pkgname=color-scheme-control
pkgver=0.1.0
pkgrel=1
pkgdesc='Utility for color scheme toggling written in Go and extensible by Lua'
arch=( 'x86_64' )
url="https://codeberg.org/mohterbaord/${pkgname}"
license=( 'MIT' )
makedepends=( 'go' )
depends=( 'systemd' )
install=color-scheme-control.install
source=( "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz" )
sha256sums=( '8cbf108489f78cf42950404e32de6fcee1b48a21fe011ca9c1bca00e1b8f1b48' )

prepare() {
  mkdir -p "${srcdir}/go"
  cp -r "${srcdir}/${pkgname}/cmd" \
        "${srcdir}/${pkgname}/internal" \
        "${srcdir}/${pkgname}/main.go" \
        "${srcdir}/${pkgname}/go.mod" \
        "${srcdir}/${pkgname}/go.sum" \
        "${srcdir}/go"

  cp "${srcdir}/${pkgname}/systemd/color-scheme-control.service" \
     "${srcdir}/${pkgname}/README.md" \
     "${srcdir}/${pkgname}/LICENSE" \
     "${srcdir}"
}

build() {
  cd "${srcdir}/go"
  export CGO_ENABLED=0
  go build \
    -trimpath \
    -o "${srcdir}/csctl" \
    -ldflags "-s -w -X codeberg.org/mohterbaord/color-scheme-control/cmd.version=${pkgver}" \
    .

  "${srcdir}/csctl" completion bash >"${srcdir}/csctl.bash"
  "${srcdir}/csctl" completion zsh  >"${srcdir}/_csctl"
  "${srcdir}/csctl" completion fish >"${srcdir}/csctl.fish"
}

check() {
  cd "${srcdir}/go"
  go test './...'
}

package() {
  install -Dm755 "${srcdir}/csctl" -t "${pkgdir}/usr/bin/"

  install -Dm644 "${srcdir}/csctl.bash"    "${pkgdir}/usr/share/bash-completion/completions/csctl"
  install -Dm644 "${srcdir}/_csctl"     -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -Dm644 "${srcdir}/csctl.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"

  install -Dm644 "${srcdir}/color-scheme-control.service" -t "${pkgdir}/usr/lib/systemd/user/"

  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${srcdir}/LICENSE"   -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
