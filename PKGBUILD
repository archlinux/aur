# Maintainer: Jaime Martínez Rincón <jaime(at)jamezrin(dot)name>

pkgname=s3uploader
pkgver=0.2.0
pkgrel=1.4
pkgdesc="A minimalistic electron-based UI to conveniently upload and download files from AWS S3"
url="https://github.com/Yamazaki93/S3Uploader"
arch=("x86_64")
license=('MIT')
depends=()
makedepends=('yarn' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}" 
        's3uploader.desktop')
md5sums=('SKIP'
         '325771ca30f8474c170941c77aa91280')
noextract=()
validpgpkeys=()

prepare() {
    # it might be good to use the users cache
    # yarn config set cache-folder "${srcdir}/.yarn-cache" 

    # contain global packages somewhere else
    yarn config set prefix "${srcdir}/.yarn"

    yarn global add @angular/cli electron-builder
}

build() {
    cd ${srcdir}/${pkgname}

    yarn
    yarn run build-prod

    cd app/frontend
    yarn
    yarn ng config -g cli.warnings.versionMismatch false
    yarn ng build --prod --aot=false --build-optimizer=false
    
    cd ../..
    mkdir -p dist/frontend
    cp -ar app/frontend/dist dist/frontend/dist

    yarn electron-builder --linux
}

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/opt/${pkgname}/icons"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons"

    cp -r "${srcdir}/${pkgname}/dist-electron/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}/dist-electron/.icon-set/"* "${pkgdir}/opt/${pkgname}/icons"
    install -Dm644 "${srcdir}/${pkgname}/dist-electron/.icon-set/icon_512.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
    ln -s "/opt/${pkgname}/s3uploader" "${pkgdir}/usr/bin/${pkgname}"
}
