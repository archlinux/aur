# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=pistache-git
_name=${pkgname%-git}
pkgver=176.8604968
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Modern and elegant HTTP and REST framework for C++'
license=('APACHE')
depends=()
makedepends=('cmake' 'git')
provides=("${_name}")
conflicts=("${_name}")
url="https://github.com/oktal/${_name}"
source=("${_name}::git://github.com/oktal/${_name}.git"
        '0001-Call-library-target-pistache-to-avoid-conflict-with-.patch'
        '0002-Export-targets.patch')
sha256sums=('SKIP'
            '28383926baaa5f8b57f3513d21cafe8997dc779cff8170676904c39e20e7a71e'
            '4e2a5cc2bd0c1c85d9bbff03325af03fb1742aefed7dbada231e76b4ad2d20e7')

pkgver() {
  cd "${srcdir}/${_name}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_name}"

  patch -p1 -i "${srcdir}/0001-Call-library-target-pistache-to-avoid-conflict-with-.patch"
  patch -p1 -i "${srcdir}/0002-Export-targets.patch"
}

build() {
  cd "${srcdir}/${_name}"
  cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

check() {
  cd "${srcdir}/${_name}"
  make test
}

package() {
  cd "${srcdir}/${_name}"
  make DESTDIR="${pkgdir}" install
}
