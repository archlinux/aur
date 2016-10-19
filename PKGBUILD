# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=snazzer-git
pkgver=r174.37f6e5f
pkgrel=1
pkgdesc="btrfs snapshotting and backup system offering snapshot measurement, transport and pruning. "
arch=('any')
url="https://github.com/csirac2/snazzer"
license=('BSD')
depends=('btrfs-progs')
makedepends=('git')
source=("git+https://github.com/csirac2/snazzer.git")

pkgver() {
  cd "snazzer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/snazzer"

  make manpages
}

test() {
  cd "$srcdir/snazzer"

  make test
}

package() {
  cd "$srcdir/snazzer"

  make INSTALL_PREFIX="$pkgdir/usr/bin" install

  for script in snazzer snazzer-measure snazzer-prune-candidates snazzer-receive snazzer-send-wrapper; do
    gzip -f "man/${script}.8"
    install -Dm644 "man/${script}.8.gz" "$pkgdir/usr/share/man/man8/${script}.8.gz"
  done
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
sha256sums=('SKIP')
