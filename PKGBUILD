# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

_plugin_uri='http://nickbailey.co.nr/triceratops'
pkgname=triceratops
pkgver=0.5.0
pkgrel=2
pkgdesc='Polyphonic synthesizer LV2 plugin'
arch=(aarch64 x86_64)
url='https://sourceforge.net/projects/triceratops/'
license=(GPL3)
groups=(lv2-plugins pro-audio)
depends=(gtkmm)
makedepends=(python lv2)
checkdepends=(lv2lint)
optdepends=('lv2-host: for loading the LV2 plugin')
provides=($pkgname.lv2)
conflicts=($pkgname.lv2)
source=("https://downloads.sourceforge.net/project/triceratops/${pkgname}_v${pkgver}_Oct_2022.tar.gz"
        'triceratops-gui-instantiate.patch'
        'triceratops-remove-printf.patch'
        'triceratops-symbol-visibility.patch'
        'triceratops-ttl.patch')
sha256sums=('93b2d74bb611fc3a26c2060ba678656b89d7ddba5b9e31e27a5758ec9924596e'
            'c2442694fbde36782d419e5d2e6c61b9b61eaaa4f464e7b3895a555c731ad9fc'
            '316e46bfe6c18aa2032fd66fa9a95b32a8b657a8e4b0b3c77246d44942bc8e75'
            '7f993a07d1e32876e49f2477b17c2349e886864ae694d0035f4e000f53d1cc9d'
            '1083b10d0a004b3dd39afe37f6385d815e7cfdd26078aa7bcf85e2fc24afc262')

prepare() {
  cd $pkgname
  # Fix warning due to invalid type conversion in LV2UI_Handle instantiation
  # https://github.com/thunderox/triceratops/pull/11
  patch -p1 -N -r - -i "$srcdir"/triceratops-gui-instantiate.patch
  # Remove left-over printf debugging statement in LV2 UI descriptor function
  # https://github.com/thunderox/triceratops/pull/13
  patch -p1 -N -r - -i "$srcdir"/triceratops-remove-printf.patch
  # Don't export any symbols except LV2 descriptor
  # https://github.com/thunderox/triceratops/pull/12
  patch -p1 -N -r - -i "$srcdir"/triceratops-symbol-visibility.patch
  # Fix lvlint errors and warnings
  # https://sourceforge.net/p/triceratops/bugs/15/
  patch -p1 -N -r - -i "$srcdir"/triceratops-ttl.patch
}

build() {
  cd $pkgname
  # Supress glib deprecation warnings about use of outdated types by GTK2
  export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"
  python waf configure --prefix=/usr
  python waf
}

check() {
  cd $pkgname
  mkdir -p lv2
  ln -sf ../build/$pkgname.lv2 lv2/$pkgname.lv2
  LV2_PATH="$PWD/lv2:/usr/lib/lv2" lv2lint -M pack \
    -s *_bss* \
    -s __end__ \
    "$_plugin_uri"
}

package() {
  cd $pkgname
  python waf install --destdir="$pkgdir"
}
