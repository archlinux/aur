# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=bats-core
pkgname=$_name
pkgver=1.2.1
_mainfolder=$_name-$pkgver
pkgrel=1
pkgdesc='Bash Automated Testing System'
arch=(any)
url=https://github.com/bats-core/bats-core
license=(MIT)
depends=(bash)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('91c49b1fe6f0656c46491929ed728f8dfa9a96df0cce294963e8c6082bff87a2')
conflicts=(bash-bats)
provides=(bash-bats)

check() {
  cd "$srcdir/$_mainfolder"
  bin/bats --tap test
}

package() {
  cd "$srcdir/$_mainfolder"

  # In Arch Linux the correct path is /usr/lib and not /usr/libexec, see
  # https://wiki.archlinux.org/index.php/Arch_package_guidelines#Package_etiquette
  #
  # Also rename the bats-core/ folder to bats/
  sed -i 's/BATS_ROOT\/libexec\/bats-core\/bats/BATS_ROOT\/lib\/bats\/bats/g' bin/bats

  # Rename the bats-core/ folder to bats/
  sed -i 's/BATS_ROOT\/lib\/bats-core\//BATS_ROOT\/lib\/bats\//g' libexec/bats-core/*

  install -dm755 "$pkgdir"/{usr/bin,usr/lib/bats,usr/share/man/man{1,7},usr/share/licenses/$_name}
  install -m 755 "bin"/* "$pkgdir/usr/bin"
  install -m 755 "lib/bats-core"/* "$pkgdir/usr/lib/bats"
  install -m 755 "libexec/bats-core"/* "$pkgdir/usr/lib/bats"
  install -m 644 "man/bats.1" "$pkgdir/usr/share/man/man1"
  install -m 644 "man/bats.7" "$pkgdir/usr/share/man/man7"
  install -m 644 LICENSE.md "$pkgdir"/usr/share/licenses/$_name/LICENSE.md
}
