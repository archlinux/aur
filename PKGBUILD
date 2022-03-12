# Maintainer: Sukanka <su975853527 [AT] gmail.com>


pkgname=yank-note-bin
_pkgname=yank-note
pkgver=3.26.0
pkgrel=1
pkgdesc='A Hackable Markdown Note Application for Programmers.'
arch=('x86_64')
url='https://github.com/purocean/yn'
license=('AGPL3')
depends=('electron' 'pandoc')
makedepends=('asar' 'yarn')
source=("$_pkgname-$pkgver.deb::${url}/releases/download/v${pkgver}/Yank-Note-linux-amd64-${pkgver}.deb"
        "$_pkgname.sh"
        )
sha256sums=('0f7c05f4a1ce3bb303c7c10593402fd9c1901c50ccd7abdc656fef54fc025714'
            'ea47e7cea0b74bf9a0f96a853432a49ddfdba61017b68dcae47d1e4862327409')
options=(!strip)
prepare() {
	cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
    cd "$srcdir/opt/Yank Note/resources"
    asar e app.asar apps 
    rm -rf apps/app.asar
    cd apps/dist/main
    sed -i "63c var binPath='/usr/bin/pandoc';" server/convert.js
    sed -i "39c exports.BIN_DIR='/usr/bin';" constant.js
    
    cd $srcdir/usr/share/applications
    sed -i "3c Exec=yank-note %U"   ${_pkgname}.desktop
}

build(){
    cd "$srcdir/opt/Yank Note/resources"
    cd apps
    rm -rf bin
    # fix node-pty
    yarn add electron-rebuild
    node_modules/.bin/electron-rebuild -f -w node-pty -v $(electron -v)
    cp -rf node_modules/node-pty ./
    yarn remove electron-rebuild
    rm -rf node_modules/node-pty
    mv node-pty node_modules
    ln -s ./Release node_modules/node-pty/build/Debug
    
    rm -rf yarn.lock
    cd ../app.asar.unpacked
    rm -rf bin  
}

package(){
    cp -rf $srcdir/usr ${pkgdir}
    install -Dm755 "$_pkgname.sh" ${pkgdir}/usr/bin/${_pkgname}
    cd "$srcdir/opt/Yank Note/resources"
    mkdir -p ${pkgdir}/usr/lib/${_pkgname}/
    cp -rf apps ${pkgdir}/usr/lib/${_pkgname}/app
    cp -rf app.asar.unpacked ${pkgdir}/usr/lib/${_pkgname}/app.asar.unpacked
}
