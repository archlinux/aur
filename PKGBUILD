# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Sam Whited <sam@samwhited.com>
# Contributor: geno <dev@fireorbit.de>
# Contributor: <luntik2012@gmail.com>
# Contributor: Julian Fairfax <juliannfairfax@protonmail.com> 
# Contributor: vpzomtrrfrt <colin@vpzom.click>

_git="false"
_pkg="chatty"
_Pkg="Chatty"
_proj="gnome"
pkgbase="${_pkg}"
pkgname=(
  "purism-${_pkg}"
)
pkgver=0.8.1
pkgrel=1
_pkgdesc=(
  "XMPP and SMS messaging via"
  "libpurple and Modemmanager"
)
_ns="World"
_http="https://gitlab.${_proj}.org/${_ns}"
url="${_http}/${_Pkg}"
license=(
  GPL3
)
arch=(
  aarch64
  armv6h
  armv7h
  arm
  i686
  pentium4
  x86_64
)
depends=(
  evolution-data-server
  feedbackd
  libhandy
  libolm
  libpurple-carbons
)
optdepends=(
  'libpurple-lurch: XMPP E2E OMEMO encryption'
  'purple-xmpp-http-upload: XMPP HTTP Upload - Filesharing'
)
makedepends=(
  meson
  pkg-config
)
[[ "${_git}" == "true" ]] && \
  makedepends+=(
    git
  )
provides=(
  "${_pkg}=${pkgver}"
  "${_proj}-${_pkg}=${pkgver}"
)
group=(
  "${_proj}-world"
)
_commit="d02161d47820070fe2911597f49fae4d0075aebd"
_local="${HOME}/${_Pkg}"
source=()
sha512sums=()
[[ "${_git}" == "true" ]] && \
  source+=(
    "${_Pkg}-v${pkgver}-${_commit}::git+${url}.git#commit=${_commit}"
    # "${_Pkg}-v${pkgver}-${_commit}::git+file://${_local}#commit=${_commit}"
  ) && \
  sha512sums+=(
    SKIP
  )
[[ "${_git}" == "false" ]] && \
  source+=(
    "${url}/-/archive/v${pkgver}/${_Pkg}-${pkgver}.tar.gz"
  ) && \
  sha512sums+=(
    'f760ddd60c7bd74c0b9160386c89b1893d3b721894544d3d10ad7c44494708290b7042b2147bee523272766687e25408324d9abf6479592dcb9d8112e031c139'
  )

build() {
  ls
  [[ "${_git}" == "true" ]] && \
    git \
      -C \
        "${_Pkg}-v${pkgver}-${_commit}" \
      submodule \
        update \
          --init
  arch-meson \
    "${_Pkg}-v${pkgver}-${_commit}" \
    build
  ninja \
    -C \
      build
}

package() {
  DESTDIR="${pkgdir}" \
    ninja \
      -C build \
        install
}

# vim:set sw=2 sts=-1 et:
