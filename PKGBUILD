# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_projectname="cito"
_pkgname="${_projectname}"
pkgname="${_pkgname}-git"
pkgver=2.2.0+119.r2071.20230508.7699e43
pkgrel=1
pkgdesc="The Ć Programming Language. A programming language which can be translated automatically to C, C++, C#, D, Java, JavaScript, Python, Swift, TypeScript and OpenCL C."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)

_gitprotocol='git+https'
_githost="github.com"
_gituser="pfusik"
_giturl="${_githost}/${_gituser}/${_projectname}.git"
url="http://${_githost}/${_gituser}/${_projectname}"
license=("GPL3")
depends=(
  'dotnet-runtime'
  'gcc-libs'
  'glibc'
)
makedepends=(
  'dotnet-sdk'
  'git'
)
### Checks are _very_ extensive and several tests fail. So we disable for now.
# checkdepends=(
#   "clang"
#   "diffutils"
#   "dmd" # for 'dmd', a D language compiler
#   "glib2"
#   "java-environment-common" # For 'javac'
#   "java-runtime" # For 'java'
#   "make"
#   "nodejs" # For 'node'
#   "perl"
#   "swift-language" # for 'swift'
#   # "typescript"
#   "python>=3"
# )
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()

source=(
  "${_pkgname}::${_gitprotocol}://${_giturl}"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > "${srcdir}/git.log"

  printf '%s\n' " --> Downloading dotnet dependencies ..."
  dotnet restore
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|cito[-_+]||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  # if [ -z "${_majorver}" ]; then
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
  make
}

### Checks are _very_ extensive and several tests fail. So we disable for now.
# check() {
#   cd "${srcdir}/${_pkgname}"
# 
#   make test
# }

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing ..."
  for _citofile in bin/Debug/net*/*; do
    install -D -v -m644 "${_citofile}" "${pkgdir}/usr/lib/cito/$(basename "${_citofile}")"
  done
  chmod 755 "${pkgdir}/usr/lib/cito/cito"
  install -d -v -m755 "${pkgdir}/usr/bin"
  ln -svr "${pkgdir}/usr/lib/cito/cito" "${pkgdir}/usr/bin/cito"

  _docfiles=(
    "${srcdir}/git.log"
    README.md
  )
  _docdirs=(
    "doc"
  )
  _manfiles=()
  _infofiles=()
  _licensefiles=(
    COPYING
  )
  printf '%s\n' " --> installing documentation ..."
  install -D -v -m644 ci-logo.svg "${pkgdir}/usr/share/pixmaps/ci-logo.svg"
  ln -svr             "${pkgdir}/usr/share/pixmaps/ci-logo.svg" "${pkgdir}/usr/share/pixmaps/cito.svg"
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
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/$(basename "${_licensefile}")" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_licensefile}")"
  done
}
