# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=python-av
_name=${pkgname#python-}
_upstream_name="PyAV"
pkgdesc="Pythonic bindings for FFmpeg"
url="https://pyav.basswood-io.com"

pkgver=16.0.0
pkgrel=1

arch=("x86_64" "i686")
license=("BSD-3-Clause")

depends=(
  "ffmpeg"
  "python"
  "python-numpy"
  "python-pillow"
)
makedepends=(
  "cython"
  "python-build"
  "python-installer"
  "python-setuptools"
)
checkdepends=(
  "python-pytest"
)

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/${_upstream_name}-Org/${_upstream_name}/archive/refs/tags/v${pkgver}.tar.gz"
    "python-av-16.0.0-ffmpeg-8.0-tests.patch"
)
b2sums=(
    "5f2092c61ad2a6fb23a1ce3ff380e40fe045059c3a0d6b206d2ba38ce26c79453b0a071013b2cdab7e612d57f6d1f097f4c857fb548af1b4b5cf82818e7e1af0"
    "a42d30506f255a584f7aa69f89e301a6ff3c1c09eeb1189e964a60566c0dc416b479ae3106bc880d12e4340fe4428ac94f294b75c6ddc52e6a075dd6dc7c31dc"
)

prepare() {
  cd "${srcdir}"/${_upstream_name}-${pkgver}
  patch --forward --strip=1 --input="${srcdir}/python-av-16.0.0-ffmpeg-8.0-tests.patch"
}

build() {
  cd "${srcdir}"/${_upstream_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_upstream_name}-${pkgver}

  local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="${srcdir}/${_upstream_name}-${pkgver}/build/lib.linux-${CARCH}-cpython-${python_version}"
  mv av _av  # so pytest does not attempt to import from source directory

  python -m pytest
}

package() {
  cd "${srcdir}/${_upstream_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-av/LICENSE"
}
