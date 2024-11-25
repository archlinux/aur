# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="mullvad-wg.sh"
_pkgname="${_gitname}"
pkgname="${_pkgname}-git"
pkgver=r5.20230710.ce91d41
pkgrel=3
pkgdesc="Bash script that generates and writes WireGuard configuration files to '/etc/wireguard/' to use Mullvad VPN with WireGuard on linux."
arch=(
  "any"
)
url="https://mullvad.net/en/help/wireguard-and-mullvad-vpn"
_giturl="https://github.com/mullvad/mullvad-wg.sh"
license=(GPL-2.0-or-later)
depends=(
  "bash>=4"
  "coreutils"
  "curl"
  "jq"
)
makedepends=(
  "git"
  "gnupg"
)
optdepends=(
  "sudo:             For the script to be able to change to superuser when invoked as non-superuser."
  "wireguard-tools:  To control the wireguard tunnel (userspace tools)."
  "WIREGUARD-MODULE: To be able to make a wireguard connection (Linux kernel support)."
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}::git+${_giturl}.git"
  "mullvad-wg.sh.html::${url}"
)
validpgpkeys=(
  'D5A1D4F266DE8DDF'
  'CA83A46153BC58D69518ED49A26581F219C8314C'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  export GNUPGHOME="${srcdir}/.gnupg"
  mkdir -p "${GNUPGHOME}"

  cd "${srcdir}/${_pkgname}"

  plain "> Importing PGP keys for signature checking into temporary keyring at '${GNUPGHOME}' ..."
  for _pgpkey in "${validpgpkeys[@]}"; do
    gpg --recv-keys "${_pgpkey}" || true
  done
  plain "> Checking signature of script ..."
  gpg --verify mullvad-wg.sh.asc

  plain "> Generating git log file for documentation purposes ..."
  git log                > "${srcdir}/git.log"
  plain "> Generating website URL file for documentation purposes ..."
  printf '%s\n' "${url}" > "${srcdir}/website.url"
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

package() {
  cd "${srcdir}/${_pkgname}"

  plain "> Installing executable ..."
  install -Dvm755 -t "${pkgdir}/usr/bin"                        "mullvad-wg.sh"

  plain "> Installing documentation ..."
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      "${srcdir}"/{mullvad-wg.sh.html,git.log,website.url} "README.md"

  plain "> Installing license ..."
  install -Dvm744 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "LICENSE"
  install -dvm755 "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}"/* "${pkgdir}/usr/share/doc/${_pkgname}"/
}
