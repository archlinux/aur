# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=bats-core
pkgname=$_name-git
pkgver=v1.2.1.r16.gda118fd
_mainfolder=$_name
pkgrel=1
pkgdesc='Bash Automated Testing System'
arch=(any)
url=https://github.com/bats-core/bats-core
license=(MIT)
depends=(bash)
makedepends=(git)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(bash-bats)
provides=(bash-bats)

pkgver() {
  cd "$srcdir/$_mainfolder"

  # from https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

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
