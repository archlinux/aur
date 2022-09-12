# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=sanguosha
pkgver=1.0.8
pkgrel=1
pkgdesc="SanGuoSha Online (三国杀)"
url="https://www.sanguosha.com"
arch=('x86_64')
license=('GPL')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2'
         'snappy')
makedepends=('electron13' 'imagemagick')
source=("SGSOL_SetUp.exe::https://olh5download.sanguosha.com/olh5/wd/win/official/SGSOL_SetUp.exe?v=$pkgver"
        'icon.jpeg::https://soft.jiegeng.com/uploadfile/2021/0922/20210922015254825.jpeg'
        'sanguosha.desktop'
)
sha256sums=('e5ea9b748dc6bdf474b853eff812398e5725c51ff906b8ef66cfccad7acbc7ff'
            '82149708816bd2314c207b5dd4af24e268febdf197a1ee709231ce95134f3c72'
            '56ff518ef3ec397f2208b3e4dbcb4f67f533e7b0d6d121b24a5e974013925e58')
noextract=('SGSOL_SetUp.exe')

build() {
    7z x SGSOL_SetUp.exe '$PLUGINSDIR/app-64.7z'
    7z x './$PLUGINSDIR/app-64.7z' 'resources*'
    convert icon.jpeg icon.png
}

package() {
    # Install electron
    install -d ${pkgdir}/usr/lib/${pkgname}
    cp -r /usr/lib/electron13/* ${pkgdir}/usr/lib/${pkgname}
    rm -f ${pkgdir}/usr/lib/${pkgname}/resources/default_app.asar

    # Create symlink for command
    install -d ${pkgdir}/usr/bin
    ln -fs electron ${pkgdir}/usr/lib/${pkgname}/${pkgname}
    ln -fs /usr/lib/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

    # Install desktop file
    install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
    install -Dm644 sanguosha.desktop -t ${pkgdir}/usr/share/applications/

    # copy app.asar and other resource files
    cd resources
    find . -name "*.exe" -o -name "*.dll" -exec rm -f {} \;
    find . -type d -exec install -d {,"$pkgdir"/usr/lib/${pkgname}/resources/}{} \;
    find . -type f -exec install -D {,"$pkgdir"/usr/lib/${pkgname}/resources/}{} \;
}
