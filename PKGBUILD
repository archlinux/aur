# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=scratch-desktop
pkgver=3.29.1
pkgrel=1
pkgdesc="Create and share your own interactive stories, games, music and art"
url="https://scratch.mit.edu"
arch=('x86_64')
license=('GPL')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2'
         'snappy')
makedepends=('electron19')
options=(!strip)
source=("scratch.exe::https://downloads.scratch.mit.edu/desktop/Scratch%20Setup.exe"
        'https://scratch.mit.edu/images/download/icon.png'
        'scratch-desktop.desktop'
        'x-scratch.xml'
)
sha256sums=('dfca2f1a842aea69a2b0a22ca66fa7852f86259e3da4f576f8ae7fa16f1e9134'
            '5efbe1a31e973d0393631e0317f68f81d213b6c55434b9f9185a47554f23ed99'
            '73d4f255aee28b9f72764a55e8711d07826e037ec624d23c8f7e7764c10475d5'
            '1090a96c91f7a47801633e077717b730d636f53bac7f8958c9fc9595ee5dba7e')

package() {
    cd "$srcdir"

    # Install electron
    install -d ${pkgdir}/usr/lib/${pkgname}
    cp -r /usr/lib/electron19/* ${pkgdir}/usr/lib/${pkgname}
    rm -f ${pkgdir}/usr/lib/${pkgname}/resources/default_app.asar

    # Create symlink for command
    install -d ${pkgdir}/usr/bin
    ln -fs electron ${pkgdir}/usr/lib/${pkgname}/scratch-desktop
    ln -fs /usr/lib/${pkgname}/scratch-desktop ${pkgdir}/usr/bin/scratch-desktop

    # Install desktop file
    install -Dm644 scratch-desktop.desktop -t ${pkgdir}/usr/share/applications/
    install -Dm644 icon.png ${pkgdir}/usr/share/pixmaps/scratch-desktop.png

    # app.asar and static
    cd resources
    rm -f elevate.exe
    find . -type d -exec install -d {,"$pkgdir"/usr/lib/${pkgname}/resources/}{} \;
    find . -type f -exec install -D {,"$pkgdir"/usr/lib/${pkgname}/resources/}{} \;

    # Mimetype
    install -Dm644 static/assets/0fb9be3e8397c983338cb71dc84d0b25.svg ${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/scratch-sprite.svg
    install -Dm644 ${srcdir}/x-scratch.xml -t ${pkgdir}/usr/share/mime/packages/
}
