# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=OpenTimelineIO
pkgname=${_pkgname,,}-git
pkgver=last_pure_python.r221.g6ce63ff7
pkgrel=1
pkgdesc='Open Source API and interchange format for editorial timeline information'
arch=(x86_64)
url="https://opentimeline.io/"
license=('custom:Modified Apache')
depends=(python-aaf2)
makedepends=(cmake git python-pip)
provides=(${_pkgname,,})
conflicts=(${_pkgname,,})
source=("$_pkgname::git+https://github.com/PixarAnimationStudios/$_pkgname"
        "any::git+https://github.com/thelink2012/any"
        "optional-lite::git+https://github.com/martinmoene/optional-lite"
        "pybind11::git+https://github.com/pybind/pybind11"
        "rapidjson::git+https://github.com/Tencent/rapidjson")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  python_ver=$(python --version | sed -e 's/^./\L&/;s/[[:space:]]//;s/.[0-9]$//')

  cd $_pkgname
  git submodule init
  for dependency in any optional-lite pybind11 rapidjson; do
    git config submodule.src/deps/$dependency.url $srcdir/$dependency
  done
  git submodule update

  # Enable building of C++ bindings
  sed -i '/OTIO_CXX_INSTALL/ s/OFF/ON/' setup.py
  sed -i '/OTIO_SHARED_LIBS/ s/OFF/ON/' setup.py
  sed -i "/CMAKE_BUILD_TYPE/ a\            \'-DCMAKE_INSTALL_PREFIX=/usr\'," setup.py

  # Define the installation directory for Python bindings
  sed -i "/PYTHON_INSTALL_DIR/ s|install_dir|'lib/$python_ver/site-packages'|" setup.py

  # Disable installation of C++ bindings during the build
  sed -i '/target.*install/ d' setup.py
}

build() {
  # Configure Makefiles and build Python bindings
  cd $_pkgname
  python setup.py build

  # Build C++ bindings
  cd build/temp.*
  make
}

package() {
  python_ver=$(python --version | sed -e 's/^./\L&/;s/[[:space:]]//;s/.[0-9]$//')

  # Install Python bindings
  cd $_pkgname
  python setup.py install --root=$pkgdir --skip-build --optimize=1

  # Install C++ bindings
  cd build/temp.*
  make DESTDIR=$pkgdir install

  # Install license file
  install -D -m644 ../../LICENSE.txt \
                   "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

  # Create symlinks in /usr/lib
  cd $pkgdir/usr/lib
  ls -1 $python_ver/site-packages/${pkgname%-*}/*.so | \
    awk -F \/ '{print $(NF)}' | \
    xargs -I {} ln -s $python_ver/site-packages/${pkgname%-*}/{} {}
}

# vim:set ts=2 sw=2 et:
