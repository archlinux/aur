# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='debian'
_variant='DVD-1'
_upstream_arch='amd64'
_image_id='debian-offline'
pkgname='libvirt-iso-debian-offline-bin'
pkgver=13.7.0
pkgrel=1
pkgdesc='Official Debian stable DVD-1 offline installation ISO for libvirt'
arch=('x86_64')
url='https://www.debian.org/distrib/'
license=('LicenseRef-Various')
checkdepends=('libarchive')
_iso="${_pkgname}-${pkgver}-${_upstream_arch}-${_variant}.iso"
_checksum="SHA512SUMS-${pkgver}-offline"
_base_url="https://cdimage.debian.org/debian-cd/${pkgver}/${_upstream_arch}/iso-dvd"
source=(
	"${_iso}::${_base_url}/${_iso}"
	"${_checksum}::${_base_url}/SHA512SUMS"
	"${_checksum}.sig::${_base_url}/SHA512SUMS.sign"
	'DISTRIBUTION-LICENSE'
)
noextract=("${_iso}")
sha512sums=(
	'305cc7a3f0d4e293ff979cc6c047d7fe46454853a0f170a0520acd8aab37c2f8839969c817afac2b4324ef5944e0038502b7fcca5dfcd48b5b77544ef1f14cee'
	'SKIP'
	'SKIP'
	'4750f195399fb0d348dedd081d23f82c9fcd5545af7dc27a1af7084bbc23d14ea4cc86e91ae7e3e7be696e2c300632610e08a576797782d837028e5a265e8b78'
)
validpgpkeys=('DF9B9C49EAA9298432589D76DA87E80D6294BE9B')

_install_payload() {
	local root="${1:?missing package root}"
	local image_dir="${root}/var/lib/libvirt/images"

	install -Dm644 -- "${srcdir}/${_iso}" "${image_dir}/${_iso}"
	ln -s -- "${_iso}" "${image_dir}/${_image_id}-${CARCH}.iso"
	install -Dm644 -- "${srcdir}/DISTRIBUTION-LICENSE" \
		"${root}/usr/share/licenses/${pkgname}/LICENSE"
}

_check_payload() {
	local root="${1:?missing package root}"
	local check_owner="${2:-false}"
	local image_path="${root}/var/lib/libvirt/images/${_iso}"
	local image_link="${root}/var/lib/libvirt/images/${_image_id}-${CARCH}.iso"
	local license_path="${root}/usr/share/licenses/${pkgname}/LICENSE"
	local manifest

	[[ -f "${image_path}" ]] || return 1
	[[ -L "${image_link}" ]] || return 1
	[[ "$(readlink -- "${image_link}")" == "${_iso}" ]] || return 1
	[[ -f "${license_path}" ]] || return 1
	[[ "$(stat -c '%a' -- "${image_path}")" == '644' ]] || return 1
	[[ "$(stat -c '%a' -- "${license_path}")" == '644' ]] || return 1
	[[ -z "$(find "${root}" \( -name '*.sig' -o -name '*.sign' \) -print -quit)" ]] || return 1

	manifest="$(find "${root}" \( -type f -o -type l \) -printf '%P\n' | LC_ALL=C sort)"
	[[ "${manifest}" == "$(printf '%s\n' \
		"usr/share/licenses/${pkgname}/LICENSE" \
		"var/lib/libvirt/images/${_iso}" \
		"var/lib/libvirt/images/${_image_id}-${CARCH}.iso" | LC_ALL=C sort)" ]] || return 1

	if [[ "${check_owner}" == 'true' ]]; then
		[[ "$(stat -c '%u:%g' -- "${image_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${license_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${image_link}")" == '0:0' ]] || return 1
	fi
}

check() {
	local iso="${srcdir}/${_iso}"
	local checksum="${srcdir}/${_checksum}"
	local iso_listing="${srcdir}/check-iso-list"
	local disk_info
	local image_size
	local image_description
	local release_codename
	local release_file
	local release_metadata
	local release_version="${pkgver%.*}"
	local required_path
	local -a release_files=()

	printf '%s\n' 'check: signed Debian checksum manifest contains pinned ISO digest'
	grep -Fxq -- "${sha512sums[0]}  ${_iso}" "${checksum}" || return 1

	printf '%s\n' 'check: ISO identity and bootability'
	image_size="$(stat -Lc '%s' -- "${iso}")" || return 1
	(( image_size > 0 && image_size % 2048 == 0 )) || return 1
	image_description="$(file -L --brief -- "${iso}")" || return 1
	grep -Fq 'ISO 9660' <<< "${image_description}" || return 1
	grep -Fq 'bootable' <<< "${image_description}" || return 1

	printf '%s\n' 'check: Debian offline installer layout'
	bsdtar -tf "${iso}" > "${iso_listing}" || return 1
	for required_path in \
		'.disk/info' \
		'install.amd/vmlinuz' \
		'install.amd/initrd.gz' \
		'EFI/boot/bootx64.efi'; do
		grep -Fxq -- "${required_path}" "${iso_listing}" || return 1
	done
	grep -q '^pool/main/' "${iso_listing}" || return 1
	mapfile -t release_files < <(grep -E '^dists/[^/]+/Release$' "${iso_listing}")
	if (( ${#release_files[@]} != 1 )); then
		printf 'check: expected exactly one Debian distribution Release file, found %d\n' \
			"${#release_files[@]}" >&2
		return 1
	fi
	release_file="${release_files[0]}"
	release_codename="${release_file#dists/}"
	release_codename="${release_codename%/Release}"
	release_metadata="$(bsdtar -xOf "${iso}" "${release_file}")" || return 1
	grep -Fxq 'Origin: Debian' <<< "${release_metadata}" || return 1
	grep -Fxq 'Label: Debian' <<< "${release_metadata}" || return 1
	grep -Fxq 'Suite: stable' <<< "${release_metadata}" || return 1
	grep -Fxq "Version: ${release_version}" <<< "${release_metadata}" || return 1
	grep -Fxq "Codename: ${release_codename}" <<< "${release_metadata}" || return 1
	grep -Eq '(^| )amd64( |$)' <<< "$(grep -E '^Architectures: ' <<< "${release_metadata}")" || return 1
	disk_info="$(bsdtar -xOf "${iso}" .disk/info)" || return 1
	grep -Fq "Debian GNU/Linux ${pkgver}" <<< "${disk_info}" || return 1

	printf '%s\n' 'check: full ISO filesystem read'
	bsdtar -xOf "${iso}" > /dev/null || return 1
}

package() {
	_install_payload "${pkgdir}"
	_check_payload "${pkgdir}" true
}
