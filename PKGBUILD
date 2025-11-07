# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
pkgname=yabsnap-git
pkgver=r313.0d242f0
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/yabsnap"
license=('Apache')
depends=('python3')
makedepends=('rsync')
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

check() {
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
  # Note: The -O compiles to .opt-1.pyc. Starting with v2.2.10, we use -O, and
  # we own the files.
  # See point 2 in https://aur.archlinux.org/packages/yabsnap#comment-1034857
  python -O -m compileall -d /usr/share/"$pkgname_main" "$DEST"
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/"$pkgname_main"/"$pkgname_main".sh "$pkgdir"/usr/bin/"$pkgname_main"
}

