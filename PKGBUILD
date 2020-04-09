# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>

pkgname=messenger-nativefier
pkgdesc="Facebook Messenger built into a desktop app using electron nativefier."
pkgver=1.0
pkgrel=2
arch=('x86_64' 'i686' 'armv7h' 'pentium4')
url="https://messenger.com/"
license=('custom')
depends=('gtk3' 'libxss' 'nss')
makedepends=('imagemagick' 'nodejs-nativefier' 'unzip')
source=("${pkgname}.desktop")
md5sums=('a0b09923587aa0ea868d912fffe5698c')

build() {
    cd $srcdir
#    rm -Rf *

    nativefier \
        -p linux \
        --name "Facebook Messenger" \
        --verbose \
        --single-instance \
        --tray \
        https://messenger.com/
}


package() {
    mkdir -p ${pkgdir}/opt/${pkgname}
    mkdir -p ${pkgdir}/usr/bin/

    _dirname=`ls ${srcdir} | grep "FacebookMessenger"`
    _binary="FacebookMessenger"
    echo "${_dirname} -> ${pkgdir}/opt/${pkgname}"
    cp -Rv ${_dirname}/* ${pkgdir}/opt/${pkgname}/

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  	install -Dm644 "${pkgdir}/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	_iconpath=${_dirname}/resources/app/icon.png

	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    	convert "${_iconpath}" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  	done
    ln -s /opt/${pkgname}/${_binary} ${pkgdir}/usr/bin/${pkgname}
}
