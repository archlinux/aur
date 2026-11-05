# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=nginx-language-server
pkgver=0.9.0
pkgrel=4
pkgdesc='Language Server for nginx.conf'
arch=(any)
url='https://github.com/pappasam/nginx-language-server'
license=(GPL-3.0-only)
depends=(
  crossplane
  python
  python-lsprotocol
  python-pydantic
  python-pygls
)
makedepends=(git python-poetry-core python-build python-installer python-wheel)
source=("$pkgname::git+$url#tag=v$pkgver"
  "pygls2-pydantic2.patch")
sha512sums=('d4640e9d763fb7549ba1c7744707c7c97da99262e28057fc8a442e0057141c7b76d933bc6bec4616b1f98907cf5f1895f573635dc6514e4324855862c4aa97d5'
  '72ba69f06f05ee72719a23abc50a8433d6b1945a42cb74a38b499a8a1b8087b8228d2bd304c7b2149939086b6bac48e19d65bf991b70d6e01e198901cbb23551')
b2sums=('aa35f0b3bf4f284e6fb1f94c6545ae55bce0247445682a7a9e646820ed54fdfc1a5bfc7af805cb52014494ce9ab388f6c5b37e553826216337094e67510cb29c'
  'dbc77761c20b2b4b23c6377062b2616858587e9cb8646a1f14b6ac6ff7c8f32081be70a522d5b7a4434a3d1e97b4046385feda7d2a4e921415d47fb372f866f9')

prepare() {
  # pygls 2's and pydantic 2's APIs, the code of
  # https://github.com/pappasam/nginx-language-server/pull/27
  patch -d "$pkgname" -Np1 -i ../pygls2-pydantic2.patch
}

build() {
  cd "$pkgname" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}
