# Maintainer: Pooyan Khanjankhani <pooyankhan@gmail.com>

if [ -z "$_INC_COMMON" ]; then
	_INC_COMMON=1

	get_latest_version() {
		curl -s https://api.github.com/repos/thekhanj/ella/releases/latest |
			grep '"tag_name":' |
			sed -E 's/.*"v([^"]+)".*/\1/'
	}

	get_checksums() {
		local pkgver="$1"

		local file="ella_sha256_checksums_$pkgver.txt"

		if ! [ -f "$file" ]; then
			curl -sL -o "$file" \
				"https://github.com/thekhanj/ella/releases/download/v${pkgver}/ella_sha256_checksums.txt"
		fi

		cat "$file"
	}

	get_checksum() {
		local pkgver="$1"
		local binname="$2"

		get_checksums "$pkgver" |
			grep "$binname" |
			awk '{ print $1 }'
	}

	get_binnames() {
		local pkgver="$1"

		# don't change the order
		echo "ella_v${pkgver}_linux_amd64.tar.gz"
		echo "ella_v${pkgver}_linux_arm64.tar.gz"
		echo "ella_v${pkgver}_linux_arm_hf.tar.gz"
		echo "ella_v${pkgver}_linux_arm.tar.gz"
		echo "ella_v${pkgver}_linux_loong64.tar.gz"
		echo "ella_v${pkgver}_linux_mips.tar.gz"
		echo "ella_v${pkgver}_linux_mips64.tar.gz"
		echo "ella_v${pkgver}_linux_mips64le.tar.gz"
		echo "ella_v${pkgver}_linux_mipsle.tar.gz"
		echo "ella_v${pkgver}_linux_riscv64.tar.gz"
	}
fi

pkgname=ella
pkgver="0.0.7"
pkgrel=1
pkgdesc="A process manager for running and managing services"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'loong64' 'mips' 'mips64' 'mips64le' 'mipsle' 'riscv64')
url="https://github.com/thekhanj/ella"
license=('MIT')
makedepends=('grep' 'gawk')

_os=$(uname | tr '[:upper:]' '[:lower:]')
_arch=$(uname -m)

mapfile -t binnames <<<"$(get_binnames "$pkgver")"

case "${_os}_${_arch}" in
linux_x86_64) binname="${binnames[0]}" ;;
linux_aarch64) binname="${binnames[1]}" ;;
linux_armv7l) binname="${binnames[2]}" ;;
linux_armv6l) binname="${binnames[3]}" ;;
linux_loong64) binname="${binnames[4]}" ;;
linux_mips) binname="${binnames[5]}" ;;
linux_mips64) binname="${binnames[6]}" ;;
linux_mips64le) binname="${binnames[7]}" ;;
linux_mipsle) binname="${binnames[8]}" ;;
linux_riscv64) binname="${binnames[9]}" ;;
*)
	echo "Unsupported OS/ARCH: ${_os}_${_arch}"
	exit 1
	;;
esac

source=("https://github.com/thekhanj/ella/releases/download/v${pkgver}/${binname}")
cat >"ella_sha256_checksums_0.0.7.txt" <<EOF
ac91b83cb7cca24bbb1acdae22354ec5717ce9a4528f0b6a90e8005e560a03f6  ella_v0.0.7_android_arm64.tar.gz
8745003e139676ebfb14c936130df708ddd72d53eda7d64338433fecffbe586d  ella_v0.0.7_darwin_amd64.tar.gz
d9cd899dd3f50a9905153cab54bd3e579bfc8fa9ecdb2258c0cdbb885c9fbcf0  ella_v0.0.7_darwin_arm64.tar.gz
b541d239dc97cc5b4cfe48b730f9a4abf207c2672c6d665969d2c864196a2988  ella_v0.0.7_freebsd_amd64.tar.gz
e0b50898c8dc57cadcfae6f09355e3895ea9f6c66a1129833c1a44b5802d7744  ella_v0.0.7_linux_amd64.tar.gz
2f36aa5d1ebc687d5e54b21e6c944e8255e85cedcf5ef905ff16fc06858530e7  ella_v0.0.7_linux_arm.tar.gz
d72cdd80e51d17a7e73e036336fb09ff42ab98ee6a6a4d87e0642f92cf30e6ea  ella_v0.0.7_linux_arm64.tar.gz
6bcc45ba149abcf4553b4446016a90d0ad5068983ce2ef5e1f2c615674546bd7  ella_v0.0.7_linux_arm_hf.tar.gz
8b1e1b716cd188944259167cfc6fd97db6cf10c159bc8d123eccbb908fff9a2a  ella_v0.0.7_linux_loong64.tar.gz
050bcaad9748902308783a78246569a1b68f8adea22332975799f936df7ecafc  ella_v0.0.7_linux_mips.tar.gz
caed63a18c168dc674cab5fde817d001f866bbc5086a0b679c1f7a91758f33f4  ella_v0.0.7_linux_mips64.tar.gz
e6b6db284fb3411ec09246e49374688b4d33196c23a4de4125b486e223618c3d  ella_v0.0.7_linux_mips64le.tar.gz
ea6c581d686db6b82bc83e795541299532e91801613b26767fec5f2b097bbada  ella_v0.0.7_linux_mipsle.tar.gz
771961e5801ca8dec5ada4f77393fc64aa3c74849616510d0341ada178d45eb2  ella_v0.0.7_linux_riscv64.tar.gz
8e3721ed6ea118b8d1d9dcd9c0ae426a48297565a4eebd8957e4e523096bc3cd  ella_v0.0.7_openbsd_amd64.tar.gz
EOF

sha256sums=("$(get_checksum "$pkgver" "$binname")")

package() {
	cd "${srcdir}"
	tar xzvf "${binname}"
	cd "${binname%.tar.gz}"
	./install "$pkgdir" false
}
