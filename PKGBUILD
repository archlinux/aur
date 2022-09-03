# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="anarchiso"
_non_public_domain_name_pkg="${_pkg#an*}"
_variant="encryption"
_distro="anarchlinux"
_non_public_domain_name_distro="${_distro#an*}"
_domain="${_non_public_domain_name_distro}.org"
distro="Anarch Linux"
_non_public_domain_name_Distro="A${distro#*Ana}"
_pkgbase="${_non_public_domain_name_pkg}-profiles"
profile="baseline"
_pkgname="${_non_public_domain_name_distro}-${profile}"
pkgname="${_distro}-${profile}"
pkgver="$(date +%Y.%m.%d)"
pkgrel=1
pkgdesc="Binary package for '${distro}' (${distro}'s not ${_non_public_domain_name_Distro}) ${profile} image."
arch=('x86_64'
      'i686'
      'pentium4')
license=('AGPL3')
url="https://gitlab.${_non_public_domain_name_distro}.org/tallero/${_non_public_domain_name_pkg}/-/issues/3"
makedepends=("${_pkg}"
             "git"
	     "gnupg"
             "systemd")
checkdepends=('shellcheck')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
optdepends=("${_pkgbase}")
source=("run_mkarchiso.sh")
sha256sums=("SKIP")

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
  sig_email="$(id -un)@$(hostnamectl hostname)"
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
  local _pkg_path="usr/share/${_non_public_domain_name_pkg}"
  local _dest="${pkgdir}/usr/share/${_non_public_domain_name_distro}"
  local _private_dest="${pkgdir}/etc/${_non_public_domain_name_distro}"
  local _iso="${_pkgname}-${pkgver}-x86_64.iso"
  local _dongle_iso="${_pkgname}-dongle-${pkgver}-x86_64.iso"
  local _profile_src="/${_pkg_path}/configs/${profile}"
  local _profile="${srcdir}/${profile}"
  cp -r "${_profile_src}" "${_profile}"
  cd "${_profile}" || exit
  mkdir -p work
  _pgp_key "ephemeral"
  install -d -m 0755 -- "${_dest}"
  install -d -m 0700 -- "${_private_dest}"
  chown -R 962:962 "${_private_dest}"
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
  mv "${_dest}/${_iso}" "${_dest}/${_pkgname}-x86_64.iso"
}
