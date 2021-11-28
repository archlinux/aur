# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=sanguosha
pkgver=1.0.6
pkgrel=1
pkgdesc="SanGuoSha Online (三国杀)"
url="https://www.sanguosha.com"
arch=('x86_64')
license=('GPL')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libnghttp2'
         'libxslt' 'minizip' 'nss' 're2' 'snappy')
makedepends=('electron10' 'imagemagick')
source=('https://olh5download.sanguosha.com/olh5/wd/win/official/SGSOL_SetUp.exe'
        'icon.jpeg::https://soft.jiegeng.com/uploadfile/2021/0922/20210922015254825.jpeg'
        'sanguosha.desktop'
)
sha256sums=('dd3f74fcea667c9489cd48e7fee2c358f5743bdb7b3d34aaf1f23361c568be2c'
            '82149708816bd2314c207b5dd4af24e268febdf197a1ee709231ce95134f3c72'
            '56ff518ef3ec397f2208b3e4dbcb4f67f533e7b0d6d121b24a5e974013925e58')

build() {
    7z e SGSOL_SetUp.exe
    7z x app-64.7z
    chmod 755 locales resources swiftshader
    cp -rf /usr/lib/electron10/* .
    rm $srcdir/*.dll
    rm $srcdir/*.exe
    ln -fsr electron sanguosha
    convert icon.jpeg icon.png
}

package() {
    install -d ${pkgdir}/usr/lib/sanguosha
    cp -r locales/ resources/ swiftshader/ ${pkgdir}/usr/lib/sanguosha
    rm -f ${pkgdir}/usr/lib/sanguosha/resources/{default_app.asar,elevate.exe}
    cp lib* ${pkgdir}/usr/lib/sanguosha
    cp *.pak *.bin *.dat *.json ${pkgdir}/usr/lib/sanguosha
    cp chrome-sandbox electron version ${pkgdir}/usr/lib/sanguosha
    ln -sf electron ${pkgdir}/usr/lib/sanguosha/sanguosha

    install -d ${pkgdir}/usr/share/licenses/sanguosha
    cp LICENSE* ${pkgdir}/usr/share/licenses/sanguosha

    install -d ${pkgdir}/usr/bin
    ln -sf /usr/lib/sanguosha/sanguosha ${pkgdir}/usr/bin/sanguosha

    install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/sanguosha.png
    install -Dm644 sanguosha.desktop ${pkgdir}/usr/share/applications/sanguosha.desktop
}
