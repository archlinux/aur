# Maintainer: haxibami <contact at haxibami dot net>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname=python-qh3
_pkgname="${pkgname/python-/}"
pkgver=1.9.2
pkgrel=1
pkgdesc='Lightweight QUIC and HTTP/3 implementation in Python'
arch=('aarch64' 'x86_64')
url='https://github.com/jawah/qh3'
license=('BSD-3-Clause')
depends=('gcc-libs' 'glibc' 'python>3.7')
makedepends=(
  'clang' 'mold' 'cmake' 'python-build' 'python-installer'
  'python-maturin' 'python-wheel'
)
checkdepends=('python-cryptography' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-mock' python-dnspython)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('70bce6856a378dbe1ecd7037b25d38c0449ec57946599bf509f34c1d74d60809')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  # Note: (GCC +) mold or (Clang +) lld is required to build with LTO
  export RUSTFLAGS="${RUSTFLAGS} -Clink-arg=-fuse-ld=mold"
  # export CC=clang CXX=clang++ RUSTFLAGS="${RUSTFLAGS} -Clink-arg=-fuse-ld=lld"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer -d tmp_install dist/*.whl
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="${PWD}/tmp_install/usr/lib/python${python_version}/site-packages"
  # See: https://github.com/jawah/qh3/blob/7145f484d49ca1f7625b7de5ecb49b03525b54b2/.github/workflows/CI.yml#L102
  rm -fR qh3
  python -m pytest -v -ra --tb=native --durations=10 --strict-config --strict-markers --deselect tests/test_ech.py::test_ech_accepted --deselect tests/test_ech.py::test_grease_ech_no_rejection tests/
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE
}
