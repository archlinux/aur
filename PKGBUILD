# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Bruno Ancona <bruno at powerball253 dot com>

_pkgname=hplip-printer-app
pkgname="${_pkgname}-git"
pkgver=1.0+r142.20260109.b3fc7f3
pkgrel=2
pkgdesc="HPLIP Printer Application"
url='https://github.com/OpenPrinting/hplip-printer-app'
license=("Apache-2.0")
arch=('x86_64')
depends=(
  #'cups-filters>=2' 'cups-filters<3'
  'cups'  # For '/usr/lib/cups/', to which this package symlinks '/usr/lib/hplip-printer-app/'.
  'glibc'
  'hplip' # For 'hp-probe'.
  'libcups'
  'libcupsfilters'
  'libcurl.so'
  'libppd'
  'libcrypto.so'  # openssl
  'pappl'
  'pappl-retrofit'
  'perl'
  'sh'
  #'mupdf-tools'
)
optdepends=(
  "avahi:  To be able to use ZeroConf names instead of IP addresses."
  "bind:   To be able to use hostnames instead of IP addresses. ('host' executable.)"
)
makedepends=(
  'git'
  'curl'
  'openssl'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  'git+https://github.com/OpenPrinting/hplip-printer-app.git'
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
  _ver="$(grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+SYSTEM_VERSION_STR[[:space:]]+.' hplip-printer-app.c | sed -E 's|^[[:space:]]*#[[:space:]]*define[[:space:]]+SYSTEM_VERSION_STR[[:space:]]+(.)|\1|' | tr -d \"\'[[:space:]])"
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

  make DESTDIR="${pkgdir}/" install

  install -Dvm644 -t "${pkgdir}"/usr/lib/systemd/system/ hplip-printer-app.service

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log CODE_OF_CONDUCT.md README.md NOTICE
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
