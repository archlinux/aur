# Maintainer: derieck

_pkgname='nmeasim-python'
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.0.2.0.r25.20220809.66ecf14
pkgrel=1
pkgdesc='A Python 3 GNSS/NMEA receiver simulation, with GUI.'
arch=(
  any
)
url='https://gitlab.com/nmeasim/nmeasim'
license=('custom: Public Domain')
depends=(
  'python>=3.8'
  'python-geographiclib'
  # 'python-importlib-metadata' That is needed for python < 3.8.
  'python-pyserial'
  'tk'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=61.2'
  'python-setuptools-scm>=3.4.3'
  'python-wheel'
  # 'python-setuptools'
)
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
  "python-nmeasim=${pkgver}"
  "python-nmeasim-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  'python-nmeasim'
)
replaces=()
source=(
  "${_pkgname}::git+https://gitlab.com/nmeasim/nmeasim.git"
)
sha256sums=(
  'SKIP'
)

# prepare() {
#   cd "${srcdir}/${_pkgname}"
# }

pkgver () {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '+')"
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

# check() {
#   cd "${srcdir}/${_pkgname}"
# 
#  python setup.py test
# }

package() {
  cd "${srcdir}/${_pkgname}"

  export PYTHONHASHSEED=0
  python -m installer --destdir="${pkgdir}" dist/*.whl
  # python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  #local _pyver="$(python -V | awk '{print $2}' | awk -F. '{print $1"."$2}')"
  #install -D -v -m644 nmeasim/icon.ico "${pkgdir}/usr/lib/python${_pyver}/site-packages/nmeasim/icon.ico"

  mv -v "${pkgdir}/usr/bin/nmeasim" "${pkgdir}/usr/bin/nmeasim-python" # Renaming it, because there is also Java-nmeasim (https://github.com/abuech2s/nmeasim) and a Windows-nmeasim (https://sourceforge.net/projects/nmeasim/), which might be worth to have as Arch Linux packages as well.

  install -D -v -m644 nmeasim/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  for _docfile in readme.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  ln -svf "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE"
}
