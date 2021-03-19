# Maintainer: Martin

_module=libs
pkgname=kde2-kde${_module}-git
pkgver=2.2.2.r24019.1e989a6f0
pkgrel=1
pkgdesc="Historical copy of the $_module module of KDE 2, adapted to compile on modern systems"
arch=(i686 x86_64)
url="https://invent.kde.org/sandsmark/kde2-${_module}"
license=("GPL2")
groups=(kde2)
depends=(qt2 audiofile libxslt python libtool hicolor-icon-theme)
optdepends=('java-runtime: Java support')
makedepends=(cmake git)
provides=(kde2-kde${_module})
conflicts=(kde2-kde${_module} plasma-workspace)
options+=(libtool)

source=("git+https://invent.kde.org/sandsmark/kde2-kde${_module}.git")

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
