# Maintainer: darkfeline@felesatra.moe

pkgname=non-mixer-lv2-git
pkgver=non.sequencer.v1.9.4.r1725.g257ec59
pkgrel=1
pkgdesc="Jack audio mixer from the NON DAW + LV2 plugin patch by falkTX and others"
arch=('x86_64' 'i686')
url="http://non.tuxfamily.org/"
license=('GPL2')
provides=('non-mixer' 'non-mixer-lv2-git')
conflicts=('non-mixer' 'non-mixer-git' 'non-mixer-lv2-git')
depends=('ntk' 'jack' 'liblo' 'ladspa' 'liblrdf' 'lv2' 'lilv')
makedepends=('git')
source=('git+https://github.com/falktx/non.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/non
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/^non-daw-v//;s/-/./g'
}

prepare() {
  cd $srcdir/non
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
}

build() {
  cd $srcdir/non
  ./waf configure --prefix=/usr --project=mixer
  ./waf
}

package() {
  cd $srcdir/non
  ./waf install --destdir="$pkgdir"
}
