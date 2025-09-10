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
pkgver="0.0.6"
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
cat >"ella_sha256_checksums_0.0.6.txt" <<EOF
9aaf88084389f46417094d511e45b77e95d89047b44f06654a82d3fbbe4f1a31  ella_v0.0.6_android_arm64.tar.gz
7d3bfbf70441eb2f12698d7e49869f6b5343470f796e90e9c80bc7c07ec5ddb0  ella_v0.0.6_darwin_amd64.tar.gz
14bbca6c8e6fb56c56bec7067ee3c15b9f111d71d23d985442fb85a953cf611b  ella_v0.0.6_darwin_arm64.tar.gz
58457c2f4da74385829c68e5f08dc7ed5c91fb9209958b51311a6da0f1112624  ella_v0.0.6_freebsd_amd64.tar.gz
1e32d7224aa1d2d924b42b5f319392ea2dffffe4dd83a9ec7ec86596cc43c1c2  ella_v0.0.6_linux_amd64.tar.gz
306753eeb7fb6aa279039695bbdd7dd52bffc7ef2d9adea224269f6f4028003b  ella_v0.0.6_linux_arm.tar.gz
e6e1649f60989606fbc0b50e48f1ba673ed72aef39688279a324713aeb6b6000  ella_v0.0.6_linux_arm64.tar.gz
a219304496325aa62158190ee1d9d0561f887f77f9708712e5d3fcf4aba27ad7  ella_v0.0.6_linux_arm_hf.tar.gz
5783bbc0ddce52df583771a0f5fe87be2948b9475d9f299b07146953ff9b490d  ella_v0.0.6_linux_loong64.tar.gz
df8b073e926eb9cd3f2fe96e64f52a59ad6fa305435c2c06f5c0dc95bf82426e  ella_v0.0.6_linux_mips.tar.gz
c02743cefb6085efbaa7fc8348b23d509193107960f21bea6e9ca503d5956970  ella_v0.0.6_linux_mips64.tar.gz
ea5bacc4f16474801d13d9642c3995b744773888e57a49898e223b4b1fec61cf  ella_v0.0.6_linux_mips64le.tar.gz
ec71c769f89281b319ae0b6742ec4776082d12e1c7d81c74819eeb6317b922c0  ella_v0.0.6_linux_mipsle.tar.gz
a34891537a244d615e9b339c8e5ebf3086c75b78472d8e657b7c7e4d8f5c24e0  ella_v0.0.6_linux_riscv64.tar.gz
75843fb506ba4fcbb7b7835d57817532ca332c4385e1951ffde6222c815df502  ella_v0.0.6_openbsd_amd64.tar.gz
EOF

sha256sums=("$(get_checksum "$pkgver" "$binname")")

package() {
	cd "${srcdir}"
	tar xzvf "${binname}"
	cd "${binname%.tar.gz}"
	./install "$pkgdir" false
}
