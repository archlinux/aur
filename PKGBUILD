# Maintainer: Martin

_module=toys
pkgname=kde1-kde${_module}-git
pkgver=1.1.2r207.66a0fb3
pkgrel=1
pkgdesc="Historical copy of the $_module module of KDE 1, adapted to compile on modern systems"
arch=(i686 x86_64)
url="https://quickgit.kde.org/?p=kde1-kde${_module}.git"
license=("GPL2")
groups=(kde1)
depends=(kde1-kdelibs)
makedepends=(cmake git)
provides=(kde1-kde${_module})
conflicts=(kde1-kde${_module})

# Mirror
#source=("git+https://github.com/KDE/kde1-kde${_module}.git")
source=("git+https://anongit.kde.org/kde1-kde${_module}.git")

md5sums=('SKIP')

pkgver() {
  cd kde1-kde${_module}
  printf "1.1.2r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build && mkdir build
  else
    mkdir build
  fi
}

build() {
  cd build
  cmake "$srcdir"/kde1-kde${_module} -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/kde1-kde${_module}
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
