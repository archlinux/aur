# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=ezquake
pkgver=3.1
pkgrel=1
pkgdesc="One of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need the retail pak files to play."
url="http://ezquake.sourceforge.net/"
license=('GPL')
depends=('curl' 'expat' 'jansson' 'libjpeg-turbo' 'libpng' 'openssl' 'sdl2')
makedepends=('unzip' 'vim')
conflicts=('ezquake-git' 'fuhquake')
provides=('quake' 'fuhquake')
arch=('x86_64')
install=ezquake.install
source=("https://github.com/ezQuake/ezquake-source/releases/download/${pkgver}/ezquake-source-${pkgver}.tar.gz"
"https://github.com/ezQuake/ezquake-source/releases/download/${pkgver}/ezquake${pkgver}-linux64-full.tar.gz"
'ezquake.launcher' 'ezquake.desktop' 'ezquake.ico')
noextract=("ezquake${pkgver}-linux64-full.tar.gz")
sha256sums=('3465ba1720173b304ea29a557cee8a165f6d51eec680da0caac9d24f88aa928e'
            '9c3a1ba6e9ebebd05e7e31f126d984d9e9b62803c4869c8ad5e2be1637437690'
            'aa59da4a296a43af8ea8c5670cef5980a15407124b3e53f3cf805ceb6126e6ed'
            'e92b9cdeac5eadced50a6167eb53b1343b0772d3bf8afa310eb281b88bf7e677'
            '2a6a5484ddb4cfaf8518b51df39ffd1fa8ce768402eab6401415bececb8e8ab2')

build() {
    cd "${srcdir}"

    # Compile ezquake
    make
}

package() {
    cd "${srcdir}"

    # Create Destination Directories
    install -d "${pkgdir}/opt/quake"

    # Unpack ezQuake assets package (base)
    bsdtar -x -o -C "${pkgdir}/opt/quake" -f "${srcdir}/ezquake${pkgver}-linux64-full.tar.gz"

    # Clean up permissions in assets package
    find "${pkgdir}/opt/quake" -type d -exec chmod 0755 "{}" \;
    find "${pkgdir}/opt/quake" -type f -exec chmod 0644 "{}" \;

    # Overwrite packaged binary with compiled one
    mv -v "${srcdir}/ezquake-linux-x86_64" \
        "${pkgdir}/opt/quake/"

    # Make id1 Directory for pak0.pak and pak1.pak files
    install -d "${pkgdir}/opt/quake/id1/"

    # Make save game Directory with user group permissions
    install -d -m775 -g users "${pkgdir}/opt/quake/qw/save/"

    # Install Icon
    install -D -m644 "${srcdir}/ezquake.ico" \
        "${pkgdir}/usr/share/pixmaps/ezquake.ico"

    # Install Launcher
    install -D -m755 "${srcdir}/ezquake.launcher" \
        "${pkgdir}/usr/bin/ezquake"

    # Install Desktop
    install -D -m644 "${srcdir}/ezquake.desktop" \
        "${pkgdir}/usr/share/applications/ezquake.desktop"
}

