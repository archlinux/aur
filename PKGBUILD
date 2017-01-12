# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>

_aponecommit=d320e07159a35f47cbc81ea45f145c27a976f98c
_patchcommit1=31181465d5c8ba87efa6450c149dc00acffe0f6d
_patchcommit2=44ed091a4305b2231595bd7f62c11803eb66aeb7

pkgname=chipmachine
pkgver=1.3c
pkgrel=1
pkgdesc='A demoscene/retro Jukebox/spotify-like music player'
arch=('i686' 'x86_64')
url='https://github.com/sasq64/chipmachine'
license=('MIT')
depends=('mpg123' 'glew' 'glfw' 'curl')
makedepends=('cmake' 'ninja' 'vim')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sasq64/$pkgname/archive/v$pkgver.tar.gz"
        "apone.tar.gz::https://github.com/sasq64/apone/archive/$_aponecommit.tar.gz"
        "two-missing-std-specifiers.patch::https://github.com/sasq64/$pkgname/commit/$_patchcommit1.patch"
        "fixed-against-latest-apone.patch::https://github.com/sasq64/$pkgname/commit/$_patchcommit2.patch")
sha256sums=('fe83080035a6ba23917a79b9133e29b2b934e7711fb21e8039eff3a9411fd354'
            'fc9e60c3b57065ec0b65dff649aa4bd4212e3ec8c496326be63d9cf5fe427499'
            '7dc76d37e016a5109efb471b30b3c46246ea231ad3cd6e45bd8a6a438cccfd44'
            '531db4559b7cb57e20409e26d500aa82dc8e6c03aa437547affdd88c5cb03997')

prepare() {
  cd $pkgname-$pkgver

  # https://github.com/sasq64/chipmachine/commit/3118146
  patch -p1 -i ../two-missing-std-specifiers.patch

  # https://github.com/sasq64/chipmachine/commit/44ed091
  patch -p1 -i ../fixed-against-latest-apone.patch

  ln -s "$srcdir"/apone-$_aponecommit ../apone
  mkdir ../build
}

build() {
  cd build

  cmake ../$pkgname-$pkgver \
    -GNinja -DCMAKE_BUILD_TYPE=Release
  ninja
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/{bin,lib/chipmachine,share/chipmachine}

  install -m755 ../build/{chipmachine,cm} "$pkgdir"/usr/lib/chipmachine/
  ln -s /usr/lib/chipmachine/chipmachine "$pkgdir"/usr/bin/chipmachine
  ln -s /usr/lib/chipmachine/cm "$pkgdir"/usr/bin/chipmachine-cli

  cp -r data lua "$pkgdir"/usr/share/chipmachine/
  ln -s /usr/share/chipmachine/data "$pkgdir"/usr/lib/chipmachine/data

  install -Dm644 ../apone/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
