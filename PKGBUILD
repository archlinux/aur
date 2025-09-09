# Maintainer: Pooyan Khanjankhani <pooyankhan@gmail.com>

latest() {
	curl -s https://api.github.com/repos/thekhanj/ella/releases/latest |
		grep '"tag_name":' |
		sed -E 's/.*"v([^"]+)".*/\1/'
}

pkgname=ella
pkgver=$(latest)
pkgrel=1
pkgdesc="A process manager for running and managing services"
arch=('x86_64' 'aarch64' 'armv7h' 'armv6h' 'loong64' 'mips' 'mips64' 'mips64le' 'mipsle' 'riscv64')
url="https://github.com/thekhanj/ella"
license=('MIT')
makedepends=('curl' 'grep' 'sed' 'awk')

_os=$(uname | tr '[:upper:]' '[:lower:]')
_arch=$(uname -m)

case "${_os}_${_arch}" in
linux_x86_64) binname="ella_v${pkgver}_linux_amd64.tar.gz" ;;
linux_aarch64) binname="ella_v${pkgver}_linux_arm64.tar.gz" ;;
linux_armv7l) binname="ella_v${pkgver}_linux_arm_hf.tar.gz" ;;
linux_armv6l) binname="ella_v${pkgver}_linux_arm.tar.gz" ;;
linux_loong64) binname="ella_v${pkgver}_linux_loong64.tar.gz" ;;
linux_mips) binname="ella_v${pkgver}_linux_mips.tar.gz" ;;
linux_mips64) binname="ella_v${pkgver}_linux_mips64.tar.gz" ;;
linux_mips64le) binname="ella_v${pkgver}_linux_mips64le.tar.gz" ;;
linux_mipsle) binname="ella_v${pkgver}_linux_mipsle.tar.gz" ;;
linux_riscv64) binname="ella_v${pkgver}_linux_riscv64.tar.gz" ;;
*)
	echo "Unsupported OS/ARCH: ${_os}_${_arch}"
	exit 1
	;;
esac

get_checksum() {
	curl -sL "https://github.com/thekhanj/ella/releases/download/v${pkgver}/ella_sha256_checksums.txt" |
		grep "$binname" |
		awk '{ print $1 }'
}

source=("https://github.com/thekhanj/ella/releases/download/v${pkgver}/${binname}")
sha256sums=("$(get_checksum)")

package() {
	cd "${srcdir}"
	tar xzvf "${binname}"
	cd "${binname%.tar.gz}"
	./install "$pkgdir" false
}
