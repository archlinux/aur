# Maintainer:  dreieck

_pkgname=push.sh
pkgname=${_pkgname}-git
pkgver=3.4.r18.20200907.5d5b38a
pkgrel=1
pkgdesc="A POSIX shell function to treat a variable like an array, quoting args."
arch=('any')
url='https://github.com/vaeth/push'
license=('BSD-3-Clause')
depends=(
  'coreutils'  # For 'cat'
  'bash'
)
makedepends=('git')
optdepends=()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=()
backup=()
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}_Makefile-honour-destination-variables.patch::https://github.com/vaeth/push/pull/3.patch"
)
sha256sums=(
  'SKIP' # Main upstream source
  'c4426b052a4e448cc7af6bf6f93787fb73692d1a1a4726aeb503e4929d809736' # ${_pkgname}_Makefile-honour-destination-variables.patch
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  git log > git.log

  local _patch
  for _patch in "${srcdir}/${_pkgname}_Makefile-honour-destination-variables.patch"; do
    printf '%s\n' " --> Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  make clean
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

  make PREFIX=/usr all
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"  git.log README.md
}
