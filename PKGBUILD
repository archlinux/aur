# dreieck

_pkgname='dev_scream'
_typesuffix='-dkms'
_vcssuffix='-git'
pkgname="${_pkgname}${_typesuffix}${_vcssuffix}"
pkgver=r17.20240911.f657691
pkgrel=1
pkgdesc="Linux kernel module that creates a device '/dev/scream', similar to '/dev/zero' but outputting random letter combinations of 'aAHh' (screaming)."
url='https://github.com/matlink/dev_scream'
arch=(
  'any' # It builds binaries via DKMS _after_ module installation, for whatever architecture the current system runs on, so this package is regarded to be architecture independent.
)
license=('GPL-2.0-only')
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
install='dev_scream-dkms.install'
source=(
  "${_pkgname}::git+${url}.git"
  "${_pkgname}-dkms.conf.in"
  "scream.modules-load.conf"
  "${install}"
)
sha256sums=(
  'SKIP'                                                             # Main source (latest git checkout from $url.git)
  '64c5fbe7d7f2cbc9915952ab2c74545a7cc4f32977baae2ba8e0b6a9f41af333' # ${_pkgname}-dkms.conf.in (dev_scream-dkms.conf.in)
  'e9b19eebf2d48369666e5e5657f6459ef9c14889d4a6737bd946e1a48fe82942' # scream.modules-load.conf
  'ae8deb764fd94fe1d002b7dfdd2b11fbe3e0dd6e743603b3702fe9db7a8c3088' # ${install} (dev_scream-dkms.install)
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  ## Apply patches:

  if stat "${srcdir}"/*.patch > /dev/null 2>&1; then # Do only if at least one patch file is present
    for _patch in "${srcdir}"/*.patch; do
      printf '%s\n' "  -> Applying patch '$(basename "${_patch}")' ..."
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
  install -D -m644 -v "${srcdir}/scream.modules-load.conf" "${pkgdir}/usr/lib/modules-load.d/scream.conf"

  ## Install documentation files:
  for _docfile in "${srcdir}"/{"${_pkgname}/README.md","website.url","git.log"}; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "${_docfile}")"
  done
}
