# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux>


_gitname="python-gammu"
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=3.2.4+105.r13079.20240805.b1d8dc780
pkgrel=1
pkgdesc="Python bindings for Gammu library. Latest git checkout."
arch=(
  'i686'
  'x86_64'
  'aarch64'
  'armv6h'
  'armv7h'
)
_githost='github.com'
_gituser='gammu'
url="https://${_githost}/${_gituser}/${_gitname}"
license=("GPL-2.0-or-later")
depends=(
  'gammu'
  'glibc'
  'python>=3'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=()
checkdepends=(
  'libdbi-drivers'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
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

  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir=tmp_install dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  # The test suite cannot run in the project root as the uncompiled package
  # there will take precedence over the compiled package installed in
  # tmp_install, regardless of what PYTHONPATH is set to. To work around this,
  # copy the tests to the tmp_install directory and run them from there.
  cp -r test "$PWD/tmp_install/$site_packages"
  # Tests can be flaky on slower hardware due to timing.
  python -m unittest discover -vs "$PWD/tmp_install/$site_packages"
}

package() {
  cd "${srcdir}/${_pkgname}"

  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  _docfiles=(
    "${srcdir}/git.log"
    AUTHORS
    NEWS.rst
    README.rst
  )
  _docdirs=()
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    COPYING
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
    install -D -v -m644 "docs/build/man/${_manfile}" "${pkgdir}/usr/share/man/man${_section}/$(basename "${_manfile}")"
  done
  for _infofile in "${_infofiles[@]}"; do
    install -D -v -m644 "${_infofile}" "${pkgdir}/usr/share/info/$(basename "${_infofile}")"
  done
  printf '%s\n' " --> installing license ..."
  for _licensefile in "${_licensefiles[@]}"; do
    install -D -v -m644 "${_licensefile}" "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")"
    #ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}

