# Maintainer: Howard Cheung <mail@h-cheung.cf> 
# Contributor: nl6720 <nl6720@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname='refind-fscrypt-git'
pkgver=0.12.0.r698.gba236d9
pkgrel=1
pkgdesc='rEFInd Boot Manager - git version'
url='https://www.rodsbooks.com/refind/'
arch=('any')
license=('BSD' 'CCPL' 'FDL1.3' 'GPL2' 'GPL3' 'LGPL3')
depends=('bash' 'dosfstools' 'efibootmgr' 'which')
makedepends=('git' 'gnu-efi-libs')
optdepends=('gptfdisk: for finding non-vfat ESP with refind-install'
            'imagemagick: for refind-mkfont'
            'openssl: for generating local certificates with refind-install'
            'preloader-signed: pre-signed Secure Boot shim loader'
            'python: for refind-mkdefault'
            'sudo: for privilege elevation in refind-install and refind-mkdefault'
            'shim-signed: pre-signed Secure Boot shim loader'
            'sbsigntools: for EFI binary signing with refind-install')
conflicts=("refind" "refind-efi" "refind-git")
replaces=('refind-efi-git')
provides=("refind=${pkgver}" "refind-efi=${pkgver}" "refind-git=${pkgver}")
# the drivers don't build with many jobs
options=('!makeflags')
source=('refind::git+https://git.code.sf.net/p/refind/code#branch=master'
         refind-ext4-fscrypt.patch)
sha512sums=('SKIP'
            'a4d10c7ba8450eff3cf8f077c0490cce93c9999adce296973327e2bfde26b80fbd5fd2bd6467bfff0d94a4f2c57dcfc72e1cefa52d2824ee1972c1f8ec6a6f32')
_arch='x64'

pkgver() {
cd "${srcdir}/refind/"
	printf '%s.r%s.g%s' "$(grep -Po 'REFIND_VERSION L"\K[\d.]+' "${srcdir}/refind/include/version.h")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/refind/"
    patch -p1 < ${srcdir}/refind-ext4-fscrypt.patch
	# removing the path prefix from the css reference, so that the css can live in the same directory
	sed -e 's|../Styles/||g' -i "docs/refind/"*.html
	# hardcode RefindDir, so that refind-install can find refind_x64.efi
	sed -e 's|RefindDir=\"\$ThisDir/refind\"|RefindDir="/usr/share/refind/"|g' -i refind-install
}

build() {
	cd "${srcdir}/refind/"
	make
	make gptsync
	make fs
}

package() {
	cd "${srcdir}/refind/"
	# the install target calls refind-install, therefore we install things manually

	# efi binaries
	install -vDm 0644 refind/*.efi -t "${pkgdir}/usr/share/refind"
	install -vDm 0644 drivers_*/*.efi -t "${pkgdir}/usr/share/refind/drivers_${_arch}"
	install -vDm 0644 gptsync/*.efi -t "${pkgdir}/usr/share/refind/tools_${_arch}"
	# sample config
	install -vDm 0644 "refind.conf-sample" -t "${pkgdir}/usr/share/refind"
	# keys
	install -vDm 0644 keys/*{cer,crt} -t "${pkgdir}/usr/share/refind/keys"
	# keysdir
	install -vdm 0700 "${pkgdir}/etc/refind.d/keys"
	# fonts
	install -vDm 0644 fonts/*.png -t "${pkgdir}/usr/share/${pkgname}/fonts"
	# icons
	install -vDm 0644 icons/*.png -t "${pkgdir}/usr/share/refind/icons"
	install -vDm 0644 icons/svg/*.svg -t "${pkgdir}/usr/share/refind/icons/svg"
	# scripts
	install -vDm 0755 {refind-{install,mkdefault},mkrlconf,mvrefind} -t "${pkgdir}/usr/bin"
	install -vDm 0755 fonts/mkfont.sh "${pkgdir}/usr/bin/refind-mkfont"
	# man pages
	install -vDm 0644 docs/man/*.8 -t "${pkgdir}/usr/share/man/man8"
	# docs
	install -vDm 0644 {CREDITS,NEWS,README}.txt -t "${pkgdir}/usr/share/doc/refind"
	install -vDm 0644 fonts/README.txt "${pkgdir}/usr/share/doc/refind/README.refind-mkfont.txt"
	install -vDm 0644 icons/README "${pkgdir}/usr/share/doc/refind/README.icons.txt"
	install -vDm 0644 keys/README.txt "${pkgdir}/usr/share/doc/refind/README.keys.txt"
	install -vDm 0644 "docs/refind/"*.{html,png,svg,txt} -t "${pkgdir}/usr/share/doc/refind/html"
	install -vDm 0644 docs/Styles/*.css -t "${pkgdir}/usr/share/doc/refind/html"
	# license
	install -vDm 0644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}


