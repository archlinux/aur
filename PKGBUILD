# Maintainer: AsamK <asamk@gmx.de>
pkgname=sequoia-octopus-librnp-git
_pkgname=sequoia-octopus-librnp
pkgver=1.5.0.r9.gfb59485
pkgrel=1
pkgdesc='A Sequoia-based OpenPGP Backend for Thunderbird'
url="https://gitlab.com/sequoia-pgp/${_pkgname}"
source=("$pkgname::git+https://gitlab.com/sequoia-pgp/${_pkgname}.git"
        "${pkgname}.hook")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL2')
makedepends=('cargo' 'clang' 'git')
conflicts=('sequoia-octopus-librnp')
install="${pkgname}.install"
depends=('thunderbird')
sha256sums=('SKIP'
            'aa2bda370a1e9b4a880e275291caac486db65095c34d013561d6127777589709')
pkgver() {
        cd "$srcdir/$pkgname"

        ( set -o pipefail
          git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}

build () {
  cd "$srcdir/$pkgname"

  cargo build --locked --release --target-dir target
}

# Improve when https://bugzilla.mozilla.org/show_bug.cgi?id=1698540 is done
package() {
  cd "$srcdir/$pkgname"

  install -Dm755 target/release/libsequoia_octopus_librnp.so "${pkgdir}/usr/lib/libsequoia_octopus_librnp.so"
  install -Dm644 "${srcdir}/${pkgname}.hook" "${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook"
}
