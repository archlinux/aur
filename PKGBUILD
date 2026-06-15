# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
# Huge thanks to github.com/nebulosa2007 for this version of the PKGBUILD.

pkgname=yabsnap
pkgver=2.4.1
# Note: pkgrel will be bumped when major Python version changes, to recompile bytecode.
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/$pkgname"
license=('Apache')
depends=('bash' 'btrfs-progs' 'python')
optdepends=('rsync: rsync based snapshot support' 'python-textual: for the TUI interface')
makedepends=('tar')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('10ae7c2011c57557b848a9e60eddc487985878a644857751c546183339b68d44')
install="$pkgname.install"

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
  install -Dm 644 completions/bash_"$pkgname" "$pkgdir"/usr/share/bash-completion/completions/"$pkgname"
  install -Dm 644 completions/zsh_"$pkgname" "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname"
  install -Dm 644 "$pkgname".1.gz                          -t "$pkgdir"/usr/share/man/man1/
  cd ../src
  install -Dm 755 "$pkgname".sh -t "$DEST"/
  # Goal: Own the byte codes since non-root execution cannot create them.
  # Note (2025-08-03, v2.2.0): Added -O -m to compile to .opt-1.pyc.
  # Note (2026-06-15, v2.4.1): Dropped the -O. Will compile to .pyc.
  python -m compileall -d /usr/share/"$pkgname" "$DEST"
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/"$pkgname"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
}

