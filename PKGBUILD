# Maintainer: robertfoster

pkgname=yap-git
pkgver=1.21.r0.0458838
pkgrel=1
pkgdesc="Package software with ease"
arch=('armv6h' 'armv7h' 'arm' 'aarch64' 'i686' 'x86_64')
url="https://github.com/M0Rf30/yap"
license=('GPL3')
# provides=("${pkgname%-git}")
# conflicts=("${pkgname%-git}")
depends=('glibc')
makedepends=('git' 'go' 'upx')
optdepends=(
  'apk-tools: for alpine experimenting on native host'
  'pacman: for arch experimenting on native host'
)
options=('!strip')
source=("${pkgname%-git}::git+${url}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  CGO_ENABLED=0 \
    go build \
    -buildvcs=false \
    -ldflags "-w -s" \
    cmd/yap/yap.go

  upx "${pkgname%-git}"
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 "${pkgname%-git}" \
    "${pkgdir}/usr/bin/${pkgname%-git}"

  mkdir -p "${pkgdir}/usr/share/bash-completion/completions/"
  mkdir -p "${pkgdir}/usr/share/zsh/site-functions/"
  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d/"

  "./${pkgname%-git}" completion bash > \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname%-git}"
  "./${pkgname%-git}" completion zsh > \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname%-git}"
  "./${pkgname%-git}" completion fish > \
    "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname%-git}.fish"

  install -Dm644 -t \
    "${pkgdir}/usr/share/licenses/${pkgname%-git}" LICENSE.md
  install -Dm644 -t \
    "${pkgdir}/usr/share/doc/${pkgname%-git}" README.md
}

sha256sums=('SKIP')
