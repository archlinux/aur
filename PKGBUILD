# Maintainer: Martin

_module=base
pkgname=kde2-kde${_module}-git
pkgver=2.2.2.r18.9c677b2
pkgrel=1
pkgdesc="Historical copy of the $_module module of KDE 2, adapted to compile on modern systems"
arch=(i686 x86_64)
url="https://github.com/sandsmark/kde${_module}"
license=("GPL2")
groups=(kde2)
depends=(kde2-kdelibs xorg-iceauth)
makedepends=(cmake git)
provides=(kde2-kde${_module})
conflicts=(kde2-kde${_module})

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

  rm -f "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/gimp.png
  rm -f "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/gimp.png
  rm -f "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/gimp.png
  rm -f "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/gvim.png
}
