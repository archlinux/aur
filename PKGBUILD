# Maintainer: dreieck
# Based on aur/uksmd-git by
#   Contributor: Yurii Kolesnykov <root@yurikoles.com>
#   Based on aur/uksmd by
#     Oleksandr Natalenko <oleksandr@natalenko.name>

_pkgname=uksmd
_downloadname="${_pkgname}-natalenko"
pkgname="${_pkgname}-nosystemd-git"
epoch=0
pkgver=6.12.2.r80.20241224.ba1086b
pkgrel=1
pkgdesc="Userspace KSM helper daemon. Without systemd dependency, latest git checkout."
url=https://codeberg.org/pf-kernel/uksmd
license=('GPL-3.0-only')
arch=(
  'aarch64'
  'armv7h'
  'armv8h'
  'i686'
  'x86_64'
)
depends=(
  'glibc'
  'libcap-ng'
  'procps-ng'
)
optdepends=(
  'uksmdstats: For statistics information output.'
  'uksmd-openrc: For OpenRC initscript.'
  'UKSMD-BUILTIN: Necessary kernel support.' # This is an optional dependency to not force users to use package management for self-compiled kernels.
)
makedepends=(
  'git'
  'meson>=1.1'
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
  "${_downloadname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}"
  mkdir -p build

  cd "${srcdir}/${_downloadname}"
  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_downloadname}"

  _ver="$(sed -E 's|#.*$||' meson.build | tr '\n' ' ' | sed -E -e 's|project[[:space:]]*\(([^\)]*)\).*$|\1|' -e 's|.*[[:space:]]+version:[[:space:]]*([^,]*)[[:space:]]*,.*|\1|' | tr -d \'\")" # Can also be parsed from `git describe --tags`.
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
  cd "${srcdir}"

  arch-meson -Dsystemd=disabled "${_downloadname}" build
  meson compile -C build
}

package() {
  cd "${srcdir}"

  meson install -C build --destdir "${pkgdir}"

  cd "${srcdir}/${_downloadname}"

  install -Dvm644 git.log "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  install -Dvm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
