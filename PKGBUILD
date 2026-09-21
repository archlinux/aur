# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='archlinux'
_variant='basic'
pkgname="libvirt-image-${_pkgname}-basic-bin"
pkgver=20260915.594445
pkgrel=1
pkgdesc='Official Arch Linux basic QCOW2 template for libvirt without cloud-init'
arch=('x86_64')
url='https://gitlab.archlinux.org/archlinux/arch-boxes'
license=('LicenseRef-Various')
checkdepends=(
	'libguestfs'
	'linux'
	'qemu-img'
)
_upstream_image="Arch-Linux-${CARCH}-${_variant}-${pkgver}.qcow2"
_template="${_pkgname}-${_variant}-${pkgver}-${CARCH}-template.qcow2"
_template_link="${_pkgname}-${_variant}-${CARCH}-template.qcow2"
source=(
	"${_upstream_image}::https://geo.mirror.pkgbuild.com/images/v${pkgver}/${_upstream_image}"
	"${_upstream_image}.sig::https://geo.mirror.pkgbuild.com/images/v${pkgver}/${_upstream_image}.sig"
	'DISTRIBUTION-LICENSE'
)
noextract=("${_upstream_image}")
sha256sums=(
	'e60a99fd359d37a2d95e68534d42ff1f84244b879e47712dc6714678fb67dbaf'
	'SKIP'
	'1227563c5cc845d4a1fd0dbd0aced043040edb36168ad3278e6341e638647e29'
)
validpgpkeys=('1B9A16984A4E8CB448712D2AE0B78BF4326C6F8F')

_install_payload() {
	local root="${1:?missing package root}"
	local image_dir="${root}/var/lib/libvirt/images"

	install -Dm444 -- "${srcdir}/${_upstream_image}" "${image_dir}/${_template}"
	ln -s -- "${_template}" "${image_dir}/${_template_link}"
	install -Dm644 -- "${srcdir}/DISTRIBUTION-LICENSE" \
		"${root}/usr/share/licenses/${pkgname}/LICENSE"
}

