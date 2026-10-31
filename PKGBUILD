# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/aur.ttcli

pkgname=ttcli
pkgver=0.6.0
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
sha256sums=('258bc6fe9eb6ca42801c8bbb1242e38c0c38e4ee8471fa6b8594b4cefc8f5a8b')

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
