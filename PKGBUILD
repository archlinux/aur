# Maintainer: Leoanrd Dauksza <leoanrd@dauksza.com>

pkgname=web-git
pkgver=r6.0b60d6d
pkgrel=1
pkgdesc="Shell command for LLM web browsing by Chris McCord"
arch=('x86_64' 'aarch64')
url="https://github.com/chrismccord/web"
license=('MIT')
depends=()
makedepends=('git' 'go')
provides=('web')
conflicts=('web')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# NOTE:
# Go binaries typically trigger namcap RELRO/PIE warnings.
# The Go toolchain handles linking internally and does not use the GNU ld flags
# (-Wl,-z,relro,-z,now or -pie) that namcap checks for.
# These warnings are harmless and expected.

build() {
  cd "$pkgname"
  export CGO_ENABLED=0
  export GOFLAGS="-trimpath"
  go build -o web -ldflags="-s -w -X main.version=${pkgver}" .
}

check() {
  cd "$pkgname"
  ./web --help >/dev/null 2>&1
}

package() {
  cd "$pkgname"
  install -Dm755 web "$pkgdir/usr/bin/web"

  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}