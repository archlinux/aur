# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: zoe (https://aur.archlinux.org/account/zoe)


_pkgname='audio-offset-finder'
pkgname="${_pkgname}-git"
pkgver=0.5.5.r195.20240626.a99f981
pkgrel=2
pkgdesc="A simple tool for finding the offset of an audio file within another file."
arch=('any')
_githost='github.com'
# _gituser='abramhindle'
_gituser='bbc'
url="https://${_githost}/${_gituser}/${_pkgname}"
license=("Apache-2.0")
depends=(
  'ffmpeg'
  'python>=3'
  'python-librosa'
  'python-matplotlib'
  'python-numba'  # Might actually not be needed.
  'python-numpy'
  'python-pytest' # Yes!, this is also a real dependency (usr/lib/python*/site-packages/tests/audio_offset_finder_test.py).
  'python-scipy>=0.12.0'
  'python-soxr'   # Might actually not be needed.
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-lazy-loader'
  'python-wheel'
  'python-setuptools'
)
checkdepends=(
  'python-librosa'
  'python-nose'
  'python-pluggy'
  'python-pytest'
  'python-soxr'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=(
  "${_pkgname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' setup.cfg | tail -n1 | sed -E -e 's|^[^=]*=[[:space:]]*||' -e 's|,.*$||' | tr -d \'\")"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  python -m build --wheel --no-isolation
  # python setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> running 'nosetests' ..."
  nosetests
  printf '\n'
  printf '%s\n' " --> running 'pytest' ..."
  pytest
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl
  # python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # Remove files that should not be there
  rm -fv "${pkgdir}/usr/lib"/python*/"site-packages/tests/__init__.py"
  rm -fv "${pkgdir}/usr/lib"/python*/"site-packages/tests/__pycache__"/__init__.*.pyc

  for _docfile in "AUTHORS" "CODE_OF_CONDUCT.md" "CONTRIBUTING.md" "README.md" "example_plot.png"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done

  install -D -v -m644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}

