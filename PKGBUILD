# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-electron
_pkgname=typora
pkgver=1.7.5
_electron=electron
pkgrel=1
pkgdesc="A minimal markdown editor and reader. (Typora with system electron)"
arch=('x86_64' 'aarch64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typora.io"
provides=('typora')
conflicts=('typora')
depends=('ripgrep' "${_electron}")
makedepends=('asar')
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats')
source=("typora.sh")
source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::${url}/linux/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_arm64.deb::${url}/linux/${_pkgname}_${pkgver}_arm64.deb")
sha512sums=('0fac707616e055158d4a84a80554db1b4c76e44604de74f1e0726955d7b45e0ec5560cd5c3994b97d24d9f7f2a1bdc9a1af50a4fbc70aa22076d19079910c304')
sha512sums_x86_64=('35627c94a4f3d11952b3c35d8818832db7ebaf6d3fe534fbdf3f07b67f90ed11b8a128a80a1e898c128a4a568196ee6501eb2e3075a2668a35438903d35b17cb')
sha512sums_aarch64=('ccc37e7fe312a92d59f77b4eb718b3fcacbf62faa90345491551397a0449bf7dce1f4026a5625a44ada211bba16b452b6604b55afdbd3deb2cc82994386a852e')
prepare(){
	bsdtar -xf data.tar.xz -C "$srcdir/"
	sed -i "s|__ELECTRON__|${_electron}|" ${srcdir}/${_pkgname}.sh
	cd $srcdir/usr/share/typora/resources/
	# we do not need rg binary
	asar e node_modules.asar nm
	rm -rf nm/vscode-ripgrep/bin
	asar p nm node_modules.asar
	rm -rf nm
}

package() {
	cd $srcdir
	cp -rf usr ${pkgdir}
	install -Dm644 "$pkgdir/usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	mkdir -p ${pkgdir}/usr/lib/typora
	mv ${pkgdir}/usr/share/typora/resources/* ${pkgdir}/usr/lib/typora
	install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
	ln -sf /usr/bin/rg ${pkgdir}/usr/lib/${_pkgname}/node_modules/vscode-ripgrep/bin/rg

	rm -rf ${pkgdir}/usr/share/{doc,lintian,typora}

}
