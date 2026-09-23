# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.ttcli

pkgname=ttcli
pkgver=0.3.0
pkgrel=1
pkgdesc="TickTick CLI - tasks, lists, and pomodoro/focus records from the terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/j4y-w4lk3r/ttcli"
license=('MIT')
depends=('glibc')
makedepends=('go')
optdepends=('1password-cli: ttcli login and automatic session refresh'
            'libnotify: desktop notifications')
conflicts=('ttcli-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4y-w4lk3r/ttcli/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2f1bd53972d91416f5fdcde841f8b8370a3ec314f754a6c8511117434e1af9f1')

prepare() {
  cd "${pkgname}-${pkgver}"
  go mod download
}

build() {
  cd "${pkgname}-${pkgver}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build -o ttcli \
    -ldflags "-linkmode=external -X github.com/j4y-w4lk3r/ttcli/internal/version.Version=${pkgver}" \
    ./cmd/ttcli
}

check() {
  cd "${pkgname}-${pkgver}"
  # upstream tests assume the author's local timezone
  TZ=Europe/Berlin go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 ttcli "${pkgdir}/usr/bin/ttcli"
  install -Dm644 completions/_ttcli "${pkgdir}/usr/share/zsh/site-functions/_ttcli"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
