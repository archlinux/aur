# dreieck

_pkgname='dev_one'
_typesuffix='-dkms'
_vcssuffix='-git'
pkgname="${_pkgname}${_typesuffix}${_vcssuffix}"
pkgver=r15.20230110.0171589
pkgrel=1
pkgdesc="Linux kernel module that creates a device '/dev/one', similar to '/dev/zero' but outputting one-bits (0xFF-bytes)."
url='https://github.com/tinmarino/dev_one'
arch=(
  'any' # It builds binaries via DKMS _after_ module installation, for whatever architecture the current system runs on, so this package is regarded to be architecture independent.
)
license=('GPL2')
provides=(
  "${_pkgname}"
  "${_pkgname}${_typesuffix}"
  "${_pkgname}${_vcssuffix}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}${_typesuffix}"
  "${_pkgname}${_vcssuffix}"
)
makedepends=(
  'git'
  'linux'
)
depends=(
  'dkms'
  'linux'
)
install='dev_one-dkms.install'
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}-dkms.conf.in"
  "one.modules-load.conf"
  "${install}"
)
sha256sums=(
  'SKIP'                                                             # Main source (latest git checkout from https://github.com/tinmarino/dev_one.git)
  'eaf701216794a46b55ca01a2a28c2349535c92ea1c63558c3b230ba4f866b047' # ${_pkgname}-dkms.conf.in (dev_one-dkms.conf.in)
  '2c8b08da5ce60398e1f19af0e5dccc744df274b826abe585eaba68c525434806' # one.modules-load.conf
  '788c11d95b3e9b4967f4d53b62366209a7af825e26a867ed4a76fc49cf290b05' # ${install} (dev_one-dkms.install)
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  ## Apply patches:

  if stat "${srcdir}"/*.patch > /dev/null 2>&1; then # Do only if at least one patch file is present
    for _patch in "${srcdir}"/*.patch; do
      printf '%s\n' "  -> Applying patch '${_patch}' ..."
      patch -N -p1 --follow-symlinks -i "${_patch}"
    done
  fi


  ## Create further documentation files:

  printf '%s\n' "  -> Creating 'website.url' information file ..."
  printf '%s\n' "${url}" > "${srcdir}/website.url"

  printf '%s\n' "  -> Creating 'git.log' information file ..."
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    printf '%s\n' "  -> ERROR: Git Commit count could not be determined. Aborting." > /dev/stderr
  return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  printf '%s\n' "  -> Creating 'dkms.conf' ..."
  sed -e "s/@_PKGNAME@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      "${_pkgname}-dkms.conf.in" > "${_pkgname}-dkms.conf"
}

package() {
  cd "${srcdir}"

  ## Install sources and dkms.conf:
  install -D -m644 -v "${srcdir}/${_pkgname}-dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
  cp -rv "${srcdir}/${_pkgname}"/* "${pkgdir}/usr/src/${_pkgname}-${pkgver}"/

  ## Automatically load module at bootup:
  install -D -m644 -v "${srcdir}/one.modules-load.conf" "${pkgdir}/usr/lib/modules-load.d/one.conf"

  ## Install documentation files:
  for _docfile in "${srcdir}"/{"${_pkgname}/README.md","website.url","git.log"}; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
}
