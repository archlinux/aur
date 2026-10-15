# Maintainer: Vadym Dziuba <dziuba.vadym@gmail.com>
#
# TEN VAD Python bindings: a ctypes wrapper (pure Python, any Python version)
# around the prebuilt libten_vad.so, taken from the PyPI sdist.
# Named -bin because the C++ sources of the library are public in the upstream
# repository (src/), but upstream ships no build system for a shared library
# and every distribution channel (PyPI, the GitHub lib/ directory) carries the
# prebuilt binary. A from-source "python-ten-vad" would supersede this package.

pkgname=python-ten-vad-bin
_name=ten_vad
pkgver=1.0.6.9
pkgrel=1
pkgdesc="TEN VAD: low-latency, lightweight voice activity detector (Python bindings, prebuilt library)"
arch=('x86_64')
url="https://github.com/TEN-framework/ten-vad"
# Apache-2.0 with additional conditions from Agora, see the installed LICENSE.
license=('LicenseRef-TEN-VAD')
depends=('python' 'python-numpy' 'libc++')
makedepends=('python-build' 'python-installer' 'python-setuptools')
provides=('python-ten-vad')
conflicts=('python-ten-vad')
options=('!strip' '!debug')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0c80936314b75bbcc3c478ad45540fcd6a86b7de87147ff481faa1c9beee191e')

prepare() {
  cd "$_name-$pkgver"
  # setup.py rebuilds ten_vad/ from include/ten_vad.py and lib/ at build time;
  # drop the Windows and macOS binaries so its package_data globs miss them.
  rm -r lib/Windows lib/macOS ten_vad
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE NOTICES -t "$pkgdir/usr/share/licenses/$pkgname"
}
