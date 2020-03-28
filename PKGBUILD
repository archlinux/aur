# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=('espeak-ng' 'espeak-ng-espeak')
pkgbase=espeak-ng
pkgver=1.50
pkgrel=2
pkgdesc='Multi-lingual software speech synthesizer'
url=https://github.com/espeak-ng/espeak-ng
arch=('x86_64')
license=('GPL3')
makedepends=('pcaudiolib' 'ruby-ronn')
source=("$url/archive/$pkgver/espeak-ng-$pkgver.tar.gz")
sha512sums=('297dd80a6cdae3e2b8acf6823475220ce89d6a5fb68ea303156ad52cb3e7388049b6921759d4ed4e3d2e2ebd19bf931259e454f74a2ac0b7ecf4ce56c1d60c0c')

prepare() {
  cd espeak-ng-$pkgver
  ./autogen.sh
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
  ln -s /usr/bin/espeak-ng "$pkgdir"/usr/bin/espeak
  ln -s /usr/bin/speak-ng "$pkgdir"/usr/bin/speak
  ln -s /usr/include/espeak-ng/speak_lib.h "$pkgdir"/usr/include/espeak/speak_lib.h
  ln -s /usr/share/man/man1/espeak-ng.1.gz "$pkgdir"/usr/share/man/man1/espeak.1.gz
  ln -s /usr/share/man/man1/speak-ng.1.gz "$pkgdir"/usr/share/man/man1/speak.1.gz
}

# vim:set ts=2 sw=2 et:
