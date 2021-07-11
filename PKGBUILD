# Maintainer: Kyle <kyle@free2.ml>
# contributor: Alexander Epaneshnikov <aarnaarn2@gmail.com>

pkgname=('espeak-ng-git' 'espeak-ng-espeak-git')
pkgbase=espeak-ng-git
pkgver=1.50.r410.g49930f48
pkgrel=1
pkgdesc="Multi-lingual software speech synthesizer (development version)"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
url="https://github.com/espeak-ng/espeak-ng"
license=('GPL3')
makedepends=('pcaudiolib' 'git' 'ruby-ronn-ng')
source=(${pkgname%-git}::'git+https://github.com/espeak-ng/espeak-ng.git')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${pkgname%-git}
  ./autogen.sh
}

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr --with-extdict-{ru,cmn,yue}
  make src/espeak-ng src/speak-ng
  make -j1
}

package_espeak-ng-git() {
  depends=('pcaudiolib')
  optdepends=('espeak-ng-espeak-git: for *speak symlinks')
  provides=('espeak-ng')
  conflicts=('espeak-ng')
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/vim/{addons,vimfiles}
  rm -r "$pkgdir"/usr/{bin/*speak,include/espeak,share/vim/registry}
}

package_espeak-ng-espeak-git() {
  pkgdesc+=' (*speak symlinks)'
  depends=('espeak-ng-git')
  provides=('espeak-ng-espeak' 'espeak')
  conflicts=('espeak-ng-espeak' 'espeak')
  install -d "$pkgdir"/usr/{bin,include/espeak,share/man/man1}
  ln -s /usr/bin/espeak-ng "$pkgdir"/usr/bin/espeak
  ln -s /usr/bin/speak-ng "$pkgdir"/usr/bin/speak
  ln -s /usr/include/espeak-ng/speak_lib.h "$pkgdir"/usr/include/espeak/speak_lib.h
  ln -s /usr/share/man/man1/espeak-ng.1.gz "$pkgdir"/usr/share/man/man1/espeak.1.gz
  ln -s /usr/share/man/man1/speak-ng.1.gz "$pkgdir"/usr/share/man/man1/speak.1.gz
}
