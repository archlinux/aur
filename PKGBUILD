# Maintainer: Martin

_module=i18n
pkgname=kde2-${_module}-git
pkgver=2.2.2.r8.a6beda12
pkgrel=1
pkgdesc="Historical copy of the $_module module of KDE 2, adapted to compile on modern systems"
arch=(any)
url="https://github.com/sandsmark/kde${_module}"
license=("GPL2")
groups=(kde2)
depends=()
makedepends=(cmake git)
provides=(kde2-${_module})
conflicts=(kde2-${_module})

# KDE 2 uses .la files for all runtime plugins
# Because... reasons.
options=(libtool)

# Mirror
source=("git+https://github.com/sandsmark/kde2-${_module}.git")

md5sums=('SKIP')

pkgver() {
  cd kde2-${_module}
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
  cmake "$srcdir"/kde2-${_module} -DCMAKE_INSTALL_PREFIX=/usr -DKDEDIR=/usr/
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
  cd "$srcdir"/kde2-${_module}
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
