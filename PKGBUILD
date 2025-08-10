# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: taotieren <admin@taotieren.com>

_Name="FFPyPlayer"
_name="${_Name,,}"
pkgname="python-${_name}"
pkgver=4.5.3
pkgrel=1
pkgdesc="A Cython implementation of an FFmpeg based player"
arch=('aarch64' 'x86_64')
url="https://matham.github.io/ffpyplayer/"
_url="https://github.com/matham/${_name}"
license=('LGPL-3.0-only')
depends=(
  'ffmpeg4.4'
  'glibc'
  'python>=3.7'
  'sdl2'
  # 'sdl2_mixer'
)
makedepends=(
  'cython'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
# checkdepends=(
#   'python-pytest'
# )
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('413866ca00fad53f36de07362ca884dea54e55da2372293d2042888c68bd3eae')

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

  rm -rf "${pkgdir}/${site_packages}/${_name}/tests"

  install -vDm644 "README.rst" "${pkgdir}/usr/share/doc/${_name}/README.rst"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vs "${site_packages}/${_pkgsrc}.dist-info/licenses/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
