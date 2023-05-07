# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="arc4"
_projectname="${_pyname}"
_pkgname="python-${_projectname}"
pkgname="${_pkgname}-git"
pkgver=0.4.0+7.r236.20230422.6f0706a
pkgrel=1
pkgdesc="A small and insanely fast ARCFOUR (RC4) cipher implementation for Python."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'armv8h'
  'i686'
  'x86_64'
)
_gitprotocol='git+https'
_githost='github.com'
_gituser='manicmaniac'
_giturl="${_githost}/${_gituser}/${_projectname}.git"
url="https://${_githost}/${_gituser}/${_projectname}"
license=("custom: MIT")
depends=(
  'glibc'
  'python>=3.7'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-mock'
  'python-sphinx'
  #'python-sphinx_rtd_theme'
  #'python-sphinxcontrib-napoleon'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")

source=(
  "${_pkgname}::${_gitprotocol}://${_giturl}"
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

  # _ver="$(grep -E '^[[:space:]]*version[[:space:]]*=' setup.cfg | tail -n1 | sed -E -e 's|^[^=]*=[[:space:]]*||' -e 's|,.*$||' | tr -d \'\")"
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

  printf '%s\n' " --> making documentation ..."
  cd docs
  make man
  make info
  make text
  make html
  make qthelp
  gzip -9 _build/man/*
  gzip -9 _build/texinfo/*.info
}

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    "${srcdir}/git.log"
    README.rst
  )
  _docdirs=(
    docs/_build/html
    docs/_build/qthelp
    docs/_build/text
  )
  _manfiles=(
    docs/_build/man/arc4.1.gz
  )
  _infofiles=(
    docs/_build/texinfo/arc4.info.gz
  )
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
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

