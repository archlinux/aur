# Maintainer: kobe-koto <k [at] koto [dot] cc>
pkgname=preaur-git
_repo=PreAUR
pkgver=0.0.6.r0.g9bcf9c7
pkgrel=1
pkgdesc="PreAUR, build AUR (not only) pkgbuilds ahead of time."
arch=('any')
url="https://github.com/kobe-koto/$_repo"
license=('MIT')
depends=(
  'bun'
  'git'
  'devtools'
  'base-devel'
)
makedepends=(
  'git'
)
provides=('preaur')
conflicts=('preaur')
source=(
  "git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_repo"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$_repo"
  bun install --frozen-lockfile
  bun run build
  bun run gen-schema
}

package() {
  local repo_dir="$srcdir/$_repo"

  install -Dm755 "$repo_dir/dist/index.js" "$pkgdir/usr/bin/preaur"
  install -Dm644 "$repo_dir/preaur.schema.json" "$pkgdir/usr/share/preaur/preaur.schema.json"
  install -Dm644 "$repo_dir/docs/config-reference.md" "$pkgdir/usr/share/doc/$pkgname/config-reference.md"
  install -Dm644 "$repo_dir/docs/man/preaur.1" "$pkgdir/usr/share/man/man1/preaur.1"
  install -Dm644 "$repo_dir/docs/man/preaur-config.5" "$pkgdir/usr/share/man/man5/preaur-config.5"
  install -Dm644 "$repo_dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
