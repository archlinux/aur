# Maintainer: Diab Neiroukh <lazerl0rd at thezest dot dev>

pkgname="edk2-ovmf-macos"
pkgver="r74.527588d"
pkgrel=1
epoch=1
arch=("any")
pkgdesc="A collection of EDK II UEFI firmware files with macOS compatibility."
license=("custom")
makedepends=(
	"jshon"
)
conflicts=(
	"edk2-ovmf-macboot-git"
)
url="https://github.com/foxlet/macOS-Simple-KVM"
source=(
	"https://github.com/foxlet/macOS-Simple-KVM/raw/master/firmware/OVMF_CODE.fd"
	"OVMF_VARS.fd::https://github.com/foxlet/macOS-Simple-KVM/raw/master/firmware/OVMF_VARS-1024x768.fd"
)
b2sums=(
	"SKIP"
	"SKIP"
)

pkgver()
{
	# I know I'm crazy, but GitHub API go brrr.
	printf "r%s.%s" "$(($(echo $(curl -s https://api.github.com/repos/$(echo $url | sed 's/https\?:\/\/github.com\///')/compare/a89c93fd0c62c8b4cbc3c2148771675b6064cf99...$(curl -s https://api.github.com/repos/$(echo $url | sed 's/https\?:\/\/github.com\///')/git/refs/heads/master | jshon -e object | jshon -e sha -u)) | jshon -e total_commits)+1))" "$(echo $(curl -s https://api.github.com/repos/$(echo $url | sed 's/https\?:\/\/github.com\///')/git/refs/heads/master | jshon -e object | jshon -e sha -u) | awk '{print substr($1,0,7)}')"
}

package()
{
	install -D -m644 "OVMF_CODE.fd" "$pkgdir/usr/share/edk2-ovmf-macboot/x64/OVMF_CODE.fd"
	install -D -m644 "OVMF_VARS.fd" "$pkgdir/usr/share/edk2-ovmf-macboot/x64/OVMF_VARS.fd"
	ln -s "$pkgdir/usr/share/edk2-ovmf-macboot" "$pkgdir/usr/share/ovmf-macboot"
}
