# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: taotieren <admin@taotieren.com>

_pypiname="ffpyplayer"
pkgname="python-${_pypiname,,}"
pkgver=4.5.4
pkgrel=1
pkgdesc="A Cython implementation of an FFmpeg based player"
arch=(
  'aarch64'
  'x86_64'
)
url="https://matham.github.io/ffpyplayer/"
_url="https://github.com/matham/ffpyplayer"
license=(
  'LGPL-3.0-only'
)
depends=(
  'ffmpeg4.4'
  'glibc'
  'python>=3.7'
  'sdl2'
  # 'sdl2_mixer'
)
makedepends=(
  'cython>=3.1.8'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
# checkdepends=(
#   'python-pytest'
# )
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "python-${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('89d29596fd6574b12e638b85669e0a59f7e063c2bab5a71040034b5e789791ff')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i 's/~=/>=/g' 'pyproject.toml' 'setup.py'
}

build () {
  # export USE_SDL2_MIXER=true
  export FFMPEG_INCLUDE_DIR="/usr/include/ffmpeg4.4"
  export FFMPEG_LIB_DIR="/usr/lib/ffmpeg4.4"
  export CFLAGS+=" -Wno-error=incompatible-pointer-types"

  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   local python_version="$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')"
# 
#   cd "${srcdir}/${_pkgsrc}"
#   PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-cpython-${python_version//./}" pytest
# }

package() {
  local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  rm -rf "${pkgdir}/${site_packages}/${_pypiname}/tests"

  install -vDm644 "README.rst" -t "${pkgdir}/usr/share/doc/${pkgname}"

  install -vd "${pkgdir}/usr/share/licenses"
  ln -vs "${site_packages}/${_pypiname}-${pkgver}.dist-info/licenses" \
    "${pkgdir}/usr/share/licenses/${pkgname}"
}
