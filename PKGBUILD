# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-electron
_pkgname=typora
pkgver=1.9.3
_electron=electron27
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
sha512sums_x86_64=('da7714d8a2ef228d1df13bf2a6862f3be3fad51238657e8ee48350380267ecfed29b391e0c66653e3b4322e3dada02d2bea6e1041f5230988358645ea0cf4b28')
sha512sums_aarch64=('6a8623f44884d3ab564518b6c535079607aa97c10ba169447d05291a76d380e3b68cc7268b240d1ac7fd7cb30e64dd8c3752b889ac98c854006cc03e7f14bcb1')
prepare() {
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
