# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="fastkml"
_gitname="${_pyname}"
_pkgname="python-${_pyname}"
pkgname="${_pkgname}-git"
pkgver=1.4.0+118.r1728.20260722.7228bed
pkgrel=1
pkgdesc="A Python library for reading, writing and manipulating KML files."
groups=()
arch=(
  'any'
)
_githost='github.com'
_gituser='cleder'
url="https://fastkml.readthedocs.io/"
license=("LGPL-2.1-or-later")
depends=(
  'python>=3.9'
  'python-arrow'
  'python-lxml'
  'python-pygeoif>=1.5'
  'python-typing_extensions>=4'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools>=61.2'
  'python-wheel'

  ## docs:
  'python-sphinx'
  'python-pyshp'
  'python-sphinx-autodoc-typehints'
  'python-sphinx_rtd_theme'
)
optdepends=()
checkdepends=(
  'python-anyio'
  'python-hypothesis'
  'python-pluggy'
  'python-pytest'
  'python-pytest-cov'
  'python-pytz'
  'python-tzdata'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-docs=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-docs"
)

source=(
  "${_pkgname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' pyproject.toml  | head -n1 | awk -F= '{print $2}' | tr -d \'\"[[:space:]])"
  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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
  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation

  printf '%s\n' " --> building documentation ..."
  make -C docs text
  make -C docs man
  make -C docs html
  make -C docs changes
}

check() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' " --> testing ..."
  pytest --hypothesis-profile=ci # See https://github.com/cleder/fastkml/issues/491#issuecomment-3879849104: Fewer iterations to make the overall run taking less time to not fail with an error just due to timeout.

  printf '%s\n' " --> testing documentation ..."
  make -C docs doctest
  make -C docs coverage
}

package() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    "${srcdir}/git.log"
    README.rst
    docs/*.rst
    docs/*.gif
    docs/*.jpg
    docs/*.txt
    docs/*.kml
  )
  _docdirs=(
    docs/_build/{changes,html,text}
  )
  _manfiles=(
    # docs/_build/man/fastkml.1
    docs/_build/man/*
  )
  _infofiles=()
  _licensefiles=(
    LICENSE
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  for _docdir in "${_docdirs[@]}"; do
    cp -rv "${_docdir}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docdir}")"
  done
  for _manfile in "${_manfiles[@]}"; do
    _section="$(basename "${_manfile}" .gz | sed -E -e 's|^.*\.([^.]*)$|\1|')"
    install -D -v -m644 "${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile[@]}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

