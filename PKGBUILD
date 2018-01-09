# Maintainer: Pieter Lenaerts <pieter dot aj dot lenaerts gmail>
pkgname=linux-x205ta-sound
pkgver=26
pkgrel=1
_kernver=4.15.0-rc6
_kernel="vmlinuz-${_kernver}-sound-${pkgver}"
_moddir="${_kernver}-sound-${pkgver}"
_kernbase="${_kernver%.*}"
pkgdesc="Pre-built linux kernel with Pierre Bossart's patches to get the ASUS x205ta's Realtek RT5648 sound card working. Binary provided by harryharryharry."
arch=(x86_64)
url="https://ubuntuforums.org/showthread.php?t=2254322&p=13595504#post13595504"
license=('GPL')
depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://x205ta.myftp.org:1337/kernel/kernel-64bit-${_kernver}-sound-${pkgver}.tar")
noextract=()
sha256sums=('be50a4ab4c8a8af50e58371f7d0d14f685d500a37dce418d02a2385fc93a0d53')
validpgpkeys=()

prepare() {
	tar -xf kernel-${_kernver}-sound-${pkgver}.tar.xz
	rm ${srcdir}/lib/modules/${_moddir}/source ${srcdir}/lib/modules/${_moddir}/build
}

package() {
	mkdir -p "${pkgdir}"/{boot,usr/lib/modules,usr/lib/modules/extramodules-${_kernbase}-sound,usr/lib/firmware/brcm}
	cp ${srcdir}/boot/${_kernel} ${pkgdir}/boot/${_kernel}
	cp -r ${srcdir}/lib/modules/${_moddir} ${pkgdir}/usr/lib/modules/
	cp -r ${srcdir}/lib/firmware/brcm/brcmfmac43340-sdio.txt ${pkgdir}/usr/lib/firmware/brcm/

	local _subst="
	s|%KERNEL%|${_kernel}|g
	s|%INITRD%|${_kernel/vmlinuz/initramfs}|g
	s|%KERNVER%|${_moddir}|g
	s|%EXTRAMODULES%|extramodules-${_kernbase}-sound|g
	s|%PKGBASE%|${pkgname}|g
	"

	# install pacman hook
  	sed "${_subst}" ../60-linux.hook |
		install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/60-${pkgname}.hook"
	sed "${_subst}" ../90-linux.hook |
		install -Dm644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgname}.hook"
	# install mkinitcpio preset
	sed "${_subst}" ../linux.preset |
		install -Dm644 /dev/stdin "${pkgdir}/etc/mkinitcpio.d/${pkgname}.preset"
}
