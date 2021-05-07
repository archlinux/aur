# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>

pkgname=micropython-lib-git
pkgver=1.9.3.r144.geae01bd
pkgrel=1
epoch=2
pkgdesc="Core Python libraries ported to MicroPython (git version)"
arch=('any')
url="http://micropython.org/"
license=('MIT')
depends=('micropython')
makedepends=('git' 'python')
conflicts=('micropython-lib')
provides=('micropython-lib')
options=('!emptydirs')
source=('git+https://github.com/micropython/micropython-lib.git')
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/micropython-lib"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/micropython-lib"
  make
}

package() {
  cd "$srcdir/micropython-lib"
  for _d in $(find -mindepth 1 -maxdepth 1 -type d -iname '[_a-z]*' | sort); do
    pkg="${_d#*/}"
    if grep -qr 'import metadata' ./$_d/*; then
      warning "Skipping ${pkg} (bad import)."
      continue
    fi
    if [[ ! -f $_d/setup.py ]]; then
      warning "Skipping ${pkg} (no setup)."
      continue
    fi
    if test -f $_d/metadata.txt && grep '^srctype *= *dummy' -q $_d/metadata.txt; then
      warning "Skipping ${pkg} (dummy module)."
      continue
    fi
    msg "Installing ${pkg}:"
    cd $_d
    python setup.py install \
      --prefix=/usr \
      --root="${pkgdir}" \
      --install-lib='/usr/lib/micropython' \
      --no-compile \
      --force
    cd ..
  done

  # we don't need the egg-info directories
  msg "Removing .egg-info directories..."
  rm -rf "${pkgdir}"/usr/lib/micropython/*.egg-info

  msg "Fixing shebang lines..."
  find "${pkgdir}/usr/lib/micropython" -name "*.py" -type f -exec \
    sed -r -i -e 's|^#!.*python[23]?$|#!/usr/bin/env micropython|' {} \;

  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
