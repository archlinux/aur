# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=bats-core
pkgname=$_name-git
pkgver=v1.2.0.r26.gb0671a6
_mainfolder=$_name
pkgrel=1
pkgdesc='Bash Automated Testing System'
arch=(any)
url=https://github.com/bats-core/bats-core
license=(MIT)
depends=(bash)
makedepends=(git)
source=("git+$url" fix-libexec-path.patch)
sha256sums=('SKIP'
            '1195fa67108f42eac2028dabcf65b7dc687ebcfab8c33f34f481bc8d6d4a56dd')
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

  patch -p1 -i "$srcdir/fix-libexec-path.patch"

  install -dm755 "$pkgdir"/{usr/bin,usr/lib/bats,usr/share/man/man{1,7},usr/share/licenses/$_name}
  install -m 755 "bin"/* "$pkgdir/usr/bin"
  install -m 755 "libexec/bats-core"/* "$pkgdir/usr/lib/bats"
  install -m 644 "man/bats.1" "$pkgdir/usr/share/man/man1"
  install -m 644 "man/bats.7" "$pkgdir/usr/share/man/man7"
  install -m 644 LICENSE.md "$pkgdir"/usr/share/licenses/$_name/LICENSE.md
}
