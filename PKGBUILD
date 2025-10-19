# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)

_projectname="fut"
_pkgname="${_projectname}"
pkgname="${_pkgname}-git"
pkgver=3.2.13+1.r2724.20250915.3689c0b2
pkgrel=1
pkgdesc="Fusion Programming Language. Designed for implementing reusable components (libraries) for C, C++, C#, D, Java, JavaScript, Python, Swift, TypeScript and OpenCL C, all from single codebase. Formerly called 'cito'/ 'Ć Programming Language'."
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)

_gitprotocol='git+https'
_githost="github.com"
_gituser="fusionlanguage"
_giturl="${_githost}/${_gituser}/${_projectname}.git"
url="http://${_githost}/${_gituser}/${_projectname}"
license=("GPL-3.0-or-later")
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'dotnet-sdk'
  'git'
)
### Checks are _very_ extensive. So we disable for now.
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
  "cito=${pkgver}"
  "cito-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "cito"
)
replaces=(
  "cito-git"
)

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

  _ver="$(git describe --tags | sed -E -e 's|cito[-_+]||' -e 's|^fut[-_+]||' -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
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

### Checks are _very_ extensive. So we disable for now.
# check() {
#   cd "${srcdir}/${_pkgname}"
# 
#   make test
# }

package() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> installing ..."
  install -Dvm755 fut "${pkgdir}/usr/bin/fut"
  ln -svr "${pkgdir}/usr/bin/fut" "${pkgdir}/usr/bin/cito"

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
