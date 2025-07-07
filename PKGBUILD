# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
# Huge thanks to github.com/nebulosa2007 for this version of the PKGBUILD.

pkgname=yabsnap
pkgver=2.2.9
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/$pkgname"
license=('Apache')
depends=('bash' 'btrfs-progs' 'python')
optdepends=('rsync: rsync based snapshot support')
makedepends=('tar')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('35fecbc59bb401bd9331d15b01c85e45')
install="$pkgname".install

build() {
  cd "$pkgname"-"$pkgver"/artifacts
  # One-time action to do after downloading the package.
  gzip -c "$pkgname".manpage > "$pkgname".1.gz
}

package() {
  cd "$pkgname"-"$pkgver"

  readonly DEST="$pkgdir"/usr/share/"$pkgname"

  mkdir -p "$DEST"
  pushd src/
  tar -cf - \
    $(find -type f -not -name "*_test.py" \( -name "*.py" -o -name "*.conf" \)) |
    tar -xf - -C "$DEST"/ --no-same-owner
  pushd "$DEST"/
  chmod -R u=rwX,go=rX .
  popd
  popd

  cd artifacts
  install -Dm 644 services/"$pkgname".{service,timer}      -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 664 pacman/*.hook     -t "$pkgdir"/usr/share/libalpm/hooks/
  install -Dm 644 "$pkgname".1.gz                          -t "$pkgdir"/usr/share/man/man1/
  cd ../src
  install -Dm 755 "$pkgname".sh -t "$DEST"/
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/"$pkgname"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
}

