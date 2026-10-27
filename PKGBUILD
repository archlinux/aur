# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=nginx-language-server
pkgver=0.9.0
pkgrel=3
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
  "pygls2-compile-fix.patch")
sha512sums=('d4640e9d763fb7549ba1c7744707c7c97da99262e28057fc8a442e0057141c7b76d933bc6bec4616b1f98907cf5f1895f573635dc6514e4324855862c4aa97d5'
  'df8f265a7179c1ea2023f5f0c60bf0773dc0d2c3505d60ba16a8b35c495bd94beb767c4987b7bc7887069fa3bc01cd317365f311caedb451f2d776dd09e9df7a')
b2sums=('aa35f0b3bf4f284e6fb1f94c6545ae55bce0247445682a7a9e646820ed54fdfc1a5bfc7af805cb52014494ce9ab388f6c5b37e553826216337094e67510cb29c'
  '163f2cb189f37eb1e9252d4103ba2944e31daaf713128fc4e49c813c6bf91f989713ac335bc72f610d3cf9926bc9fad518b814135cb979b6ab6b2b67b9c875d7')

prepare() {
  patch -d "$pkgname" -Np1 -i ../pygls2-compile-fix.patch
}

build() {
  cd "$pkgname" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
}
