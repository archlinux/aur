# Maintainer: Matteo Salonia <saloniamatteo@protonmail.com>

pkgname=artix-silence-grub-theme-git
_pkgname=arch-silence
pkgver=1.1
pkgrel=1
pkgdesc="Artix Silence: Grub Theme, Fork of arch-silence"
arch=('any')
url="https://github.com/fghibellini/arch-silence"
license=('GPL')
depends=('grub')
makedepends=('git')
conflicts=("arch-silence-grub-theme-git")
provides=("artix-silence-grub-theme")
install="artix-grub-theme.install"
md5sums=(
	'SKIP' # git repo
	'8ff2e03bd8f2d97278bfa91b3a91e470' # artix logo
)

source=(
	"git+https://github.com/fghibellini/arch-silence"
	"artix-logo.png"
)

pkgver() {
  cd "${_pkgname}"
  _pkgver=$(awk '/VERSION/ {print $3}' config.mk|head -1)
  echo "${_pkgver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	# Replace Arch logo with Artix logo
	mv artix-logo.png "$srcdir/arch-silence/theme/arch_logo.png"

	# Check if using doas or sudo
	[ $(which doas) ] && rootcmd="doas" || rootcmd="sudo"

	# Delete old theme directory
	$rootcmd rm -rf /boot/grub/themes/arch-silence
}

package() {
	# Check if using doas or sudo
	[ $(which doas) ] && rootcmd="doas" || rootcmd="sudo"

	$rootcmd cp -TR "$srcdir/arch-silence/theme" /boot/grub/themes/arch-silence
	$rootcmd grub-mkconfig -o /boot/grub/grub.cfg
}
