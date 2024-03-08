# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgbase=gpgme-git
pkgname=('gpgme-git' 'python-gpgme-git' 'qgpgme-qt5-git' 'qgpgme-qt6-git')
pkgver=1.23.2.r27.g47f3d92b
pkgrel=1
pkgdesc="GnuPG Made Easy"
arch=('i686' 'x86_64')
url="https://www.gnupg.org/related_software/gpgme/"
license=('LGPL')
makedepends=('git' 'gnupg' 'python' 'python-build' 'python-installer' 'python-setuptools'
             'python-wheel' 'qt5-base' 'qt6-base' 'swig')
source=("git+https://dev.gnupg.org/source/gpgme.git")
sha256sums=('SKIP')


pkgver() {
  cd "gpgme"

  git describe --long --tags | sed 's/^gpgme-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "gpgme"

  local _common_options=(
    --prefix="/usr"
    --disable-fd-passing
    --disable-gpgsm-test
  )

  ./autogen.sh

  mkdir -p _build-qt{5,6}

  pushd "_build-qt5"
  ../configure \
    "${_common_options[@]}" \
    --enable-languages=cpp,qt5
  make
  popd

  pushd "_build-qt6"
  ../configure \
    "${_common_options[@]}" \
    --enable-languages=cpp,qt6
  make
  popd

  ./configure \
    "${_common_options[@]}" \
    --enable-languages=python
  make
  pushd "lang/python"
  top_builddir="../.." \
    python \
      -m build \
      --wheel \
      --no-isolation
  popd
}

check() {
  cd "gpgme"

  #make -C "_build-qt5" check
}

package_gpgme-git() {
  depends=('gcc-libs' 'gnupg' 'libgpg-error')
  provides=("gpgme=$pkgver" 'libgpgme.so' 'libgpgmepp.so')
  conflicts=('gpgme')

  cd "gpgme"

  make -C "_build-qt5" DESTDIR="$pkgdir" install

  # split packages
  rm -r "$pkgdir/usr/lib"/{cmake/QGpgme,libqgpgme*}
}

package_python-gpgme-git() {
  pkgdesc="Python bindings for GPGme"
  depends=('python' 'gpgme-git')
  provides=("python-gpgme=$pkgver")
  conflicts=('python-gpgme')

  cd "gpgme/lang/python"

  make DESTDIR="$pkgdir" install
  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
}

package_qgpgme-qt5-git() {
  pkgdesc="Qt5 bindings for GPGme"
  depends=('gcc-libs' 'gpgme-git' 'qt5-base')
  provides=("qgpgme-qt5=$pkgver")
  conflicts=('qgpgme-qt5')

  cd "gpgme"

  make -C "_build-qt5/lang/qt" DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include"
}

package_qgpgme-qt6-git() {
  pkgdesc="Qt6 bindings for GPGme"
  depends=('gcc-libs' 'gpgme-git' 'qt6-base')
  provides=("qgpgme-qt6=$pkgver" 'qgpgme')
  conflicts=('qgpgme-qt6')

  cd "gpgme"

  make -C "_build-qt6/lang/qt" DESTDIR="$pkgdir" install
  rm -r "$pkgdir/usr/include"
}
