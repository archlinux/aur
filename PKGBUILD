# Maintainer: dreieck (https://aur.archlinux.org/account/dreieck)
#
# Based on:
# * https://github.com/CachyOS/CachyOS-PKGBUILDS/blob/master/cachyos-ksm-settings/PKGBUILD (2025-05-03) by
#   Contributor: Vasiliy Stelmachenok <ventureo(at)cachyos.org>
# And based on:
# * aur/uksmd-nosystemd-git by
#   Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
#   which is based on
#   - aur/uksmd-git by
#     Contributor: Yurii Kolesnykov <root [at] yurikoles.com>, which is based on
#     + aur/uksmd by
#       Oleksandr Natalenko <oleksandr [at] natalenko.name>

_pkgname="cachyos-ksm-settings"
_gitname="CachyOS-PKGBUILDS"
_githost=github.com
_gituser=CachyOS
pkgname="${_pkgname}-git"
epoch=0
pkgver=4.r3.20250629.62660947
pkgrel=1
pkgdesc="Package for easy configuration of kernel samepage merding (KSM) via commandline or systemd. Replaces 'uksmd'."
url='https://github.com/CachyOS/CachyOS-PKGBUILDS/tree/master/cachyos-ksm-settings'
license=("GPL-3.0-or-later")
arch=(
  'any'
)
depends=(
  'bash'
)
optdepends=(
  'systemd>=256:   For automatic control via systemd.'
  'ksmctl-openrc:  For OpenRC initscript.'
  "gdm:            For systemd service override to work (gdm graphical session via systemd)."
  "lightdm:        For systemd service override to work (lightdm graphical session via systemd)."
  "ly:             For systemd service override to work (ly session via systemd)."
  "sddm:           For systemd service override to work (sddm graphical session via systemd)."
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
  "ksmctl=${pkgver}"
  "ksmstats=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "ksmctl"
  "ksmstats"
  "cachyos-settings<1:1.1.8"
  "ksmtuned"
)
replaces=()
backup=('etc/tmpfiles.d/ksm.conf')
source=(
  "${_gitname}::git+https://${_githost}/${_gituser}/${_gitname}.git"
)
sha256sums=(
  'SKIP'
)
# Those files in ${_gitname}/${_pkgname}/ will be used -- only look at them when generating version number:
_sourcefiles=(
  ksmctl
  ksmstats
  10-enable-ksm-by-default.conf
  10-systemd-ksm.conf
)

prepare() {
  cd "${srcdir}/${_gitname}/${_pkgname}"

  #for _patch in "${srcdir}/ksmctl-add-status-output.patch"; do
  #  printf '%s\n' "   > Applying patch $(basename "${_patch}")"
  #  patch -Np1 --follow-symlinks -i "${_patch}"
  #done

  git log -- * > git.log
}

pkgver() {
  cd "${srcdir}/${_gitname}/${_pkgname}"

  _ver="$(grep -E '^pkgver=' PKGBUILD | tail -n1 | sed 's|#.*$||' | awk -F '=' '{print $2}' | tr -d '[[:space:]]')"
  _rev="$(git rev-list --count HEAD -- "${_sourcefiles[@]}")"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad" -- "${_sourcefiles[@]}")"
  _hash="$(git log -n1 --oneline --abbrev-commit -- "${_sourcefiles[@]}" | awk '{print $1}')"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  elif [ -z "${_rev}" ]; then
    error "Git commit count could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

#build() {
#  cd "${srcdir}/${_gitname}/${_pkgname}"
#}

package() {
  cd "${srcdir}/${_gitname}/${_pkgname}"

  install -Dvm755 -t "${pkgdir}/usr/bin" ksmctl ksmstats

  install -Dvm644 10-systemd-ksm.conf            "${pkgdir}/usr/lib/systemd/system/gdm.service.d/10-ksm.conf"
  install -Dvm644 10-systemd-ksm.conf            "${pkgdir}/usr/lib/systemd/system/sddm.service.d/10-ksm.conf"
  install -Dvm644 10-systemd-ksm.conf            "${pkgdir}/usr/lib/systemd/system/lightdm.service.d/10-ksm.conf"
  install -Dvm644 10-systemd-ksm.conf            "${pkgdir}/usr/lib/systemd/system/ly.service.d/10-ksm.conf"
  install -Dvm644 10-systemd-ksm.conf            "${pkgdir}/usr/lib/systemd/system/user@.service.d/10-ksm.conf"
  install -Dvm644 10-systemd-ksm.conf            "${pkgdir}/usr/lib/systemd/system/getty@.service.d/10-ksm.conf"
  install -Dvm644 10-enable-ksm-by-default.conf  "${pkgdir}/usr/lib/tmpfiles.d/10-enable-ksm-by-default.conf"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      git.log
}

