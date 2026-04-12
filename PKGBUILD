# Maintainer: Assaf Sapir <assaf@example.com>
pkgname=naruto-git
pkgver=r14.2488502
pkgrel=1
pkgdesc="Smart AUR helper CLI (development version)"
arch=('x86_64' 'aarch64')
url="https://github.com/assapir/naruto"
license=('GPL-3.0-or-later')
depends=('nodejs')
makedepends=('git' 'pnpm')
provides=('naruto')
conflicts=('naruto')
options=(!debug)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/naruto"
  # Ignore the checked-in AUR metadata so CI sync commits do not bump pkgver.
  local paths=('.' ':(exclude)aur/naruto-git/**')
  printf "r%s.%s" \
    "$(git rev-list --count HEAD -- "${paths[@]}")" \
    "$(git log -1 --format=%h -- "${paths[@]}")"
}

build() {
  cd "$srcdir/naruto"
  pnpm install --prod --frozen-lockfile --config.store-dir="$srcdir/pnpm-store"
}

package() {
  cd "$srcdir/naruto"
  install -dm755 "$pkgdir/usr/lib/naruto"
  cp -r src node_modules package.json pnpm-lock.yaml "$pkgdir/usr/lib/naruto/"
  rm -f "$pkgdir/usr/lib/naruto/node_modules/.modules.yaml"
  chmod +x "$pkgdir/usr/lib/naruto/src/bin.ts"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/naruto/src/bin.ts" "$pkgdir/usr/bin/naruto"
}
