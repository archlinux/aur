# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=copilot-cli
pkgver=1.13.0
pkgrel=1
pkgdesc='A tool to help deploy containerized applications on Amazon ECS'
arch=(x86_64)
url='https://github.com/aws/copilot-cli'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
  cd $pkgname-$pkgver

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags="-X github.com/aws/copilot-cli/internal/pkg/version.Version=v$pkgver" \
    ./cmd/copilot
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/copilot" "$pkgdir/usr/bin/copilot"

  # Populate bash and zsh completions
  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/copilot" completion bash > "$pkgdir/usr/share/bash-completion/completions/copilot"
  "$pkgdir/usr/bin/copilot" completion zsh > "$pkgdir/usr/share/zsh/site-functions/_copilot"
}

sha256sums=('229bb507557dd3f553c0ad6bde863d554fc3393d158b4b550021f781be498efb')
