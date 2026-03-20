# Maintainer: miniguys
pkgname=desktopify-lite
pkgver=1.0.0
pkgrel=1
pkgdesc='CLI tool that generates Linux .desktop launchers for websites'
arch=('x86_64' 'aarch64')
url='https://github.com/miniguys/desktopify-lite'
license=('MIT')
makedepends=('git' 'go')
conflicts=('desktopify-lite-git')
source=("$pkgname::git+$url#tag=v1.0.0")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  local commit build_date author pkgmod ldflags
  commit="$(git rev-parse --short HEAD)"
  build_date="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  author='miniguys'
  pkgmod='github.com/miniguys/desktopify-lite/internal/app'
  ldflags="-s -w -X ${pkgmod}.version=${pkgver} -X ${pkgmod}.commit=${commit} -X ${pkgmod}.buildDate=${build_date} -X ${pkgmod}.author=${author}"

  CGO_ENABLED=0 go build -trimpath -ldflags "$ldflags" -o "$pkgname" .
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
