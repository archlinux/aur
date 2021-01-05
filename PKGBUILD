# Maintainer: Martin

_module=graphics
pkgname=kde2-kde${_module}-git
pkgver=2.2.2.r7.d4eb496
pkgrel=1
pkgdesc="Historical copy of the $_module module of KDE 2, adapted to compile on modern systems"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kde${_module}"
license=("GPL2")
groups=(kde2)
depends=(kde2-kdelibs)
makedepends=(cmake git)
provides=(kde2-kde${_module})
conflicts=(kde2-kde${_module} kcolorchooser kruler)
options=(libtool)

# Mirror
source=("git+https://github.com/sandsmark/kde2-kde${_module}.git")

md5sums=('SKIP')

pkgver() {
  cd kde2-kde${_module}
  printf "2.2.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi

  cd kde2-kde${_module}
}

build() {
  cd build
  cmake "$srcdir"/kde2-kde${_module} -DCMAKE_INSTALL_PREFIX=/usr -DKDEDIR=/usr/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/kde2-kde${_module}
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
