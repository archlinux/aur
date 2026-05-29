# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-electron
_pkgname=typora
pkgver=1.13.6
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
sha512sums_x86_64=('a4b92a800731dee9186bcb3ddacbc2c3c99b66c4bec3c905dc80f945eb8900cf88bc0169077bca4660f2d4ea27562099e31093f0782ad1a849b9f4ebbf4de162')
sha512sums_aarch64=('b10a85fcbdfe89a0e2fc260d06005b60e298fc8f5513e60575d685ef8a679e73d3d90776f17dac03e0a716a05e0ae06bfa69af39a35f19aec910289db4bdfbe7')
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
