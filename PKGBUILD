# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Sebastian Wolf <fatmike303 at googlemail dot com>

pkgname=chipmachine
pkgver=1.3c
pkgrel=2
pkgdesc='Demoscene/Retro Music Player'
arch=('i686' 'x86_64')
url='https://github.com/sasq64/chipmachine'
license=('MIT')
depends=('mpg123' 'glew' 'glfw' 'curl')
makedepends=('cmake' 'vim' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sasq64/$pkgname/archive/v$pkgver.tar.gz"
        "git+https://github.com/sasq64/apone.git#commit=d320e07159a35f47cbc81ea45f145c27a976f98c"
        "chipmachine-1.3c-two-missing-std-specifiers.patch"
        "chipmachine-1.3c-fixed-against-latest-apone.patch")
sha256sums=('fe83080035a6ba23917a79b9133e29b2b934e7711fb21e8039eff3a9411fd354'
            'SKIP'
            '7dc76d37e016a5109efb471b30b3c46246ea231ad3cd6e45bd8a6a438cccfd44'
            '531db4559b7cb57e20409e26d500aa82dc8e6c03aa437547affdd88c5cb03997')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../chipmachine-1.3c-two-missing-std-specifiers.patch
  patch -p1 -i ../chipmachine-1.3c-fixed-against-latest-apone.patch
  mkdir -p ../build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/{bin,share/chipmachine}
  install -m755 ../build/{chipmachine,cm} "$pkgdir"/usr/bin/
  cp -r data lua "$pkgdir"/usr/share/chipmachine/
  install -Dm644 ../apone/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
