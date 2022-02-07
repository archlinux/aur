# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>

pkgname=('espeak-ng' 'espeak-ng-espeak')
pkgbase=espeak-ng
pkgver=1.50
pkgrel=5
pkgdesc='Multi-lingual software speech synthesizer'
url=https://github.com/espeak-ng/espeak-ng
arch=('x86_64')
license=('GPL3')
makedepends=('pcaudiolib' 'ruby-ronn-ng')
options=(debug)
source=("$url/archive/$pkgver/espeak-ng-$pkgver.tar.gz"
        'espeak-ng-fix-699.patch::https://github.com/espeak-ng/espeak-ng/commit/e11cd42b03d1628f7a0cf45c9406123282e25c63.patch')
b2sums=('c64c2a474374d4b6fe13bf3a99f5dfb661923c13ebd6c0bc323e7f26d9d90945c7075cc5c8f4b51e5db3303632c8c9daca7a65a1883e09d7c3faf63dd725ea3f'
        'c90b6c1a08fed25183ae1601f1935e7742878a6242b5cd2bb87d19fa9b3e89d62f5c4432d388e9dcb6a0921ba188aeffe4d63143142b4070ad49dce4c758f45c')

prepare() {
  cd espeak-ng-$pkgver
  ./autogen.sh

  # https://github.com/espeak-ng/espeak-ng/issues/699
  patch --forward --strip=1 --input=../espeak-ng-fix-699.patch
}

build() {
  cd espeak-ng-$pkgver
  ./configure --prefix=/usr --with-extdict-{ru,zh,zhy}
  make src/espeak-ng src/speak-ng
  make -j1
}

package_espeak-ng() {
  depends=('pcaudiolib')
  optdepends=('espeak-ng-espeak: for *speak symlinks')
  cd espeak-ng-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/vim/{addons,vimfiles}
  rm -r "$pkgdir"/usr/{bin/*speak,include/espeak,share/vim/registry}
}

package_espeak-ng-espeak() {
  pkgdesc+=' (*speak symlinks)'
  depends=('espeak-ng')
  conflicts=('espeak')
  install -d "$pkgdir"/usr/{bin,include/espeak,share/man/man1}
  ln -s espeak-ng "$pkgdir"/usr/bin/espeak
  ln -s speak-ng "$pkgdir"/usr/bin/speak
  ln -s ../espeak-ng/speak_lib.h "$pkgdir"/usr/include/espeak/speak_lib.h
  ln -s espeak-ng.1.gz "$pkgdir"/usr/share/man/man1/espeak.1.gz
  ln -s speak-ng.1.gz "$pkgdir"/usr/share/man/man1/speak.1.gz
}

# vim:set ts=2 sw=2 et:
