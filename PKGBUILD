# Maintainer: Abdó Roig-Maranges <abdo.roig@gmail.com>

pkgname=extempore-git
pkgver=0.6.0
pkgrel=1
pkgdesc="A cyber-physical programming environment for live coding"
arch=('i686' 'x86_64')
url="http://extempore.moso.com.au"
license=('BSD')
depends=('mesa' 'pcre' 'alsa-lib')
makedepends=('git' 'cmake' 'gcc' 'perl')
optdepends=('jack')
provides=('extempore')
conflicts=('extempore')
source=("git+https://github.com/digego/extempore.git")
md5sums=('SKIP')

pkgver() {
  git --git-dir="${srcdir}/extempore/.git" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/extempore"

  # Do not hook up aot_extended on ALL. Otherwise it is run at make install,
  # since it does not track build products.
  sed -i 's/aot_extended ALL/aot_extended/g' CMakeLists.txt
}

build() {
  mkdir -p "${srcdir}/build"
  cd "${srcdir}/build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DJACK=ON \
        -DBUILD_DEPS=ON \
        -DPACKAGE=ON \
        ../extempore

  make extempore aot_extended assets
}

package() {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}/" install

  # TODO: add symlink or launcher script at /usr/bin
}


# vim:set ts=2 sw=2 et:
