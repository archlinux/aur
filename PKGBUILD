# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=('verovio' 'python-verovio')
pkgbase=verovio
pkgver=5.6.0
pkgrel=1
pkgdesc="A music notation engraving library"
arch=(x86_64)
url="https://www.verovio.org"
license=('LGPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'swig')
source=("https://github.com/rism-digital/verovio/archive/version-$pkgver/$pkgname-$pkgver.tar.gz"
  no-assert.patch
  resource-path.patch)
sha256sums=('caea6c2d0b127bf7c6352f98c1174d2513498d06a1f6e0269b075e87f9333f39'
            'd7f93d7f995541ebd94cae6a972bf13db92d43680aa56018ebe7270400f52677'
            '9e753f91b2da85dc7fb6e1fe36d8d3de85957ed91d331a1e4b65af121415b50f')

prepare() {
  cd "$pkgbase-version-$pkgver"
  patch -p1 -i "$srcdir/no-assert.patch"
  patch -p1 -i "$srcdir/resource-path.patch"
}

build() {
  cd "$pkgbase-version-$pkgver"

  # FIXME: See if a shared build directory could be used for both the library
  # and cli builds.

  # (a) Build shared library
  cmake -B build-lib -S ./cmake \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev \
    -DBUILD_AS_LIBRARY='On'

  make -C build-lib

  # (b) Build cli
  cmake -B build-cli -S ./cmake \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev \
    -UBUILD_AS_LIBRARY

  make -C build-cli

  # (c) Build python bindings
  #
  # FIXME: The cmake build configures a swig-generated static library to
  # install to /usr/bin, so use the python toolchain for builds, which yields a
  # shared library instead, and a correct install location. The downside is
  # that parallelized builds are not possible with this approach (limitation of
  # build_ext in setuptools).
  python -m build --wheel --no-isolation
}

package_verovio() {
  pkgdesc="A music notation engraving library (CLI and library)"
  cd "$pkgbase-version-$pkgver"
  # FIXME: Determine why the library and binary are relinked during install
  make DESTDIR="$pkgdir/" -C build-lib install
  make DESTDIR="$pkgdir/" -C build-cli install
}

package_python-verovio() {
  pkgdesc="A music notation engraving library (Python bindings)"
  depends=('verovio' 'gcc-libs' 'glibc' 'python')
  cd "$pkgbase-version-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  sitedir=$(python -c 'import sys; print(sys.path[-1])')
  pkg_sitedir="$pkgdir/$sitedir/verovio"

  # Data files not needed here (see resource-path.patch)
  rm -rvf "$pkg_sitedir"/data

  # Some adjustments for PEP-517 build that are not needed for the traditional
  # build invoking setup.py
  if [[ ! -f "$pkg_sitedir"/verovio.py ]]; then
    install -vm 644 ./bindings/python/verovio.py "$pkg_sitedir"/
  fi
  rm -vf "$pkg_sitedir"/setup.py

  # No need for these pycache files, so just remove them
  rm -rvf "$pkg_sitedir"/__pycache__
}


# vi: ft=sh et sw=2 sts=2
