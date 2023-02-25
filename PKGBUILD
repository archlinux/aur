# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname='refind-git'
pkgver=0.13.3.7.r832.gcce5cdc
pkgrel=1
pkgdesc='rEFInd Boot Manager - git version'
url='https://www.rodsbooks.com/refind/'
arch=('any')
license=('BSD' 'CCPL' 'FDL1.3' 'GPL2' 'GPL3' 'LGPL3')
depends=('bash' 'dosfstools' 'efibootmgr')
makedepends=('git' 'gnu-efi-libs')
optdepends=('gptfdisk: for finding non-vfat ESP with refind-install'
            'imagemagick: for refind-mkfont'
            'mokutil: for Machine Owner Key enrollment'
            'openssl: for generating local certificates with refind-install'
            'preloader-signed: pre-signed Secure Boot shim loader'
            'python: for refind-mkdefault'
            'sbsigntools: for EFI binary signing with refind-install'
            'sudo: for privilege elevation in refind-install and refind-mkdefault'
            'shim-signed: pre-signed Secure Boot shim loader'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
# the drivers don't build with many jobs
options=('!makeflags')
source=('refind::git+https://git.code.sf.net/p/refind/code#branch=master')
sha512sums=('SKIP')
_arch='x64'

pkgver() {
	cd "${srcdir}/${pkgname%-git}/"
	printf '%s.r%s.g%s' "$(grep -Po 'REFIND_VERSION L"\K[\d.]+' "${srcdir}/${pkgname%-git}/include/version.h")" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname%-git}/"
	# remove the path prefix from the css reference, so that the css can live in the same directory
	sed -e 's|../Styles/||g' -i "docs/${pkgname%-git}/"*.html
	# hardcode RefindDir, so that refind-install can find refind_x64.efi
	sed -e 's|RefindDir=\"\$ThisDir/refind\"|RefindDir="/usr/share/refind/"|g' -i refind-install
	# add vendor line to the sbat file
	printf 'refind.%s,%s,%s,refind,%s,%s\n' 'arch' '1' 'Arch Linux' "${epoch:+${epoch}:}${pkgver}-${pkgrel}" 'https://aur.archlinux.org/packages/refind-git' >> refind-sbat.csv
}

build() {
	cd "${srcdir}/${pkgname%-git}/"
	make
	make gptsync
	make fs
}

package() {
	cd "${srcdir}/${pkgname%-git}/"
	# the install target calls refind-install, therefore we install things manually

	# efi binaries
	install -vDm 0644 refind/*"${_arch}.efi" -t "${pkgdir}/usr/share/${pkgname%-git}"
	install -vDm 0644 "drivers_${_arch}/"*"${_arch}.efi" -t "${pkgdir}/usr/share/${pkgname%-git}/drivers_${_arch}"
	install -vDm 0644 gptsync/*"${_arch}.efi" -t "${pkgdir}/usr/share/${pkgname%-git}/tools_${_arch}"
	# sample config
	install -vDm 0644 "${pkgname%-git}.conf-sample" -t "${pkgdir}/usr/share/${pkgname%-git}"
	# keys
	install -vDm 0644 keys/*{cer,crt} -t "${pkgdir}/usr/share/${pkgname%-git}/keys"
	# keysdir
	install -vdm 0700 "${pkgdir}/etc/refind.d/keys"
	# fonts
	install -vDm 0644 fonts/*.png -t "${pkgdir}/usr/share/${pkgname%-git}/fonts"
	# icons
	install -vDm 0644 icons/*.png -t "${pkgdir}/usr/share/${pkgname%-git}/icons"
	install -vDm 0644 icons/svg/*.svg -t "${pkgdir}/usr/share/${pkgname%-git}/icons/svg"
	# scripts
	install -vDm 0755 {refind-{install,mkdefault},mkrlconf,mvrefind} -t "${pkgdir}/usr/bin"
	install -vDm 0755 fonts/mkfont.sh "${pkgdir}/usr/bin/${pkgname%-git}-mkfont"
	# man pages
	install -vDm 0644 docs/man/*.8 -t "${pkgdir}/usr/share/man/man8"
	# docs
	install -vDm 0644 {CREDITS,NEWS,README}.txt -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
	install -vDm 0644 fonts/README.txt "${pkgdir}/usr/share/doc/${pkgname%-git}/README.${pkgname%-git}-mkfont.txt"
	install -vDm 0644 icons/README "${pkgdir}/usr/share/doc/${pkgname%-git}/README.icons.txt"
	install -vDm 0644 keys/README.txt "${pkgdir}/usr/share/doc/${pkgname%-git}/README.keys.txt"
	install -vDm 0644 "docs/${pkgname%-git}/"*.{html,png,svg,txt} -t "${pkgdir}/usr/share/doc/${pkgname%-git}/html"
	install -vDm 0644 docs/Styles/*.css -t "${pkgdir}/usr/share/doc/${pkgname%-git}/html"
	# license
	install -vDm 0644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