_check_payload() {
	local root="${1:?missing package root}"
	local check_owner="${2:-false}"
	local image_path="${root}/var/lib/libvirt/images/${_template}"
	local image_link="${root}/var/lib/libvirt/images/${_template_link}"
	local license_path="${root}/usr/share/licenses/${pkgname}/LICENSE"
	local manifest

	[[ -f "${image_path}" ]] || return 1
	[[ -L "${image_link}" ]] || return 1
	[[ "$(readlink -- "${image_link}")" == "${_template}" ]] || return 1
	[[ -f "${license_path}" ]] || return 1
	[[ "$(stat -c '%a' -- "${image_path}")" == '444' ]] || return 1
	[[ "$(stat -c '%a' -- "${license_path}")" == '644' ]] || return 1
	[[ -z "$(find "${root}" -name '*.sig' -print -quit)" ]] || return 1

	manifest="$(find "${root}" \( -type f -o -type l \) -printf '%P\n' | sort)"
	[[ "${manifest}" == "$(printf '%s\n' \
		"usr/share/licenses/${pkgname}/LICENSE" \
		"var/lib/libvirt/images/${_template}" \
		"var/lib/libvirt/images/${_template_link}")" ]] || return 1

	if [[ "${check_owner}" == 'true' ]]; then
		[[ "$(stat -c '%u:%g' -- "${image_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${license_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${image_link}")" == '0:0' ]] || return 1
	fi
}

_check_guest() {
	local image="${srcdir}/${_upstream_image}"
	local guest_log="${srcdir}/check-guest-${_variant}.log"
	local pacman_integrity_log="${srcdir}/check-pacman-integrity-${_variant}.log"
	local guest_check
	local os_id
	local package_count
	local base_rc
	local cloud_init_rc
	local qk_rc
	local qkk_rc
	local run_mode
	local resolv_target
	local journal_group
	local file_output
	local qemu_info
	local warning_count
	local parsed_count=0
	local unexpected_count=0
	local path
	local reason

	guest_check='
set +e
export LC_ALL=C
. /usr/lib/os-release
printf "__OS_ID__=%s\\n" "${ID:-}"
package_count=$(/usr/bin/pacman --config /dev/null -Qq 2>/dev/null | wc -l)
printf "__PACKAGE_COUNT__=%s\\n" "${package_count}"
/usr/bin/pacman --config /dev/null -Q base >/dev/null 2>&1
printf "__BASE_RC__=%d\\n" "$?"
/usr/bin/pacman --config /dev/null -Q cloud-init >/dev/null 2>&1
printf "__CLOUD_INIT_RC__=%d\\n" "$?"
printf "__RUN_MODE__=%s\\n" "$(stat -c %a /run 2>/dev/null)"
printf "__RESOLV_TARGET__=%s\\n" "$(readlink /etc/resolv.conf 2>/dev/null)"
printf "__JOURNAL_GROUP__=%s\\n" "$(stat -c %G /var/log/journal 2>/dev/null)"
qk_output="$(/usr/bin/pacman --config /dev/null -Qk 2>&1)"
qk_rc=$?
printf "__QK_BEGIN__\\n"
printf "%s\\n" "${qk_output}"
printf "__QK_RC__=%d\\n" "${qk_rc}"
# Preserve stderr on the sh-out stream, then discard pacman summary stdout.
qkk_stderr="$(/usr/bin/pacman --config /dev/null -Qkk 2>&1 >/dev/null)"
qkk_rc=$?
printf "__QKK_BEGIN__\\n"
printf "%s\\n" "${qkk_stderr}"
printf "__QKK_RC__=%d\\n" "${qkk_rc}"
exit 0
'

	_marker_value() {
		local marker="${1:?missing marker}"
		local count

		count="$(grep -c "^${marker}=" "${guest_log}" || true)"
		(( count == 1 )) || {
			printf 'guest verification marker %s occurred %d times\n' "${marker}" "${count}" >&2
			return 1
		}
		sed -n "s/^${marker}=//p" "${guest_log}"
	}

	_is_expected_integrity_mismatch() {
		local mismatch_path="${1:?missing mismatch path}"
		local mismatch_reason="${2:?missing mismatch reason}"

		case "${mismatch_path}" in
			'/etc/resolv.conf')
				# arch-boxes intentionally replaces the packaged file with systemd-resolved's symlink.
				[[ "${mismatch_reason}" == 'File type mismatch' &&
					"${resolv_target}" == '/run/systemd/resolve/stub-resolv.conf' ]]
				;;
			'/run')
				# pacstrap pre-creates API mountpoints as 0555 before installing filesystem (mtree: 0755).
				[[ "${mismatch_reason}" == 'Permissions mismatch' && "${run_mode}" == '555' ]]
				;;
			'/var/log/journal')
				# systemd's tmpfiles hook intentionally assigns the systemd-journal group.
				[[ "${mismatch_reason}" == 'GID mismatch' &&
					"${journal_group}" == 'systemd-journal' ]]
				;;
			*)
				return 1
				;;
		esac
	}

	rm -f -- "${guest_log}" "${pacman_integrity_log}"

	printf '%s\n' 'check: QCOW2 structure'
	file_output="$(file -L --brief -- "${image}")" || {
		printf 'file failed for %s\n' "${image}" >&2
		return 1
	}
	[[ "${file_output}" == *'QEMU QCOW'* ]] || {
		printf 'unexpected image type: %s\n' "${file_output}" >&2
		return 1
	}
	qemu_info="$(LC_ALL=C qemu-img info -- "${image}")" || {
		printf 'qemu-img info failed for %s\n' "${image}" >&2
		return 1
	}
	grep -Fxq 'file format: qcow2' <<< "${qemu_info}" || {
		printf '%s\n' "${qemu_info}" >&2
		return 1
	}
	if ! qemu-img check -q -- "${image}"; then
		qemu-img check -- "${image}" || true
		return 1
	fi

	printf '%s\n' 'check: read-only guest package database'
	guestfish --ro -a "${image}" -i -- sh-out "${guest_check}" "${guest_log}" || {
		cat -- "${guest_log}" 2>/dev/null || true
		return 1
	}

	os_id="$(_marker_value '__OS_ID__')" || return 1
	package_count="$(_marker_value '__PACKAGE_COUNT__')" || return 1
	base_rc="$(_marker_value '__BASE_RC__')" || return 1
	cloud_init_rc="$(_marker_value '__CLOUD_INIT_RC__')" || return 1
	run_mode="$(_marker_value '__RUN_MODE__')" || return 1
	resolv_target="$(_marker_value '__RESOLV_TARGET__')" || return 1
	journal_group="$(_marker_value '__JOURNAL_GROUP__')" || return 1
	qk_rc="$(_marker_value '__QK_RC__')" || return 1
	qkk_rc="$(_marker_value '__QKK_RC__')" || return 1

	[[ "${os_id}" == 'arch' ]] || return 1
	[[ "${package_count}" =~ ^[0-9]+$ ]] || return 1
	(( package_count > 0 )) || return 1
	(( base_rc == 0 )) || return 1
	(( cloud_init_rc != 0 )) || {
		printf '%s\n' 'basic image unexpectedly contains cloud-init' >&2
		return 1
	}
	if (( qk_rc != 0 )); then
		cat -- "${guest_log}"
		return 1
	fi
	(( qkk_rc <= 1 )) || {
		cat -- "${guest_log}"
		return 1
	}

	sed -n '/^__QKK_BEGIN__$/,/^__QKK_RC__=/ {
		/^__QKK_BEGIN__$/d
		/^__QKK_RC__=/d
		p
	}' "${guest_log}" > "${pacman_integrity_log}" || return 1

	if grep -Eq '^(error|fatal):' "${pacman_integrity_log}"; then
		cat -- "${pacman_integrity_log}"
		return 1
	fi

	printf '%s\n' 'check: guest package mtree integrity'
	warning_count="$(grep -c '^warning:' "${pacman_integrity_log}" || true)"
	while IFS=$'\t' read -r path reason; do
		(( parsed_count += 1 ))
		if _is_expected_integrity_mismatch "${path}" "${reason}"; then
			continue
		fi
		printf 'unexpected package-file mismatch: %s (%s)\n' "${path}" "${reason}" >&2
		(( unexpected_count += 1 ))
	done < <(
		sed -n 's/^warning: [^:]*: \(\/.*\) (\(.*\))$/\1\t\2/p' "${pacman_integrity_log}"
	)

	if (( parsed_count != warning_count || unexpected_count != 0 )); then
		cat -- "${pacman_integrity_log}"
		printf 'pacman integrity warnings: total=%d parsed=%d unexpected=%d\n' \
			"${warning_count}" "${parsed_count}" "${unexpected_count}" >&2
		return 1
	fi
}

check() {
	local package_root="${srcdir}/check-package-root-${_variant}"

	_check_guest

	printf '%s\n' 'check: staged package payload'
	rm -rf -- "${package_root}"
	_install_payload "${package_root}"
	_check_payload "${package_root}"
}

package() {
	_install_payload "${pkgdir}"
	_check_payload "${pkgdir}" true
}
