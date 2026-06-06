# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname="sipserver"
pkgname="${_pkgname}-git"
pkgver=r33.20240531.d78f458
pkgrel=1
pkgdesc="A simple SIP server (proxy) for handling VoIP calls based on Session Initialization Protocol. Just accepts every client, does not validate credentials."
arch=(
  "aarch64"
  "armv7h"
  "armv8h"
  "loong64"
  "i686"
  "x86_64"
)
url="https://github.com/BarGabriel/SipServer"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-bin"
)
replaces=()
makedepends=(
  "git"
  "cmake"
  "libgcc_s.so"
  "libstdc++"
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++.so'
)
optdepends=()
source=(
  "${_pkgname}::git+${url}.git"        # schildi-revenge source code.
)
sha256sums=(
  'SKIP'  # Main upstream source.
)
#options+=('!lto' 'debug' '!strip')


prepare() {
  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> Generating git log ..."
  git log > git.log
}



pkgver() {
  cd "${srcdir}/${_pkgname}"

  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "r${_rev}.${_date}.${_hash}"
  fi
}



build() {
  cd "${srcdir}"

  cmake -S "${_pkgname}" -B build \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.10 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}



package() {
  cd "${srcdir}/build"

  install -Dvm755 -t "${pkgdir}/usr/bin" SipServer
  ln -svr "${pkgdir}/usr/bin/SipServer" "${pkgdir}/usr/bin/sipserver"

  cd "${srcdir}/${_pkgname}"

  printf '%s\n' " --> Installing basic documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" git.log README.md

  printf '%s\n' " --> Installing license ..."
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  LICENSE
}
