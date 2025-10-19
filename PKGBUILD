# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Vadim Yanitskiy

_pkgname=libosmocore
_pkgvariant=nosystemd
_pkgvcs=git
pkgbase="${_pkgname}-${_pkgvariant}-${_pkgvcs}"
pkgname=(
  "${pkgbase}"
  "${pkgbase}-doc"
)
pkgver=1.11.0+48.r5006.20251008.9396e27cc
pkgrel=1
pkgdesc="Osmocom core library (functions relating to mobile communication standards). Compiled without systemd logging dependency."
arch=(
  'i686'
  'x86_64'
)
url="https://osmocom.org/projects/libosmocore/wiki/Libosmocore"
license=('GPL-2.0-or-later')
makedepends=(
  'autoconf'
  'automake'
  'doxygen'  # to build the documentation.
  'gcc'
  'git'
  'libtool'
  'liburing'
  'make'
  'pkg-config'
  'python'
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

  git log > "${srcdir}/git.log"
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
    'glibc'
    'gnutls'
    'libmnl'
    'libusb'
    'liburing'
    'lksctp-tools'
    'pcsclite'
    'sh'
    'talloc'
  )
  optdepends=(
    "${_pkgname}-doc=${pkgver}: Documentation for this software."
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
  if [ -d "${pkgdir}/usr/share/doc" ]; then
    msg2 "Removing documentation ..."
    rm -R "${pkgdir}/usr/share/doc"
  fi

  msg2 "Installing license ..."
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}

_package_docs() {
  pkgdesc="Documentation for ${_pkgname}."
  arch=('any')
  depends=()
  optdepends=(
    "${_pkgname}=${pkgver}: The software this documentation is for."
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

  msg2 "Installing git repository's information files ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/libosmocore" "README.md" "TODO-RELEASE" "${srcdir}/git.log"
}

eval "package_${pkgname}() { _package_main \"\$@\"; }"
eval "package_${pkgname}-doc() { _package_docs \"\$@\"; }"
