# Maintainer: Christian Holme (Nordwin) <hcmh [at] mailbox [dot] org>
pkgname=systemrescue-systemd-boot
pkgver="12.01"
pkgrel=1
pkgdesc="SystemRescue as systemd-boot loader entry"
url="https://www.system-rescue.org/"
arch=('x86_64')
license=(GPL)
depends=(systemd)
options=('!debug')
backup=("boot/loader/entries/systemrescue.conf")
source=(
	https://fastly-cdn.system-rescue.org/releases/"${pkgver}"/systemrescue-"${pkgver}"-amd64.iso
	systemrescue.conf
)
noextract=(systemrescue-"${pkgver}"-amd64.iso)

sha256sums=('bee16490622c07fb628b8051acd0b2882b5b575dd7abd62e6c8df282b4fd0ed1'
            '83a8ed42eb5f31cab9e02823c8789394bbfba75872c1ed2d6575eb9f9cb7463f')

prepare() {
  cd "${srcdir}"
  bsdtar xf systemrescue-"${pkgver}"-amd64.iso \
	sysresccd/boot/x86_64/vmlinuz \
	sysresccd/boot/x86_64/sysresccd.img \
	sysresccd/boot/amd_ucode.img \
	sysresccd/boot/intel_ucode.img \
	sysresccd/x86_64/airootfs.sfs
}

package() {
  install -d ${pkgdir}/boot/systemrescue
  cp "${srcdir}"/sysresccd/boot/x86_64/vmlinuz "${pkgdir}"/boot/systemrescue/vmlinuz
  cp "${srcdir}"/sysresccd/boot/x86_64/sysresccd.img "${pkgdir}"/boot/systemrescue/sysresccd.img
  cp "${srcdir}"/sysresccd/boot/amd_ucode.img "${pkgdir}"/boot/systemrescue/amd_ucode.img
  cp "${srcdir}"/sysresccd/boot/intel_ucode.img "${pkgdir}"/boot/systemrescue/intel_ucode.img
  install -d ${pkgdir}/boot/systemrescue/x86_64
  cp "${srcdir}"/sysresccd/x86_64/airootfs.sfs "${pkgdir}"/boot/systemrescue/x86_64/airootfs.sfs
  install -d -m 755 "${pkgdir}"/boot/loader/entries
  cp systemrescue.conf "${pkgdir}"/boot/loader/entries/systemrescue.conf
}
