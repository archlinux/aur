# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='ubuntu'
_release='26.10'
_flavor='desktop'
_upstream_arch='amd64'
_image_id='ubuntu-desktop'
_disk_product='Ubuntu'
_installer_variant='desktop'
_require_lts='false'
pkgname='libvirt-iso-ubuntu-desktop-bin'
pkgver=26.10
pkgrel=1
pkgdesc='Official Ubuntu Desktop installation ISO for libvirt'
arch=('x86_64')
url='https://ubuntu.com/download/desktop'
license=('LicenseRef-Various')
checkdepends=('libarchive')
_source_iso="${_pkgname}-${pkgver}-${_flavor}-${_upstream_arch}.iso"
_installed_iso="${_image_id}-${pkgver}-${CARCH}.iso"
_checksum="SHA256SUMS-${pkgver}-${_image_id}"
_base_url="https://releases.ubuntu.com/${_release}"
source=(
	"${_source_iso}::${_base_url}/${_source_iso}"
	"${_checksum}::${_base_url}/SHA256SUMS"
	"${_checksum}.sig::${_base_url}/SHA256SUMS.gpg"
	'DISTRIBUTION-LICENSE'
)
noextract=("${_source_iso}")
sha256sums=(
	'19efc38dde60055b192526bfbba075ac1da23992f1b006ddd41cbd30db0d9b0c'
	'SKIP'
	'SKIP'
	'ccee829abe16869c3b4e989844357a0fff8fc74ca5eb8d80d83019982c487185'
)
validpgpkeys=('843938DF228D22F7B3742BC0D94AA3F0EFE21092')

_install_payload() {
	local root="${1:?missing package root}"
	local image_dir="${root}/var/lib/libvirt/images"

	install -Dm644 -- "${srcdir}/${_source_iso}" "${image_dir}/${_installed_iso}"
	ln -s -- "${_installed_iso}" "${image_dir}/${_image_id}-${CARCH}.iso"
	install -Dm644 -- "${srcdir}/DISTRIBUTION-LICENSE" \
		"${root}/usr/share/licenses/${pkgname}/LICENSE"
}

