# Maintainer: dreieck
# Based on aur/uksmd-git bv
# Contributor: Yurii Kolesnykov <root@yurikoles.com>
# Based on aur/uksmd by
# Oleksandr Natalenko <oleksandr@natalenko.name>

_pkgname=uksmd
pkgname="${_pkgname}-nosystemd-git"
pkgver=6.4.1.r67.20230707.b698d76
pkgrel=1
pkgdesc="Userspace KSM helper daemon. Without systemd dependency, latest git checkout."
url=https://codeberg.org/pf-kernel/uksmd
license=(GPL3)
arch=(x86_64)
depends=(
  'procps-ng'
  'libcap-ng'
)
optdepends=(
  'uksmd-openrc: For OpenRC initscript.'
  'UKSMD-BUILTIN: Necessary kernel support.' # This is an optional dependency to not force users to use package management for self-compiled kernels.
)
makedepends=(
  'git'
  'meson'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-nosystemd=${pkgver}"
  "${_pkgname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+${url}.git"
  'disable_systemd_build.patch'
)
sha256sums=(
  'SKIP'
  '0bf8c5f13e0a4537993a7c3de2933ce22c6f22332f08e505c6403dd39d3340b0'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -Np1 --follow-symlinks -i "${srcdir}/disable_systemd_build.patch"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(sed -E 's|#.*$||' meson.build | tr '\n' ' ' | sed -E -e 's|project[[:space:]]*\(([^\)]*)\).*$|\1|' -e 's|.*version:[[:space:]]*([^,]*)[[:space:]]*,.*|\1|' | tr -d \'\")" # Can also be parsed from `git describe --tags`.
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

  arch-meson . build
  meson compile -C build
}

package() {
  cd "${srcdir}/${_pkgname}"

  meson install -C build --destdir "${pkgdir}"

  install -Dvm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
