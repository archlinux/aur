# Maintainer: Milk Brewster <milk on freenode>
_pkgname=stegosaurus-lv2
pkgname=${_pkgname}-git
pkgver=r20.0063d67
pkgrel=1
pkgdesc="lv2 drum synthersizer without sampling (patched fork)"
arch=(x86_64)
url="https://github.com/mxmilkiib/stegosaurus"
license=('GPL')
groups=()
depends=('lv2' 'cairo')
makedepends=('git')
provides=()
conflicts=()
install=
source=('git+https://github.com/mxmilkiib/stegosaurus')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/stegosaurus"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/stegosaurus"
  # Extract waf and patch removed 'imp' module for Python 3.12+
  ./waf --help >/dev/null 2>&1 || true
  wafdir=$(find . -maxdepth 1 -name '.waf*' -type d | head -1)
  if [[ -n "$wafdir" ]]; then
    sed -i 's/import os,re,imp,sys/import os,re,types,sys/' "$wafdir/waflib/Context.py"
    sed -i 's/imp\.new_module/types.ModuleType/g' "$wafdir/waflib/Context.py"
    sed -i "s/import imp;print(imp.get_tag())/import importlib;print('cpython')/" "$wafdir/waflib/Tools/python.py"
    # Patch: 'rU' mode removed in Python 3.12+
    find "$wafdir/waflib" -name '*.py' -exec sed -i "s/'rU'/'r'/g" {} +
  fi
  CFLAGS+=" -fcommon" ./waf configure --prefix=/usr
}

build() {
  cd "$srcdir/stegosaurus"
  ./waf
}

package() {
  cd "$srcdir/stegosaurus"
  # make PREFIX=/usr DESTDIR="$pkgdir/" install
  ./waf install --destdir=$pkgdir
}
