# Maintainer: dreieck
# Contributor:: Vadim Yanitskiy

_pkgname=libosmocore
_pkgvariant=nosystemd
_pkgvcs=git
pkgbase="${_pkgname}-${_pkgvariant}-${_pkgvcs}"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-doc"
)
pkgver=1.7.0+52.r4351.20221011.327e5e990
pkgrel=1
pkgdesc="Osmocom core library (functions relating to mobile communication standards). Compiled without systemd logging dependency."
arch=(
  'i686'
  'x86_64'
)
url="https://osmocom.org/projects/libosmocore/wiki/Libosmocore"
license=('GPL')
makedepends=(
  'autoconf'
  'automake'
  'gcc'
  'git'
  'libtool'
  'make'
  'pkg-config'
  'python'
  # Probably something missing for building the documentation.
)
source=("${_pkgname}::git+https://gitea.osmocom.org/osmocom/libosmocore.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-f]*$||' | sed -E 's|-([0-9]*)$|+\1|')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  autoreconf -i
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./configure --prefix=/usr \
              --exec-prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/sbin \
              --datadir=/usr/share \
              --libexecdir=/usr/lib \
              --localstatedir=/var \
              --docdir="/usr/share/doc/${_pkgname}" \
              --libdir=/usr/lib/ \
              --disable-systemd-logging \
              --disable-external-tests
  make
}

# check() {
### NOTE: 2022-10-15: dtx and vty tests fail.
#   cd "${srcdir}/${_pkgname}"
#   make check
# }

_package_main() {
  pkgdesc="${pkgdesc}"
  arch=("${arch[@]}")
  depends=(
    'gnutls'
    'libmnl'
    'libusb'
    'lksctp-tools'
    'pcsclite'
    'talloc'
  )
  optdepends=(
    "${_pkgname}-doc=${pkgver}:  Documentation for this software."
  )
  provides=(
    "${_pkgname}=${pkgver}"
    "${_pkgname}-${_pkgvariant}=${pkgver}"
    "${_pkgname}-${_pkgvcs}=${pkgver}"
  )
  conflicts=(
    "${_pkgname}"
    "${_pkgname}-${_pkgvariant}"
    "${_pkgname}-${_pkgvcs}"
  )
  replaces=()

  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
  msg2 "Removing documentation ..."
  rm -R "${pkgdir}/usr/share/doc"
}

_package_docs() {
  pkgdesc="Documentation for ${_pkgname}."
  arch=('any')
  depends=()
  optdepends=(
    "${_pkgname}=${pkgver}:  The software this documentation is for."
  )
  provides=(
    "${_pkgname}-doc=${pkgver}"
    "${_pkgname}-doc-${_pkgvcs}=${pkgver}"
  )
  conflicts=(
    "${_pkgname}-doc"
    "${_pkgname}-doc-${_pkgvcs}"
  )
  replaces=()

  cd "${srcdir}/${_pkgname}"

  mkdir -p "${pkgdir}/staging"
  mkdir -p "${pkgdir}/usr/share/doc"
  make DESTDIR="${pkgdir}/staging" install
  msg2 "Moving documentation in place and removing everything else ..."
  mv "${pkgdir}/staging/usr/share/doc"/* "${pkgdir}/usr/share/doc"/
  rm -R "${pkgdir}/staging"
}

eval "package_${pkgname}() { _package_main \"\$@\"; }"
eval "package_${pkgname}-doc() { _package_docs \"\$@\"; }"
