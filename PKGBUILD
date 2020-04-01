# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

pkgname=bats-core-git
pkgver=r13.045eb7d
pkgrel=1
pkgdesc='Bash Automated Testing System'
arch=('any')
url='https://github.com/bats-core/bats-core'
license=('MIT')
depends=('bash')
makedepends=('git')
source=("git+$url" fix-libexec-path.patch)
sha256sums=('SKIP'
            '2866f0d1a0c3797046d5b0734868281c0f7595cae4f9392ec31e3de9bfb1aa2e')
conflicts=(bash-bats)
provides=(bash-bats)

pkgver() {
  cd "$srcdir/$_name"

  # from https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

check() {
  cd "${srcdir}/bats-core"
  bin/bats --tap test
}

package() {
  cd "${srcdir}/bats-core"

  patch -p1 -i "${srcdir}/fix-libexec-path.patch"

  install -dm755 "${pkgdir}"/{usr/bin,usr/lib/bats,usr/share/man/man{1,7},usr/share/licenses/${pkgname}}
  install -m 755 "bin"/* "${pkgdir}/usr/bin"
  install -m 755 "libexec/bats-core"/* "${pkgdir}/usr/lib/bats"
  install -m 644 "man/bats.1" "${pkgdir}/usr/share/man/man1"
  install -m 644 "man/bats.7" "${pkgdir}/usr/share/man/man7"
  install -m 644 LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
