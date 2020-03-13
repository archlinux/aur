# Maintainer: weearc <qby19981121@gmail.com>

pkgname=electron-markdownify
pkgver=git
pkgrel=1
pkgdesc="A minimal Markdown Editor desktop app built on top of Electron."
arch=('any')
url="https://github.com/amitmerchant1990/electron-markdownify"
license=('MIT')
depends=(
  'electron4'
)
makedepends=(
  'git'
  'yarn'
)
source=("${pkgname}::git+https://github.com/amitmerchant1990/electron-markdownify.git")
sha256sums=('SKIP')


prepare() {
    cd ${srcdir}/
    cd ${pkgname}/
    yarn
    yarn add electron-builder -D
    mkdir build && cp app/img/markdownify.icns build/icon.icns
    cp app/img/markdownify.ico build/$pkgname.png
}

build(){
    cd ${srcdir}/${pkgname}
    ./node_modules/.bin/electron-builder --dir
}


package() {
    install -d ${pkgdir}/opt
	install -d ${pkgdir}/usr/bin
	install -d ${pkgdir}/usr/share/icons
	install -d ${pkgdir}/usr/share/applications
	
	echo "#!/bin/bash
electron4 /opt/$pkgname/app.asar \$@" > ${pkgdir}/usr/bin/$pkgname && chmod a+x ${pkgdir}/usr/bin/$pkgname


    echo "[Desktop Entry]
Name=Electron Markdownify
GenericName=Markdown Editor
Exec=${pkgname} %U
Icon=${pkgname}
Type=Application
StartupNotify=true
Categories=Office;WordProcessor;
MimeType=text/markdown;text/x-markdown;" > ${pkgdir}/usr/share/applications/${pkgname}.desktop
    
    install -Dm644 ${srcdir}/$pkgname/dist/linux-unpacked/resources/app.asar  ${pkgdir}/opt/${pkgname}/app.asar
    
    for i in 16 22 24 32 36 48 64 72 96 128 256
	do
        mkdir -p ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps
        install -Dm644  ${srcdir}/$pkgname/build/$pkgname.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/$pkgname.png
    done

}
