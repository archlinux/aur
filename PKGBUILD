# Maintainer: derieck

_pkgname='nmeasim-python'
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.0.0.0+r22.20210918.439faff
pkgrel=2
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
  'python-setuptools'
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
  'remove_ico_from_gui.patch'
)
sha256sums=(
  'SKIP'
  '87b2921cdad2d2274bfade32877737339a00c90b5caddd083230b0ec34867ed4'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  msg2 "Applying patch to remove 'icon.ico' from 'gui.py' to mitigate https://gitlab.com/nmeasim/nmeasim/-/issues/1:"
  patch -N -p1 < "${srcdir}/remove_ico_from_gui.patch"
}

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
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  local _pyver="$(python -V | awk '{print $2}' | awk -F. '{print $1"."$2}')"
  install -D -v -m644 nmeasim/icon.ico "${pkgdir}/usr/lib/python${_pyver}/site-packages/nmeasim/icon.ico"

  mv -v "${pkgdir}/usr/bin/nmeasim" "${pkgdir}/usr/bin/nmeasim-python" # Renaming it, because there is also Java-nmeasim (https://github.com/abuech2s/nmeasim) and a Windows-nmeasim (https://sourceforge.net/projects/nmeasim/), which might be worth to have as Arch Linux packages as well.

  for _docfile in readme.md; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 readme.md "${pkgdir}/usr/share/licenses/${pkgname}/readme.md"
}
