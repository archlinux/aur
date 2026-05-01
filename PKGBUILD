# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-electron
_pkgname=typora
pkgver=1.13.4
_pkgver_arm=${pkgver}
_electron=electron35
pkgrel=1
pkgdesc="A minimal markdown editor and reader. (Typora with system electron)"
arch=('x86_64' 'aarch64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typora.io"
provides=('typora')
conflicts=('typora')
depends=('ripgrep' "${_electron}")
makedepends=('asar' 'gcc')
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats')
source=("typora.sh" "snapshot-hook.c")
source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::${url}/linux/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_arm64.deb::${url}/linux/${_pkgname}_${_pkgver_arm}_arm64.deb")
sha512sums=('c11484732b80f1f5cd4d78675e44d3ac8653d6ab4319e9920ca3c92d93ba52fb7c5ba7f5ec30f593ff4daad1f9ce9e55655796a85de9537462510f30679f9153'
            '0b4e8874e1507bfb4d19ae9320ca27236daeffd6e22dd31c9a34cc9ea09da358b9655ec1d4890177fdff598da1cc6acb5dd78ac8f44211cff076e9a1d1d26ef2')
sha512sums_x86_64=('5471ee6e18482b1ec25b259cdb1926252715db75175e08c506deaad0baf1ee833b9cfd7f1225acad3e0e8db350b154b300e78107d4b634ee31fb183f0b96a520')
sha512sums_aarch64=('d889c9beb726f5bd46b588800b32cc64224259fc3412df758dd4f225b0b87bad057927bebf14651ed20b939df81e8ebd266ea36d89b32a0868ef704a766236dc')
prepare() {
	bsdtar -xf data.tar.zst -C "$srcdir/"
	sed -i "s|__ELECTRON__|${_electron}|" ${srcdir}/${_pkgname}.sh
	sed -i "s|__ELECTRON__|${_electron}|" ${srcdir}/snapshot-hook.c
	cd $srcdir/usr/share/typora/resources/
	# we do not need rg binary
	asar e node_modules.asar nm
	rm -rf nm/vscode-ripgrep/bin
	asar p nm node_modules.asar
	rm -rf nm
}
build() {
	gcc -shared -fPIC -O2 -o snapshot-hook.so snapshot-hook.c -ldl
}

package() {
	cd $srcdir
	cp -rf usr ${pkgdir}
	install -Dm644 "$pkgdir/usr/share/doc/$_pkgname/copyright" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	mkdir -p ${pkgdir}/usr/lib/typora
	mv ${pkgdir}/usr/share/typora/resources/* ${pkgdir}/usr/lib/typora
	mv ${pkgdir}/usr/share/typora/*.bin ${pkgdir}/usr/lib/typora/
	install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
	install -Dm755 ${srcdir}/snapshot-hook.so ${pkgdir}/usr/lib/typora/snapshot-hook.so
	ln -sf /usr/bin/rg ${pkgdir}/usr/lib/${_pkgname}/node_modules/vscode-ripgrep/bin/rg

	rm -rf ${pkgdir}/usr/share/{doc,lintian,typora}

}
