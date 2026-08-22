# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-electron
_pkgname=typora
pkgver=1.14.9
_pkgver_arm=${pkgver}
_electron=electron42
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
	'8a06bf42024d77b427ac74a922dd74da7249f02eeb73d1f37e11fde0d8536e03fa8feb260e01ba61e8e4ce794f5aae1196726f75b53a81ccf263e480a7915c01')
sha512sums_x86_64=('075db5be472077b4c8f898b2995a6d47c2b932482a1536badf417db4bdc51edfef50083a18e2f2b9eda741c90fad2b1796e92f2826ec9ab03d543931916237c4')
sha512sums_aarch64=('4471a428eeb839d34bd096d84db6a235a05122da53b1a9ac01147d5efc893f1fd78240f4fcee053ed1d766292069801e33d4043aac3396e2e8837943e97bfa1d')
prepare() {
	bsdtar -xf data.tar.zst -C "$srcdir/"
	sed -i "s|__ELECTRON__|${_electron}|" ${srcdir}/${_pkgname}.sh
	sed -i "s|__ELECTRON__|${_electron}|" ${srcdir}/snapshot-hook.c
	cd $srcdir/usr/share/typora/resources/
	# Refresh version-dependent V8 bytecode header fields at runtime.
	asar e app.asar app
	sed -i 's|dummyBytecode.slice(12,16).copy(e,12)|dummyBytecode.slice(4,8).copy(e,4),dummyBytecode.slice(12,20).copy(e,12)|' app/launch.dist.js
	grep -Fq 'dummyBytecode.slice(12,20).copy(e,12)' app/launch.dist.js
	asar p app app.asar
	rm -rf app
	# we do not need rg binary
	asar e node_modules.asar nm
	rm -rf nm/vscode-ripgrep/bin
	asar p nm node_modules.asar
	rm -rf nm
}
build() {
	gcc ${CFLAGS} ${CPPFLAGS} -shared -fPIC -o snapshot-hook.so snapshot-hook.c ${LDFLAGS} -ldl
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
