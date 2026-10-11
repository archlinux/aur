# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Doron Behar <doron.behar@gmail.com>

## GPG key: https://github.com/jedbrown.gpg

_base=ceed
pkgname=(lib${_base} python-${_base})
pkgver=1.0.0
pkgrel=1
pkgdesc="Code for Efficient Extensible Discretizations"
arch=(x86_64)
license=(BSD-2-Clause)
url="https://github.com/${_base}/lib${_base}"
makedepends=(gcc-fortran python-cffi python-build python-installer python-setuptools python-wheel git)
source=("lib${_base}::git+${url}#tag=v${pkgver}?signed")
sha512sums=('05fe9f5a5e27da92caff898121ab57f07ca6b2f5663c26a2579fc6cdf79497488fd6c45cfba53c08c1d74b6e4d7f25c0ac837db0a8b8b0cb75bafaf90ee6a6d4')
validpgpkeys=('BA543CE09D732BE604D53F6FCA6D4A3B32D335A0') # Jed Brown <jed@jedbrown.org>

prepare() {
  cd lib${_base}
  # don't compile CEED twice for python-ceed
  sed -i '/always-make/d' setup.py
}

build() {
  cd lib${_base}
  CFLAGS="-fPIC" make
  python -m build --wheel --no-isolation
}

check() {
  cd lib${_base}
  make test
}

package_libceed() {
  depends=(glibc)
  provides=('libceed.so')

  cd lib${_base}
  make DESTDIR="$pkgdir" prefix=/usr install
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

package_python-ceed() {
  depends=(libceed python-cffi python-numpy)

  cd lib${_base}
  python -m installer --destdir="$pkgdir/" dist/*.whl
  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/libceed-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
