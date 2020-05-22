# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=ezquake
pkgver=3.2
pkgrel=1
pkgdesc="One of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need the retail pak files to play."
url="http://ezquake.sourceforge.net/"
license=('GPL')
depends=('curl' 'expat' 'jansson' 'libjpeg-turbo' 'libpng' 'openssl' 'sdl2' 'speex')
makedepends=('unzip' 'vim')
conflicts=('ezquake-git' 'fuhquake')
provides=('quake' 'fuhquake')
arch=('x86_64')
install=ezquake.install
source=("https://github.com/ezQuake/ezquake-source/archive/${pkgver}.tar.gz"
"https://github.com/ezQuake/ezquake-source/releases/download/${pkgver}/ezquake-ubuntu-full-${pkgver}.tar.gz"
'ezquake.launcher' 'ezquake.desktop' 'ezquake.ico')
noextract=("ezquake-ubuntu-full-${pkgver}.tar.gz")
sha256sums=('801151d540706106cbd26da7266aa5e330842b8cccbc5acd4bc8d5a73db3515d'
            '6977480a374e531341dec82ccabf3f1443c674959f0e959b7a4c9a63cc2e06c5'
            'aa59da4a296a43af8ea8c5670cef5980a15407124b3e53f3cf805ceb6126e6ed'
            'e92b9cdeac5eadced50a6167eb53b1343b0772d3bf8afa310eb281b88bf7e677'
            '2a6a5484ddb4cfaf8518b51df39ffd1fa8ce768402eab6401415bececb8e8ab2')

build() {
    cd "${srcdir}/ezquake-source-${pkgver}/"

    # Compile ezquake
    make
}

package() {
    cd "${srcdir}"

    # Create Destination Directories
    install -d "${pkgdir}/opt/quake"

    # Unpack ezQuake assets package (base)
    bsdtar -x -o -C "${pkgdir}/opt/quake" -f "${srcdir}/ezquake-ubuntu-full-${pkgver}.tar.gz"

    # Clean up permissions in assets package
    find "${pkgdir}/opt/quake" -type d -exec chmod 0755 "{}" \;
    find "${pkgdir}/opt/quake" -type f -exec chmod 0644 "{}" \;

    # Overwrite packaged binary with compiled one
    mv -v "${srcdir}/ezquake-source-${pkgver}/ezquake-linux-x86_64" \
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

