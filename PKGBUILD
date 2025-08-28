# Maintainer:  dreieck 
# Contributor: George Amanakis<gamanakis@gmail.com> (https://aur.archlinux.org/account/gamanakis)
# Contributor: Jon Gjengset <jon@thesquareplanet.com>, Saren Arterius <saren@wtako.net>

_pyname="cpuset"
_pkgname="${_pyname}"
pkgname="${_pkgname}-git"

pkgver=1.6.2.r89.20231027.4f80263
pkgrel=1
pkgdesc="Cpuset is a Python application to make using the cpusets facilities in the Linux kernel easier."
arch=('any')
url="https://github.com/SUSE/cpuset"
license=('GPL-2.0-or-later')
depends=('python>=3')
options+=('!emptydirs')
provides=(
  "${_pkgname}=${pkgver}"
  "python-${_pyname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python-${_pyname}"
)
makedepends=(
  'git'
  'asciidoc'
  'xmlto'
  'gzip'
  'python-build'
  'python-installer'
  'python-setuptools>=61.0.0'
  'python-wheel'
)

source=(
  'git+https://github.com/lpechacek/cpuset'
  '0001-remove-exclusivity.patch' # 0001-remove-exclusivity.patch: removes setting cpu_exclusive and mem_exclusive to 1, thus enabling cpuset to run even when a machine.slice has been created and cannot be modified
)
sha256sums=(
  'SKIP'
  'e60840d099bbfdd9012a70a9bce8b532e29ba071fcf708d45c0dc9fd40304789'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}/0001-remove-exclusivity.patch"; do
    printf '%s\n' "   > Applyin patch $(basename "${_patch}" ...)"
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  # Remove leftover .gz manpage files from previous build -- so that a subsequent "gzip" does not complaint about existing files:
  rm -f doc/*.1.gz

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
  printf '%s\n' " --> building ..."
  python -m build --wheel --no-isolation

  make -C doc all

  gzip --keep -9 doc/*.1
}

package() {
  cd "${srcdir}/${_pkgname}"
  printf '%s\n' " --> installing ..."
  python -m installer --destdir="$pkgdir" --compile-bytecode=2 dist/*.whl

  ## Moving installed documentation into correct place.
  mv -v "${pkgdir}/usr/share/doc/packages/cpuset" "${pkgdir}/usr/share/doc/${_pkgname}"
  rmdir "${pkgdir}/usr/share/doc/packages"

  _docfiles=(
    "${srcdir}/git.log"
    ## Were already installed by installer script into ${pkgdir}/usr/share/doc/packages/cpuset, which we have moved into place:
    #AUTHORS
    #INSTALL
    #NEWS
    #README
    #"doc"/*.txt
    #"doc"/*.html
  )
  _docdirs=()
  _manfiles=(
    "doc"/*.1.gz
  )
  _infofiles=()
  _licensefiles=(
    COPYING
  )
  printf '%s\n' " --> installing documentation ..."
  for _docfile in "${_docfiles[@]}"; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
  ## Were already installed by installer script into ${pkgdir}/usr/share/doc/packages/cpuset, which we have moved into place:
  # install -D -v -m644 -t "${pkgdir}/usr/share/doc/tutorial" doc/tutorial.*
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
    # ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")" # Is already installed by install script
  done
}
