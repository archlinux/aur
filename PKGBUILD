# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
pkgname=firestorm-bin
pkgver=4.2.2.29837
pkgrel=2
pkgdesc="Second Life is a 3-D virtual world entirely built and owned by its residents. Firestorm is alternative viewer for secondlife (native 32bit)"
url="http://www.phoenixviewer.com/"
license=('GPL')
depends=('openal' 'gnome-vfs' 'gtk2' 'libpng' 'dbus-glib' 'libidn' 'sdl' 'mesa')
optdepends=('gstreamer0.10: For video support - may need good, bad and ugly plugins')
[ "$CARCH" = "x86_64" ] && depends=('lib32-gtk2' 'lib32-libpng' 'lib32-openal' 'lib32-dbus-glib' 'lib32-gnome-vfs' 'lib32-libidn' 'lib32-sdl' 'lib32-mesa')
[ "$CARCH" = "x86_64" ] && optdepends=('lib32-nvidia-utils: GL support for NVIDIA drivers')
arch=('i686' 'x86_64')
install=firestorm.install
source=("http://downloads.phoenixviewer.com/Linux/Phoenix_Firestorm-Release_i686_${pkgver}.tar.bz2" 'firestorm.install' 'firestorm.desktop' 'firestorm.launcher')
sha256sums=('67143f779073671d4c7b61a02bb492d84dce31f0c8b235959e9d36bd74efd8bf'
            'cd919be5e2d28ff86e9b51ffe1076ba8c13acf9c0953fc2f4bb78fe7e79cdbb3'
            '6dffebc474fd98d23bf8d9f4a7592795642dbddf3a0b585f89d25ff11ae15cc1'
            'b2ce32d268f76f4324807d50c4098a3480b489ec447133ce8d9b9c4a7bc05530')

package() {
    cd "${srcdir}"

    # Rename Data Directory
    mv Phoenix_Firestorm-Release_i686_${pkgver}/ firestorm

    # Fix fontconfig >= 2.9.0 issue
    ln -si libfontconfig.so.1.4.4 firestorm/lib/libfontconfig.so.1

    # Install Desktop File
    install -D -m644 "${srcdir}"/firestorm.desktop \
        "${pkgdir}"/usr/share/applications/firestorm.desktop

    # Install Icon File
    install -D -m644 "${srcdir}"/firestorm/firestorm_icon.png \
        "${pkgdir}"/usr/share/pixmaps/firestorm_icon.png

    # Install Launcher
    install -D -m755 "${srcdir}"/firestorm.launcher \
        "${pkgdir}"/usr/bin/firestorm

    # Move Data to Destination Directory
    install -d "${pkgdir}"/opt/
    mv firestorm/ "${pkgdir}"/opt/

    # Change Permissions of files to root:games
    chown -R root:games "${pkgdir}"/opt/firestorm
    chmod -R g+r "${pkgdir}"/opt/firestorm

    # Make Binary Group-Executable
    chmod g+x "${pkgdir}"/opt/firestorm/firestorm
}
