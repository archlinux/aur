# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Based on aur/uksmd-nosystemd-git by
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
#   Based on aur/uksmd-git by
#     Contributor: Yurii Kolesnykov <root [at] yurikoles.com>
#     Based on aur/uksmd by
#       Oleksandr Natalenko <oleksandr [at] natalenko.name>

_pkgname=uksmd
_downloadname="${_pkgname}-CachyOS"
pkgname="${_pkgname}-cachyos-nosystemd-git"
epoch=0
pkgver=1.2.5.r101.20230708.72722da
pkgrel=2
pkgdesc="Userspace KSM helper daemon. CachyOS-version with 'uksmdstats'. Without systemd dependency, latest git checkout."
url='https://github.com/CachyOS/uksmd'
# Original upstream URL: https://codeberg.org/pf-kernel/uksmd
license=(GPL3)
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
  'bash: For uksmdstats script.'
  'gettext: For uksmdstats script.'
  'uksmd-openrc: For OpenRC initscript.'
  'UKSMD-BUILTIN: Necessary kernel support.' # This is an optional dependency to not force users to use package management for self-compiled kernels.
)
makedepends=(
  'git'
  'meson'
)
provides=(
  "${_pkgname}"
  "${_pkgname}-cachyos=${pkgver}"
  "${_pkgname}-nosystemd"
  "${_pkgname}-git"
  "uksmdstats=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "uksmdstats"
)
source=(
  "${_downloadname}::git+${url}.git"
  'disable_systemd_build.patch'
)
sha256sums=(
  'SKIP'
  '0da6e7d475536bf91d2c39f672d2c33026ea46740e5f2d6e2d84e47676d69edf'
)

prepare() {
  cd "${srcdir}/${_downloadname}"

  git log > git.log
  patch -N --follow-symlinks -i "${srcdir}/disable_systemd_build.patch" 'meson.build'
}

pkgver() {
  cd "${srcdir}/${_downloadname}"

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
  cd "${srcdir}/${_downloadname}"

  arch-meson . build
  meson compile -C build
}

package() {
  cd "${srcdir}/${_downloadname}"

  meson install -C build --destdir "${pkgdir}"

  install -Dvm644 git.log "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  install -Dvm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
