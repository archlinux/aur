# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
pkgname=phylip
pkgver=3.698
pkgrel=1
pkgdesc="A collection of programmes for evolutive genetics and inferring phylogenies"
arch=('i686' 'x86_64')
url="http://evolution.genetics.washington.edu/phylip.html"
source=(http://evolution.gs.washington.edu/phylip/download/phylip-$pkgver.zip
        phylip-3.698-makefile.patch
        phylip-3.698-fno-common.patch)
optdepends=('java-runtime')
license=('custom')
sha256sums=('cb12e5105d25872eed705d243ca32b400e180d38c3437d58335f11a431df0e46'
            '91779c722959b7e08f4e3e03e9c1cc14c4a81d152e46d4a6b30d0dd09e276637'
            'd2638f99a6cb1e893aa6c362f906d5fca94700e0e4d50392abba853be8f0fff3')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  # patches from gentoo ebuild: https://gitweb.gentoo.org/repo/gentoo.git/plain/sci-biology/phylip/files
  patch -p1 < ../phylip-3.698-makefile.patch
  patch -p1 < ../phylip-3.698-fno-common.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver/src
  make -f Makefile.unx all
}

package() {
  cd "$srcdir"/$pkgname-$pkgver/src
  make -f Makefile.unx put

  cd "$srcdir"/$pkgname-$pkgver
  mkdir -p "$pkgdir"/usr/{lib,bin,share/phylip}
  rm -rf exe/testdata
  mv exe/factor{,-phylip}
  mv exe/*.so "$pkgdir"/usr/lib/
  mv exe/font* "$pkgdir"/usr/share/phylip/
  mv exe/* "$pkgdir"/usr/bin
}
