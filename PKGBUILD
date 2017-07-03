# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=pistache-git
_name=${pkgname%-git}
pkgver=189.9827cda
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
        '0001-Export-targets.patch')
sha256sums=('SKIP'
            '68140dc3747b36e3287913cdb4e4ae1a2cc85d69e28560dee3937f6143e0cc5f')

pkgver() {
  cd "${srcdir}/${_name}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_name}"

  patch -p1 -i "${srcdir}/0001-Export-targets.patch"
}

build() {
  cd "${srcdir}/${_name}"

  # since this is only a small lib and ABI seems very unstable at this point
  # it should be ok to build it only as a static lib for now

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
