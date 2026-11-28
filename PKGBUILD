# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=nanoarrow
pkgname=python-$_name
pkgver=0.9.0
pkgrel=1
pkgdesc='Python bindings to the nanoarrow C library'
arch=('x86_64' 'aarch64')
_repo='https://github.com/apache/arrow-nanoarrow'
url="$_repo/tree/main/python"
license=('Apache-2.0')
depends=('python'
         'zstd'
         'lz4'
         'glibc')
makedepends=('meson'
             'meson-python'
             'cython'
             'python-build'
             'python-installer')
checkdepends=('python-pyarrow'
              'python-dateutil'
              'python-pytest'
              'python-numpy')
_flatcc=fd3c4ae5cd39f0651eda6a3a1a374278070135d6
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/apache-arrow-$_name-$pkgver.tar.gz"
        "flatcc-$_flatcc.tar.gz::https://github.com/dvidelabs/flatcc/archive/$_flatcc.tar.gz")
noextract=("flatcc-$_flatcc.tar.gz")
sha256sums=('22c3edeaa5cb384c6da091f32a4e1c937779f2d62f84d646028de658b03d4385'
            '353cb04a619865383b87c8077eb39b63b01a3fc44f7bebd558a88f139c6b6f77')

prepare() {
  cd "arrow-$_name-apache-arrow-$_name-$pkgver/python"
  # Use the meson version shipped by Arch
  sed -i '/^requires = \[/,/\]/s/"\([^"<>=!~ ]*\) *[<>=!~][^"]*"/"\1"/' pyproject.toml
  # Use the system zstd and lz4 instead of the meson wraps
  sed -i "/'force_fallback_for=zstd,lz4',/d" meson.build
  rm subprojects/zstd.wrap subprojects/lz4.wrap
  # Provide the flatcc wrap tarball so meson doesn't download it
  mkdir -p subprojects/packagecache
  cp "$srcdir"/flatcc-$_flatcc.tar.gz subprojects/packagecache/
}

build() {
  cd "arrow-$_name-apache-arrow-$_name-$pkgver/python"
  python -m build --wheel --no-isolation -Csetup-args=--wrap-mode=nodownload
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "arrow-$_name-apache-arrow-$_name-$pkgver/python"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "arrow-$_name-apache-arrow-$_name-$pkgver/python"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
