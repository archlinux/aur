# Maintainer: giver <giverc139@gmail.com>

_pyname=pydemumble
pkgname=python-${_pyname}
pkgver=0.0.1
pkgrel=1
pkgdesc='A Python wrapper library for demumble; demumble is a tool to demangle C++, Rust, and Swift symbol names.'
url='https://github.com/angr/pydemumble'
license=('BSD-2-Clause')
arch=('any')
depends=(
  'python'
  'nanobind'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-scikit-build-core'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver"
        "$pkgname-$pkgver-demumble::git+https://github.com/nico/demumble.git#commit=10e00fb"
        "$pkgname-$pkgver-nanobind::git+https://github.com/wjakob/nanobind.git#commit=d51c070"
        "$pkgname-$pkgver-robin-map::git+https://github.com/Tessil/robin-map.git#commit=188c455")
sha512sums=('c1350d73e4a061ad2e65c4ffb632f4f26e189de072edd1d1ac1b2bff5ae708f74cb4e61d9aa143a4518e34ad7ed56444d700b2fed7838c8bf599cff162c78d8d'
            'ae8fbcb49a3dae2ca78b129e1412b7a7b04215a013625a74620beec830b6eb222d883d1ab5291d82f96b0469d7785dc74159d46517fa3e45d61e6281e44114a6'
            '490e72258f2ed47a8f1c5724139946c8ad9d941603cf43d159f75931d3915ab87a314f95bb48e1ddc5813416bd3526df90273fd61481e8c4d36f75d25281c139'
            '1572acf4d74e8d6713d50367048041e6eab34fd11aadefd23207a40e8b4972e6f5f04c46e98871b059b7cb34a475ab234312b23c04a7e87fb7352554151539a4')
b2sums=('452637f66d4913e734b182a11c83591654139d3f09f9e11bcc9e8eacb6d0069a32131e9a6d34d90f43fe5b67adb9ac988d8957e7cbe1eaff38d4f540bc5dd5dc'
        '41ee31efdafb72115dbc52fadd097c5f5222a50e1f9260a933140a007a382c9549868c4a43d436012a87a614ce942b1beba5c16fbbf4020e5e42ec298a602110'
        '6cf51dd907624b70d8f5cebce5c1e91b752a445500a897b076f9046b96ffe46d4d31f7765e3f50ded82f45bd8a6d8e20f32f00e7bd5f67c8c2b2e1a25321cb15'
        '1bb08ca5d443a9d6f919c7153f5bddd1b4f57e352289714b7b48e11a126785c841d1e88ee66dabb15b3046cc68523fdb42aca9605c0f2eac4a3bd840dfeabe3b')

prepare() {
  cd ${pkgname}-${pkgver}-nanobind
  git submodule init
  git config submodule.libs/ext/robin_map.url "$srcdir/${pkgname}-${pkgver}-robin_map"
  git -c protocol.file.allow=always submodule update
  cd ../${pkgname}-${pkgver}
  git submodule init
  git config submodule.libs/src/demumble.url "$srcdir/${pkgname}-${pkgver}-demumble"
  git config submodule.libs/src/nanobind.url "$srcdir/${pkgname}-${pkgver}-nanobind"
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
