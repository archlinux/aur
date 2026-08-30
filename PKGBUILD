# Maintainer: giver <giverc139@gmail.com>

_pyname=pydemumble
pkgname=python-${_pyname}
pkgver=0.1.3
pkgrel=0
pkgdesc='A Python wrapper library for demumble; demumble is a tool to demangle C++, Rust, and Swift symbol names.'
url='https://github.com/angr/pydemumble'
license=('BSD-2-Clause')
arch=('any')
depends=(
  'python'
  'nanobind'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-scikit-build-core'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver"
        "$pkgname-$pkgver-nanobind::git+https://github.com/wjakob/nanobind.git#commit=d51c070"
        "$pkgname-$pkgver-robin-map::git+https://github.com/Tessil/robin-map.git#commit=188c455")
sha512sums=('7971568bb8d8ebabe4553c6786d8e2de600b024d1ae4836463fa27d741ef83850f9126aeba9892a55cc83212f9d1888e3b8fe04599fbe01a18ef9c3d3713d7c0'
            '490e72258f2ed47a8f1c5724139946c8ad9d941603cf43d159f75931d3915ab87a314f95bb48e1ddc5813416bd3526df90273fd61481e8c4d36f75d25281c139'
            '1572acf4d74e8d6713d50367048041e6eab34fd11aadefd23207a40e8b4972e6f5f04c46e98871b059b7cb34a475ab234312b23c04a7e87fb7352554151539a4')
b2sums=('730e9d2554ed29dbc6bebb0bdbf8fb0a08938607a43f9048fb4cfc83edeccfb48c45be4601aa9e2d41e49958bb362d594b9961133103ba733add6b2c92018119'
        '6cf51dd907624b70d8f5cebce5c1e91b752a445500a897b076f9046b96ffe46d4d31f7765e3f50ded82f45bd8a6d8e20f32f00e7bd5f67c8c2b2e1a25321cb15'
        '1bb08ca5d443a9d6f919c7153f5bddd1b4f57e352289714b7b48e11a126785c841d1e88ee66dabb15b3046cc68523fdb42aca9605c0f2eac4a3bd840dfeabe3b')

prepare() {
  cd ${pkgname}-${pkgver}-nanobind
  git submodule init
  git config submodule.libs/ext/robin_map.url "$srcdir/${pkgname}-${pkgver}-robin_map"
  git -c protocol.file.allow=always submodule update
  cd ../${pkgname}-${pkgver}
  git submodule init
  git config submodule.libs/src/nanobind.url "$srcdir/${pkgname}-${pkgver}-nanobind"
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}-${pkgver}"
  python -m venv --clear --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -Pm pytest -o addopts='' tests
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
