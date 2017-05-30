# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=far2l-git
pkgver=r787.1330e85
pkgrel=1
pkgdesc='Linux port of FAR v2'
url='https://github.com/elfmz/far2l'
arch=('i686' 'x86_64')
license=('GPL2')
source=('git+https://github.com/elfmz/far2l'
        'git+https://github.com/cycleg/far-gvfs'
        'far2l.patch')
sha256sums=('SKIP'
            'SKIP'
            'a0f97d7262f450aa1757408301746e6be21fabf18dae31ffe17fee69b30de65d'
           )
makedepends=('git' 'cmake')
depends=('wxgtk' 'gtkmm3' 'openssl-1.0')

pkgver() {
  cd "$srcdir"/far2l
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/far2l

  patch -p1 -i "$srcdir"/far2l.patch
}

package() {

  cd "$srcdir"/far2l
  rm -rf far-gvfs
  mv "$srcdir"/far-gvfs ./

  PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig cmake . -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr -DCMAKE_BUILD_TYPE=Release
  cmake --build . --target install

  ln -sf ../../bin/far2l "$pkgdir"/usr/lib/far2l/far2l_askpass
  ln -sf ../../bin/far2l "$pkgdir"/usr/lib/far2l/far2l_sudoapp
}
