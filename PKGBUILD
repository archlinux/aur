# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=cgrep-clang
pkgname="$_name-git"
pkgver=r110.b21ebb0
pkgrel=1
pkgdesc='grep for C/C++ source files'
arch=('any')
url='https://github.com/bloodstalker/cgrep'
license=('GPL3')
depends=('llvm' 'clang')
makedepends=('git')
source=("$_name::git+$url" "git+https://github.com/bloodstalker/cfe-extra" dont-precompile-header.patch)
sha256sums=('SKIP' 'SKIP' 'e356a34c71aab5ce49c94cf20a48392c19a26c006f1e11bed323b6535c7fb65a')

pkgver() {
  cd "$srcdir/$_name"

  # from https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_name"

  git submodule init
  git config submodule.cfe-extra.url "$srcdir"/cfe-extra
  git submodule update
}

package() {
  cd "$srcdir/$_name"

  # For me compilation fails with enabled precompiled headers
  patch -p1 -i "${srcdir}/dont-precompile-header.patch"

  make

  # `make install` isn't provided, so we have to manually copy the files
  install -dm755 "${pkgdir}"/{usr/bin,usr/share/licenses/${pkgname}}
  install -m 755 cgrep "${pkgdir}/usr/bin"
  install -m 644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.md
}
