# Maintainer: GI_Jack <GI_Jack@hackermail.com>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_pyname="arc4"
_projectname="${_pyname}"
_pkgname="python-${_projectname}"
pkgname="${_pkgname}"
pkgver=0.4.0
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
  'cython'
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-mock'
  'python-sphinx'
)
provides=("${_pkgname}-git=${pkgver}")
conflicts=("${_pkgname}-git")

source=(
  "${_pkgname}::${_gitprotocol}://${_giturl}#tag=${pkgver}"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"
}

build() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation

  printf '%s\n' " --> making documentation ..."
  cd docs
  make man
  make text
  make html
  make qthelp
  gzip -9 _build/man/*
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
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}


