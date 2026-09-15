# Maintainer: @RubenKelevra <rubenkelevra@gmail.com>

_pkgname='archlinux'
pkgname="libvirt-iso-${_pkgname}-bin"
pkgver=2026.09.01
pkgrel=1
pkgdesc='Official Arch Linux installation ISO for libvirt'
arch=('x86_64')
url='https://archlinux.org/download/'
license=('LicenseRef-Various')
checkdepends=(
	'libarchive'
	'squashfs-tools'
)
source=(
	"${_pkgname}-${pkgver}-${CARCH}.iso::https://archive.archlinux.org/iso/${pkgver}/${_pkgname}-${pkgver}-${CARCH}.iso"
	"${_pkgname}-${pkgver}-${CARCH}.iso.sig::https://archive.archlinux.org/iso/${pkgver}/${_pkgname}-${pkgver}-${CARCH}.iso.sig"
	'DISTRIBUTION-LICENSE'
)
noextract=("${_pkgname}-${pkgver}-${CARCH}.iso")
sha256sums=(
	'be8458032f8105e60ee2a3067f950b6e3c007ee51b38dac50e8b48e765561c91'
	'SKIP'
	'cb5f1ca3b96864dcbf26ef4792510c79eabd25a8988fd57e24fef4c02b278d4c'
)
validpgpkeys=('3E80CA1A8B89F69CBA57D98A76A5EF9054449A5C')

_install_payload() {
	local root="${1:?missing package root}"
	local image="${_pkgname}-${pkgver}-${CARCH}.iso"
	local image_dir="${root}/var/lib/libvirt/images"

	install -Dm644 -- "${srcdir}/${image}" "${image_dir}/${image}"
	ln -s -- "${image}" "${image_dir}/${_pkgname}-${CARCH}.iso"
	install -Dm644 -- "${srcdir}/DISTRIBUTION-LICENSE" \
		"${root}/usr/share/licenses/${pkgname}/LICENSE"
}

_check_payload() {
	local root="${1:?missing package root}"
	local check_owner="${2:-false}"
	local image="${_pkgname}-${pkgver}-${CARCH}.iso"
	local image_path="${root}/var/lib/libvirt/images/${image}"
	local image_link="${root}/var/lib/libvirt/images/${_pkgname}-${CARCH}.iso"
	local license_path="${root}/usr/share/licenses/${pkgname}/LICENSE"
	local manifest

	[[ -f "${image_path}" ]] || return 1
	[[ -L "${image_link}" ]] || return 1
	[[ "$(readlink -- "${image_link}")" == "${image}" ]] || return 1
	[[ -f "${license_path}" ]] || return 1
	[[ "$(stat -c '%a' -- "${image_path}")" == '644' ]] || return 1
	[[ "$(stat -c '%a' -- "${license_path}")" == '644' ]] || return 1
	[[ -z "$(find "${root}" -name '*.sig' -print -quit)" ]] || return 1

	manifest="$(find "${root}" \( -type f -o -type l \) -printf '%P\n' | sort)"
	[[ "${manifest}" == "$(printf '%s\n' \
		"usr/share/licenses/${pkgname}/LICENSE" \
		"var/lib/libvirt/images/${image}" \
		"var/lib/libvirt/images/${_pkgname}-${CARCH}.iso")" ]] || return 1

	if [[ "${check_owner}" == 'true' ]]; then
		[[ "$(stat -c '%u:%g' -- "${image_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${license_path}")" == '0:0' ]] || return 1
		[[ "$(stat -c '%u:%g' -- "${image_link}")" == '0:0' ]] || return 1
	fi
}

check() {
	local image="${_pkgname}-${pkgver}-${CARCH}.iso"
	local iso="${srcdir}/${image}"
	local iso_listing="${srcdir}/check-iso-list"
	local squashfs="${srcdir}/check-airootfs.sfs"
	local squashfs_root="${srcdir}/check-squashfs-root"
	local package_root="${srcdir}/check-package-root"
	local image_size
	local pvd_type
	local pvd_magic
	local pvd_version
	local volume_sectors
	local required_path

	printf '%s\n' 'check: ISO size and ISO9660 header'
	image_size="$(stat -Lc '%s' -- "${iso}")" || return 1
	(( image_size > 0 && image_size % 2048 == 0 )) || return 1

	pvd_type="$(od -An -tu1 -j $((16 * 2048)) -N1 -- "${iso}" | tr -d ' ')" || return 1
	pvd_magic="$(dd if="${iso}" bs=1 skip=$((16 * 2048 + 1)) count=5 status=none)" || return 1
	pvd_version="$(od -An -tu1 -j $((16 * 2048 + 6)) -N1 -- "${iso}" | tr -d ' ')" || return 1
	volume_sectors="$(od -An -tu4 -j $((16 * 2048 + 80)) -N4 -- "${iso}" | tr -d ' ')" || return 1

	[[ "${pvd_type}" == '1' ]] || return 1
	[[ "${pvd_magic}" == 'CD001' ]] || return 1
	[[ "${pvd_version}" == '1' ]] || return 1
	(( volume_sectors > 0 && volume_sectors * 2048 == image_size )) || return 1

	printf '%s\n' 'check: file(1) ISO and bootability'
	file -L --brief -- "${iso}" | grep -Fq 'ISO 9660' || return 1
	file -L --brief -- "${iso}" | grep -Fq 'bootable' || return 1

	printf '%s\n' 'check: ISO directory and required Arch files'
	bsdtar -tf "${iso}" > "${iso_listing}" || return 1
	for required_path in \
		"arch/boot/${CARCH}/vmlinuz-linux" \
		"arch/boot/${CARCH}/initramfs-linux.img" \
		"arch/${CARCH}/airootfs.sfs" \
		'EFI/BOOT/BOOTx64.EFI'; do
		grep -Fxq -- "${required_path}" "${iso_listing}" || return 1
	done

	printf '%s\n' 'check: full ISO read'
	# Read every regular file from the ISO so truncated extents or unreadable data fail.
	bsdtar -xOf "${iso}" > /dev/null || return 1

	printf '%s\n' 'check: SquashFS full decompression'
	# The live root filesystem is itself SquashFS. Extracting it forces every
	# compressed block to be decompressed, catching corruption hidden inside a
	# structurally valid and correctly signed ISO.
	bsdtar -xOf "${iso}" "arch/${CARCH}/airootfs.sfs" > "${squashfs}" || return 1
	rm -rf -- "${squashfs_root}"
	unsquashfs -no-xattrs -d "${squashfs_root}" "${squashfs}" > /dev/null || return 1
	[[ -f "${squashfs_root}/usr/lib/os-release" ]] || return 1

	printf '%s\n' 'check: staged package payload'
	rm -rf -- "${package_root}"
	_install_payload "${package_root}"
	_check_payload "${package_root}"
}

package() {
	_install_payload "${pkgdir}"
	_check_payload "${pkgdir}" true
}
