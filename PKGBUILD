# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Florian Hülsmann <fh@cbix.de>

_projectname=Aether
pkgname=aether.lv2
pkgver=1.2.1
pkgrel=2
pkgdesc='An algorithmic reverb LV2 plugin based on Cloudseed'
arch=(x86_64 aarch64)
url='https://dougal-s.github.io/Aether'
license=(MIT)
groups=(lv2-plugins pro-audio)
depends=(gcc-libs libglvnd libx11)
makedepends=(cmake glu md4c)
checkdepends=(lv2lint)
optdepends=('lv2-host: for running the plugin')
_pugl_ref=9fd2cd2
_nanovg_ref=077b65e
source=("$_projectname-$pkgver.tar.gz::https://github.com/Dougal-s/$_projectname/archive/refs/tags/v$pkgver.tar.gz"
        "pugl-$_pugl_ref.tar.gz::https://gitlab.com/lv2/pugl/-/archive/$_pugl_ref/pugl-$_pugl_ref.tar.gz"
        "nanovg-$_nanovg_ref.tar.gz::https://github.com/memononen/nanovg/archive/$_nanovg_ref.tar.gz"
        'checkout-1162d0e.patch::https://github.com/Dougal-s/Aether/compare/v1.2.1...1162d0e.patch')
sha256sums=('9c377f9c1feb7fbee055ef2d0d733b6d37b11fe5d92064043afecf282b440a01'
            '571763637ec95e85f8066ce0925de6075a1970cb8e1dbcdec61c702f6442d8f5'
            'dc629e44703a84eba987eacfd45635bbeb48ec011a4b0e58c31fd7dc3c3485b7'
            'a80569d0f3d28dd18b76681ef17e2a7d99450d30169f30ce2fda3425ef22a467')
# these need to be extracted to the expected paths
noextract=("pugl-$_pugl_ref.tar.gz" "nanovg-$_nanovg_ref.tar.gz")

prepare() {
  cd $_projectname-$pkgver
  # extract submodules
  bsdtar -xf ../pugl-$_pugl_ref.tar.gz -C extern/pugl --strip-components 1
  bsdtar -xf ../nanovg-$_nanovg_ref.tar.gz -C extern/nanovg --strip-components 1

  # A crash is already fixed in master
  patch -Np1 -i ../checkout-1162d0e.patch
}

build() {
  cmake -B build -S $_projectname-$pkgver \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build

  cd $_projectname-$pkgver/usermanual
  md2html -f --github USERMANUAL.md > index.html
}

check() {
  lv2lint -Mpack -I build/$pkgname \
    -t "UI Symbols" \
    http://github.com/Dougal-s/Aether
}

package() {
  depends+=(ttf-roboto)

  cd $_projectname-$pkgver
  install -vDm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
  install -vDm644 usermanual/* -t "$pkgdir"/usr/share/doc/$pkgname

  cd "$srcdir"/build/$pkgname
  install -vDm755 *.so -t "$pkgdir"/usr/lib/lv2/$pkgname
  install -vDm644 *.ttl -t "$pkgdir"/usr/lib/lv2/$pkgname
  install -d "$pkgdir"/usr/lib/lv2/$pkgname/fonts
  ln -vs /usr/share/fonts/TTF/Roboto-{Light,Regular}.ttf -t "$pkgdir"/usr/lib/lv2/$pkgname/fonts
}
