# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=hf_transfer
pkgname=python-hf-transfer
pkgver=0.1.9
pkgrel=4
pkgdesc='Speed up file transfers with the Hugging Face Hub'
arch=('x86_64')
url='https://github.com/huggingface/hf_transfer'
license=('Apache-2.0')
# Preserve native wheel RECORD hashes and sizes after packaging.
options=('!strip')
depends=(
  gcc-libs
  glibc
  openssl
  python
)
makedepends=(
  python-build
  python-maturin
  python-installer
  python-wheel
)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/huggingface/hf_transfer/archive/refs/tags/v${pkgver}.tar.gz"
        'Fix-inclusive-range-progress.patch')
sha512sums=('074801626fdf7bf9c83451f6d7567ef3f9cebc390ccf4724f1f3fdbb1d5f56e49d179ef7baecbd53d89b317c13ac6df7459ee47cb9a9f18aa23f52fbfba36a84'
            'd0a995aefdbcd8d31b7c0711a2b15a055512d024d550cd4f89953f3b9e75fb19c16186d55e13aab33a6e51ccdab32ffe35c34e79eb65de33e938d6feec6d2075')

prepare() {
  cd "${_pkgname}-${pkgver}"
  # Report inclusive download ranges and the actual final upload part size.
  patch -Np1 -i "$srcdir/Fix-inclusive-range-progress.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  # use system openssl
  OPENSSL_NO_VENDOR=1 \
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