_check_payload() {
	local root="${1:?missing package root}"
	local check_owner="${2:-false}"
	local image_path="${root}/var/lib/libvirt/images/${_installed_iso}"
	local image_link="${root}/var/lib/libvirt/images/${_image_id}-${CARCH}.iso"
	local license_path="${root}/usr/share/licenses/${pkgname}/LICENSE"
	local manifest

	[[ -f "${image_path}" ]] || return 1
	[[ -L "${image_link}" ]] || return 1
	[[ "$(readlink -- "${image_link}")" == "${_installed_iso}" ]] || return 1
	[[ -f "${license_path}" ]] || return 1
	[[ "$(stat -c '%a' -- "${image_path}")" == '644' ]] || return 1
	[[ "$(stat -c '%a' -- "${license_path}")" == '644' ]] || return 1
	[[ -z "$(find "${root}" \( -name '*.sig' -o -name '*.gpg' \) -print -quit)" ]] || return 1

	manifest="$(find "${root}" \( -type f -o -type l \) -printf '%P\n' | LC_ALL=C sort)"
	[[ "${manifest}" == "$(printf '%s\n' \
		"usr/share/licenses/${pkgname}/LICENSE" \
		"var/lib/libvirt/images/${_installed_iso}" \
		"var/lib/libvirt/images/${_image_id}-${CARCH}.iso" | LC_ALL=C sort)" ]] || return 1

	if [[ "${check_owner}" == 'true' ]]; then
		[[ "$(stat -c '%u:%g' -- "${image_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${license_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${image_link}")" == '0:0' ]] || return 1
	fi
}

check() {
	local iso="${srcdir}/${_source_iso}"
	local checksum="${srcdir}/${_checksum}"
	local iso_listing="${srcdir}/check-iso-list"
	local install_sources="${srcdir}/check-install-sources.yaml"
	local default_source
	local disk_info
	local image_size
	local image_description
	local required_path
	local -a default_sources=()

	printf '%s\n' 'check: signed Ubuntu checksum manifest contains pinned ISO digest'
	grep -Fxq -- "${sha256sums[0]} *${_source_iso}" "${checksum}" || return 1

	printf '%s\n' 'check: ISO identity and bootability'
	image_size="$(stat -Lc '%s' -- "${iso}")" || return 1
	(( image_size > 0 && image_size % 2048 == 0 )) || return 1
	image_description="$(file -L --brief -- "${iso}")" || return 1
	grep -Fq 'ISO 9660' <<< "${image_description}" || return 1
	grep -Fq 'bootable' <<< "${image_description}" || return 1

	printf '%s\n' 'check: Ubuntu installer layout'
	bsdtar -tf "${iso}" > "${iso_listing}" || return 1
	for required_path in \
		'.disk/info' \
		'casper/vmlinuz' \
		'casper/initrd' \
		'casper/install-sources.yaml' \
		'EFI/boot/bootx64.efi'; do
		grep -Fxq -- "${required_path}" "${iso_listing}" || return 1
	done
	disk_info="$(bsdtar -xOf "${iso}" .disk/info)" || return 1
	if [[ "${disk_info}" != "${_disk_product} ${pkgver}" && "${disk_info}" != "${_disk_product} ${pkgver} "* ]]; then
		printf 'check: unexpected Ubuntu product/version in .disk/info: %s\n' "${disk_info}" >&2
		return 1
	fi
	if [[ "${_require_lts}" == 'true' ]]; then
		grep -Eq '(^|[[:space:]])LTS([[:space:]]|$)' <<< "${disk_info}" || {
			printf 'check: expected LTS marker in .disk/info: %s\n' "${disk_info}" >&2
			return 1
		}
	fi

	printf '%s\n' 'check: Ubuntu installer source metadata'
	bsdtar -xOf "${iso}" casper/install-sources.yaml > "${install_sources}" || return 1
	mapfile -t default_sources < <(
		awk -v expected_variant="${_installer_variant}" '
			function emit_source() {
				if (active && is_default && variant == expected_variant && type ~ /^fsimage(-layered)?$/ && path != "") {
					print path
				}
				active = 0
			}
			/^sources:$/ {
				in_sources = 1
				next
			}
			in_sources && /^- / {
				emit_source()
				active = 1
				is_default = ($0 == "- default: true")
				variant = ""
				type = ""
				path = ""
				next
			}
			in_sources && /^[^[:space:]-]/ {
				emit_source()
				in_sources = 0
				next
			}
			active && /^  default: true$/ {
				is_default = 1
				next
			}
			active && /^  variant: / {
				variant = substr($0, 12)
				next
			}
			active && /^  type: / {
				type = substr($0, 9)
				next
			}
			active && /^  path: / {
				path = substr($0, 9)
				next
			}
			END {
				if (in_sources) {
					emit_source()
				}
			}
		' "${install_sources}"
	)
	if (( ${#default_sources[@]} != 1 )); then
		printf 'check: expected exactly one default %s installer source, found %d\n' \
			"${_installer_variant}" "${#default_sources[@]}" >&2
		return 1
	fi
	default_source="${default_sources[0]}"
	if [[ "${default_source}" != *.squashfs || "${default_source}" == */* ]]; then
		printf 'check: invalid default installer source path: %s\n' "${default_source}" >&2
		return 1
	fi
	grep -Fxq -- "casper/${default_source}" "${iso_listing}" || {
		printf 'check: default installer source is missing from ISO: %s\n' "${default_source}" >&2
		return 1
	}

	printf '%s\n' 'check: full ISO filesystem read'
	bsdtar -xOf "${iso}" > /dev/null || return 1
}

package() {
	_install_payload "${pkgdir}"
	_check_payload "${pkgdir}" true
}
