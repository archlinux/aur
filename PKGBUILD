# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_distro="archlinux"
_domain="${_distro}.org"
distro="Arch Linux"
_pkgbase="${_pkg}-profiles"
profile=ebaseline
_pkgname="${_distro}-${profile}"
pkgname="${_distro}-${profile}-git"
_pkgver="$(date +%Y.%m.%d)"
pkgver=v0.2+41+gc288f94
pkgrel=1
pkgdesc='Builds an Arch Linux desktop'
arch=('any')
license=('GPL3')
url="https://gitlab.${_domain}/tallero/${_pkgbase}"
makedepends=("${_pkg}-encryption"
             "${_pkgbase}"
             "cryptsetup-sigfile"
             "fakepkg"
             "mkinitcpio-${_pkg}-encryption"
             "git")
conflicts=()
checkdepends=('shellcheck')
source=("run_mkarchiso.sh")
sha256sums=("SKIP")

pkgver() {
  # shellcheck disable=SC2154
  local _norev
  _norev="$(pacman -Q "${_pkgbase}" | awk '{print $2}')"
  echo "${_norev%%-*}"
}

prepare() {
  # shellcheck disable=SC2154
  chmod +x "${srcdir}/run_mkarchiso.sh"
}

_ephemeral_signature_info() {
  local _locale_code LANG Timezone
  eval "$(timedatectl show | grep Timezone)"
  eval "$(localectl status | grep LANG | awk '{print $3}')"
  locale_code="${LANG%%.*}"
  sig_country="${locale_code##*_}"
  sig_city="${Timezone##*/}"
  sig_state="${sig_city}"
  sig_org="${distro}"
  sig_unit="Release Engineering"
  sig_domain="${_domain}"
  sig_email="arch-releng@lists.${sig_domain}"
  sig_comment="Ephemeral Signing Key"
  sig_sender="${sig_unit} (${sig_comment}) <${sig_email}>"
}

_pgp_key() {
  _pgp_key_id="${1}"
  if [ "${_pgp_key_id}" == "" ] || [ "${_pgp_key_id}" == "ephemeral" ]; then
    gnupg_homedir="${_profile}/work/gnupg"
    mkdir -p "${gnupg_homedir}"
    _ephemeral_signature_info
    mkarchisogenkey "ephemeral" "pgp" \
                    "${gnupg_homedir}" \
                    "${sig_email}" \
                    "${sig_unit}" \
                    "${sig_comment}" > /dev/null 2>&1
  elif [ "${_pgp_key_id}" == "default" ]; then
    gnupg_homedir="${HOME}/.gnupg"
    sig_sender="makepkg@localhost"
  fi
  pgp_key_id="$(GNUPGHOME="${gnupg_homedir}" \
	        gpg --list-keys \
                    --with-colons | \
		awk -F: '/^pub:/ { print $5 }' | \
		head -n 1)"
}


# shellcheck disable=SC2154
package() {
  _mkarchiso="${srcdir}/run_mkarchiso.sh"
  local _pkg_path="usr/share/${_pkg}"
  local _dest="${pkgdir}/usr/share/${_distro}"
  local _iso="${_pkgname}-${_pkgver}-x86_64.iso"
  local _keys_iso="${_pkgname}-keys-${_pkgver}-x86_64.iso"
  local _profile_src="/${_pkg_path}/configs/${profile}"
  local _profile="${srcdir}/${profile}"
  local _pgp_key_id
  cp -r "${_profile_src}" "${srcdir}"
  cd "${_profile}" || exit
  mkdir -p work
  _pgp_key "ephemeral"
  mkarchisorepo "fakepkg" "packages.extra"
  install -d -m 0755 -- "${_dest}"
  machinectl shell --uid=0 \
	           --setenv=GNUPGHOME="${gnupg_homedir}" \
	           --setenv=DISPLAY="${DISPLAY}" \
		   .host "${_mkarchiso}" \
                         "${gnupg_homedir}" \
                         "${_dest}" \
                         "${pgp_key_id}" \
                         "${sig_sender}" \
                         "${_profile}/work" \
                         "${_profile}"
  mv "${_dest}/${_iso}" "${_dest}/${pkgname}-x86_64.iso"
  mv "${_dest}/${_keys_iso}" "${_dest}/${pkgname}-keys-x86_64.iso"
}
