# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=wiznote-electron
_pkgname=wiznote
pkgver=0.1.100
pkgrel=1
pkgdesc='A powerful note-taking tool.'
arch=('any')
url='https://www.wiz.cn/zh-cn'
license=('unknown')
depends=('electron')
makedepends=('asar' 'p7zip')
optdepeds=('net-tools')
provides=("wiznote")
source=("$_pkgname-$pkgver.AppImage::https://get.wiz.cn/x/wiznote-desktop-${pkgver}-linux-x86_64.AppImage"
"${_pkgname}".sh
)
sha256sums=('47159920a70434ecba391f56d8960e56a8c9fbd6860bbb7f1c5a4021581bf3e1'
            'ba433c18cd2c82e234d1921ed125c46d6a8ab6a20688e10181834bdbd5650bb1')

prepare() {
	cd $srcdir

	7z x -aoa $_pkgname-$pkgver.AppImage
	cd resources
	asar e app.asar ${_pkgname}
	cp -rf   assets \
            ${_pkgname}/
	asar p ${_pkgname} app.asar
	rm -rf ${_pkgname} assets/{icons/*,icon.*,*.ts,*.plist}

}

package() {
    install -Dm755 ${_pkgname}.sh    ${pkgdir}/usr/bin/${_pkgname}
    cd $srcdir
    cp -r usr/share ${pkgdir}/usr
    mv resources ${pkgdir}/usr/share/${_pkgname}

    chmod -R 0755 ${pkgdir}/usr/share
    find ${pkgdir}/usr/share -type f -exec chmod a-x {} \;

    install -Dm644 wiznote-desktop.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

    cd ${pkgdir}/usr/share/applications/
    sed -i "s|^Exec=.*|Exec=wiznote %U|g" ${_pkgname}.desktop

}
