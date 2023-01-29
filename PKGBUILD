# Maintainer: Sukanka <su975853527 [AT] gmail.com>
pkgname=yank-note-bin
_pkgname=yank-note
_electron=electron
pkgver=3.48.2
pkgrel=2
pkgdesc='A Hackable Markdown Note Application for Programmers.'
arch=('x86_64' 'aarch64')
url='https://github.com/purocean/yn'
license=('AGPL3')
provides=("${_pkgname}")
depends=(${_electron} 'pandoc')
makedepends=('asar' 'yarn' 'jq' 'moreutils' 'node-gyp' 'git')
source=("$_pkgname.sh")
source_x86_64=("$_pkgname-$pkgver-amd64.deb::${url}/releases/download/v${pkgver}/Yank-Note-linux-amd64-${pkgver}.deb")
source_aarch64=("$_pkgname-$pkgver-aarch64.deb::${url}/releases/download/v${pkgver}/Yank-Note-linux-arm64-${pkgver}.deb")
sha256sums=('e12bac7e9f11a03487dea56fb1ac7afb4b2e7eedcc8e7eb1427b2c960cb830de')
sha256sums_x86_64=('ec0bcefb69e2ad35a9ab1548eb953a85ccb51435780d100be6957a465f2ddd1a')
sha256sums_aarch64=('9d7e5e8a24face3039a86cd5259fd1b24a902f2795b318a5529bd501e5c7137d')
options=(!strip)
prepare() {
	cd ${srcdir}
    tar -Jxvf data.tar.xz -C "${srcdir}"
    cd "$srcdir/opt/Yank Note/resources"
    asar e app.asar apps
    rm -rf apps/app.asar
    cd apps/dist/main
    # system pandoc
    sed -i "s|^var binPath.*|var binPath='/usr/bin/pandoc';|g" server/convert.js
    sed -i "s|^exports.BIN_DIR.*|exports.BIN_DIR='/usr/bin';|g" constant.js
    # disable autoupdate checker.
    sed -i "s|^var disabled.*|var disabled = true;|g" updater.js

    cd $srcdir/usr/share/applications
    sed -i "s|^Exec.*|Exec=yank-note %U|g"   ${_pkgname}.desktop

    sed -i "s|ELECTRON|${_electron}|g" $srcdir/"$_pkgname.sh"
}

build(){
    cd "$srcdir/opt/Yank Note/resources"
    cd apps
    rm -rf bin
    export HOME=$srcdir
    # fix node-pty
    yarn add electron-rebuild
    node_modules/.bin/electron-rebuild -f -w node-pty -v $(${_electron} -v)
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
}
