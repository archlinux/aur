# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
# Huge thanks to github.com/nebulosa2007 for this version of the PKGBUILD.

pkgname=yabsnap
pkgver=2.2.10
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/$pkgname"
license=('Apache')
depends=('bash' 'btrfs-progs' 'python')
optdepends=('rsync: rsync based snapshot support')
makedepends=('tar')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('c00424caa0deac96164e8c92a2ab4413')
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
  # Note: The -O compiles to .opt-1.pyc. Starting with v2.2.10, we use -O, and
  # we own the files.
  # See point 2 in https://aur.archlinux.org/packages/yabsnap#comment-1034857
  python -O -m compileall -d /usr/share/"$pkgname" "$DEST"
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/"$pkgname"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
}

