# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
# Based on aur/uksmd-nosystemd-git by
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
#   Based on aur/uksmd-git by
#     Contributor: Yurii Kolesnykov <root [at] yurikoles.com>
#     Based on aur/uksmd by
#       Oleksandr Natalenko <oleksandr [at] natalenko.name>

_pkgname=uksmdstats
_downloadname="${_pkgname}-CachyOS"
pkgname="${_pkgname}-git"
epoch=0
pkgver=1.2.8.r108.20231220.65b9974
pkgrel=1
pkgdesc="Statistics output for uksmd, a userspace KSM helper daemon. Latest git checkout."
url='https://github.com/CachyOS/uksmd'
license=(GPL3)
arch=(
  'any'
)
depends=(
  'bash'
  'gettext'
)
optdepends=(
  'uksmd: To utilise the kernel side UKSMD feature.'
  'UKSMD-BUILTIN: Necessary kernel support.' # This is an optional dependency to not force users to use package management for self-compiled kernels.
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
  "${_downloadname}::git+${url}.git"
)
sha256sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_downloadname}"

  git log > git.log
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

package() {
  cd "${srcdir}/${_downloadname}"

  install -Dvm755 uksmdstats "${pkgdir}/usr/bin/uksmdstats"

  install -Dvm644 git.log "${pkgdir}/usr/share/doc/${_pkgname}/git.log"
  install -Dvm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dvm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
