# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-electron
_pkgname=typora
pkgver=1.10.7
_pkgver_arm=1.10.6
_electron=electron32
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
source_aarch64=("${_pkgname}_${pkgver}_arm64.deb::${url}/linux/${_pkgname}_${_pkgver_arm}_arm64.deb")
sha512sums=('0fac707616e055158d4a84a80554db1b4c76e44604de74f1e0726955d7b45e0ec5560cd5c3994b97d24d9f7f2a1bdc9a1af50a4fbc70aa22076d19079910c304')
sha512sums_x86_64=('917d1c52edb0833e9eb5336587dcb49fcdeff2aac9fb720c1be6d9893ca47c3fcd59d0e4f390e058a216032ac7168c27fce4fa621c35453b4805b594be2506de')
sha512sums_aarch64=('e583d11fc9f6504104d74252cd169ebd29f6849e9e8ac7dbce6da9c5bc915fc07fc1c7e6582dbc6c9b3fe19a66c0c3a09cf6eb89fa5b7a64fe0585883fc55660')
prepare() {
	bsdtar -xf data.tar.zst -C "$srcdir/"
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
