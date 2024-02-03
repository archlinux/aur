# Maintainer: Arnab Bose <hirak99+arch@gmail.com>
# Huge thanks to github.com/nebulosa2007 for this version of the PKGBUILD.

pkgname=yabsnap
pkgver=2.1.3
pkgrel=1
pkgdesc="Btrfs automated snapshot manager."
arch=('any')
url="https://github.com/hirak99/$pkgname"
license=('Apache')
# Dependencies -
# btrfs-progs: Required for btrfs operations. May change if we extend into rsync
#   rsync based options.
# python3: Runtime. Typically present in a base install.
depends=('bash' 'btrfs-progs' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('393896ffde948398776ac693fdda27f2')
install="$pkgname".install

check() {
  cd "$pkgname"-"$pkgver"/artifacts
  # One-time action to do after downloading the package.
  gzip -c "$pkgname".manpage > "$pkgname".1.gz
}

package() {
  cd "$pkgname"-"$pkgver"
  for file in $(ls -A src/code/*.{py,conf} | grep -v "_test.py")
  do
    install -Dm 644 "$file" "$pkgdir"/usr/share/"$pkgname"/code/"${file##*/}"
  done
  cd artifacts
  install -Dm 644 services/"$pkgname".{service,timer}      -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm 664 pacman/*.hook     -t "$pkgdir"/usr/share/libalpm/hooks/
  install -Dm 644 "$pkgname".1.gz                          -t "$pkgdir"/usr/share/man/man1/
  cd ../src
  install -Dm 755 "$pkgname".sh -t "$pkgdir"/usr/share/"$pkgname"/
  install -d "$pkgdir"/usr/bin
  ln -s /usr/share/"$pkgname"/"$pkgname".sh "$pkgdir"/usr/bin/"$pkgname"
}

