# Maintainer: Jonne Haß <me@jhass.eu>
pkgname=snazzer-git
pkgver=r146.8d85449
pkgrel=2
pkgdesc="btrfs snapshotting and backup system offering snapshot measurement, transport and pruning. "
arch=('any')
url="https://github.com/csirac2/snazzer"
license=('BSD')
depends=('btrfs-progs')
source=("git+https://github.com/csirac2/snazzer.git")

pkgver() {
  cd "snazzer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/snazzer"

  for script in snazzer snazzer-measure snazzer-prune-candidates snazzer-receive snazzer-send-wrapper; do
    install -Dm755 "$script" "$pkgdir/usr/bin/$script"
    pod2man --release="$pkgver" "$srcdir/snazzer/$script" > "${script}.1"
    gzip -f "${script}.1"
    install -Dm644 "${script}.1.gz" "$pkgdir/usr/share/man/man1/${script}.1.gz"
  done
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp -av doc/* "$pkgdir/usr/share/doc/$pkgname"
}
sha256sums=('SKIP')
