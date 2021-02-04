# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=bookworm-git
pkgver=1.1.2.r179.g3b1cc9d
pkgrel=1
pkgdesc='A simple user centric eBook reader which displays multiple eBooks formats uniformly'
arch=(x86_64)
url='https://babluboy.github.io/bookworm'
license=(GPL3)
depends=(granite poppler-glib python unarchiver unzip webkit2gtk python-html2text)
makedepends=(git meson vala ninja)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://github.com/babluboy/bookworm.git"
        'html2text.patch')
sha256sums=('SKIP'
            'a90f0753d54aa8f3b72816494928f8e9b72bf26fccd477adfa495e9e2c93dc42')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-*}"
  patch -p1 < ../html2text.patch
  mkdir build
}

build() {
  cd "${pkgname%-*}"
  meson build --prefix=/usr
  cd build
  ninja
}

package() {
  cd "${pkgname%-*}"/build
  DESTDIR="$pkgdir" ninja install
  install -m644 -D ../COPYING "$pkgdir"/usr/share/licenses/bookworm/COPYING
}
