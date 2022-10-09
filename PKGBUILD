# Maintainer: sukanka <su975853527 at gmail.com>
# Contributor: Jonas Bögle <aur@iwr.sh>
# Contributor: Jonathan Duck <duckbrain30@gmail.com>

pkgname=typora-electron
_pkgname=typora
pkgver=1.4.7
_electron=electron
pkgrel=2
pkgdesc="A minimal markdown editor and reader. (Typora with system electron)"
arch=('x86_64')
license=('custom:"Copyright (c) 2015 Abner Lee All Rights Reserved."')
url="https://typora.io/"
provides=('typora')
conflicts=('typora')
depends=('ripgrep' "${_electron}")
optdepends=(
	'noto-fonts-emoji: Or some other emoji font to see emojis'
	'pandoc: Import/export for extra file formats')
_filename="${_pkgname}_${pkgver}_amd64.deb"
source=("${_pkgname}_${pkgver}_amd64.deb::https://typora.io/linux/$_filename"
"${_pkgname}.sh"
)
sha512sums=('fec39383931f0a9a41d2d8bb2d71895200bdadf7d9dedc5bf321ccd626de61a9afc2a476cfd0db028c5382484350a42e00eb3e166c588b960d43d4ccb3c8f277'
            '8280c9d0267149e5c003a11b3be5cdb42718f2dcc56a4e79ab5bdd3a941b5b68e4d40606ba7ba355de8716c2e66622f27520c7f507cdef459fc39a1f304b705b')

prepare(){
	bsdtar -xf data.tar.xz -C "$srcdir/"
	sed -i "s|__ELECTRON__|${_electron}|" ${srcdir}/${_pkgname}.sh
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
