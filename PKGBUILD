# Maintainer: quantulr <35954003+quantulr@users.noreply.github.com>
pkgname=gitea-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Official Gitea CLI — Rework of tea cli (repos, issues, PRs, releases)"
arch=('x86_64' 'aarch64')
url="https://gitea.com/gitea/cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('587669217030aabf4f1c344187832dbd1c41cf849fc4525a1cdbc11a11390c84')

build() {
  cd cli
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
  go build \
    -ldflags "-X gitea.dev/cli/internal/version.Version=$pkgver" \
    -o gt ./cmd/gt
  # generate man pages and shell completions (dated to the release)
  SOURCE_DATE_EPOCH=1793577600 go run ./tools/cli-docs --out docs/generated
}

check() {
  cd cli
  # tests assume single-column width for East Asian ambiguous runes
  LC_ALL=C.UTF-8 go test ./...
}

package() {
  cd cli
  install -Dm755 gt "$pkgdir/usr/bin/gt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/man/man1/" docs/generated/man/*.1
  install -Dm644 docs/generated/completion/gt.bash "$pkgdir/usr/share/bash-completion/completions/gt"
  install -Dm644 docs/generated/completion/_gt "$pkgdir/usr/share/zsh/site-functions/_gt"
  install -Dm644 docs/generated/completion/gt.fish "$pkgdir/usr/share/fish/vendor_completions.d/gt.fish"
  install -Dm644 docs/generated/completion/gt.ps1 "$pkgdir/usr/share/powershell/Modules/gt/gt.ps1"
}
