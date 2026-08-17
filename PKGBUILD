# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=yabsnap-git
pkgver=r384.c62289a
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/yabsnap"
license=('Apache')
depends=('bash' 'btrfs-progs' 'python')
optdepends=('rsync: rsync based snapshot support' 'python-textual: for the TUI interface')
makedepends=('tar')
provides=("yabsnap=${pkgver}")
conflicts=('yabsnap')
source=("$pkgname::git+https://github.com/hirak99/yabsnap")
md5sums=('SKIP')
install="$pkgname".install

pkgname_main="yabsnap"

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"/artifacts
  # One-time action to do after downloading the package.
  gzip -c "$pkgname_main".manpage > "$pkgname_main".1.gz
}

package() {
  cd "$pkgname"

  readonly DEST="$pkgdir"/usr/share/"$pkgname_main"

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
  install -Dm 644 services/"$pkgname_main".{service,timer}      -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 664 pacman/*.hook     -t "$pkgdir"/usr/share/libalpm/hooks/
  install -Dm 644 completions/bash_"$pkgname_main" "$pkgdir"/usr/share/bash-completion/completions/"$pkgname_main"
  install -Dm 644 completions/zsh_"$pkgname_main" "$pkgdir"/usr/share/zsh/site-functions/_"$pkgname_main"
  install -Dm 644 "$pkgname_main".1.gz                          -t "$pkgdir"/usr/share/man/man1/
  cd ../src
  install -Dm 755 "$pkgname_main".sh -t "$DEST"/
  # Goal: Own the byte codes since non-root execution cannot create them.
  # Note (2025-08-03, v2.2.0): Added -O -m to compile to .opt-1.pyc.
  # Note (2026-06-15, v2.4.1): Dropped the -O. Will compile to .pyc.
  python -m compileall -d /usr/share/"$pkgname_main" "$DEST"
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/"$pkgname_main"/"$pkgname_main".sh "$pkgdir"/usr/bin/"$pkgname_main"
}

