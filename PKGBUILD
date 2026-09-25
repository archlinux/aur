# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname=ghostscript-printer-app
pkgname="${_pkgname}-git"
pkgver=1.0+r162.20260914.52decb4
pkgrel=1
pkgdesc="PostScript Printer Application"
url='https://github.com/OpenPrinting/ghostscript-printer-app'
license=("Apache-2.0")
arch=('x86_64')
depends=(
  #'cups-filters>=2' 'cups-filters<3'
  'cups'  # For '/usr/lib/cups/' to which this software symlinks '/usr/lib/ghostscript-printer-app/'.
  'glibc'
  'libcups'
  'libcupsfilters'
  'libppd'
  'pappl'
  'pappl-retrofit'
)
optdepends=(
  #"avahi:  To be able to use ZeroConf names instead of IP addresses."
  #"bind:   To be able to use hostnames instead of IP addresses. ('host' executable.)"
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "git+${url}.git"
)
sha256sums=(
  'SKIP'
)
options=('emptydirs')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  # _ver="$(git describe --tags | sed 's|^v||' | sed 's|\-[^-]*$||' | tr '-' '_')"
  _ver="$(grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+SYSTEM_VERSION_STR[[:space:]]+.' ghostscript-printer-app.c | sed -E 's|^[[:space:]]*#[[:space:]]*define[[:space:]]+SYSTEM_VERSION_STR[[:space:]]+(.)|\1|' | tr -d \"\'[[:space:]])"
  _rev="$(git rev-list --count HEAD)"
  _hash="$(git rev-parse --short HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"

  if [ -n "${_ver}" ]; then
    printf %s "${_ver}+r${_rev}.${_date}.${_hash}"
  else
    error "Could not determine version."
    return 1
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"

  make all
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}/" unitdir="${pkgdir}/usr/lib/systemd/system/" install

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log CODE_OF_CONDUCT.md README.md NOTICE
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
