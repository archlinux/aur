# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=psi-plugins
_pkgname=$_name.lv2
pkgname=$_pkgname-git
pkgver=0.0.1.r16.83f318d
pkgrel=2
pkgdesc='A small collection of LV2 plugins ideal for (but not limited to) electronic music (git version)'
arch=(x86_64)
url='https://github.com/ycollet/psi-plugins'
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc)
makedepends=(git lv2 ntk python2)
provides=($_pkgname)
conflicts=($_pkgname)
groups=(lv2-plugins)
optdepends=(
  'lv2-host: for loading the LV plugins'
)
source=("$_pkgname::git+https://github.com/ycollet/psi-plugins"
        'psi-plugins-lv2ui-descriptor.diff')
sha256sums=('foo'
            'c0664d2897fb34bf6d6896b54c54aae904758b0a535c30a5a5ea54c9648d0522')

_plugins=(
  midi_gate-psi
  midi_rnd-psi
  sidechain_gate-psi
  super_welle-psi
)

pkgver() {
  cd $_pkgname
  local ver=$(grep '^VERSION' wscript | cut -d "'" -f 2)
  echo ${ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd $_pkgname
  patch -p1 -N -i "$srcdir"/psi-plugins-lv2ui-descriptor.diff
}

build() {
  cd $_pkgname
  ./waf configure --prefix=/usr
  ./waf build $MAKEFLAGS
}

package() {
  depends+=(libcairo.so libntk.so libntk_images.so)
  cd $_pkgname
  ./waf install --destdir="$pkgdir"

  # Move README.md files out of LV2 bundles into doc dir
  for plugin in ${_plugins[*]}; do
    install -dm755 "$pkgdir"/usr/share/doc/$pkgname/
    mv "$pkgdir"/usr/lib/lv2/$plugin.lv2/README.md \
      "$pkgdir"/usr/share/doc/$pkgname/README-$plugin.md
  done
}
