# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=ezquake
pkgver=3.0
pkgrel=1
pkgdesc="One of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need the retail pak files to play."
url="http://ezquake.sourceforge.net/"
license=('GPL')
depends=('curl' 'expat' 'jansson' 'libjpeg-turbo' 'libpng' 'openssl' 'sdl2')
makedepends=('unzip')
conflicts=('fuhquake')
provides=('quake' 'fuhquake')
arch=('x86_64')
install=ezquake.install
source=("https://github.com/ezQuake/ezquake-source/archive/v${pkgver}.tar.gz"
"https://github.com/ezQuake/ezquake-source/releases/download/v3.0/ezquake_linux64_${pkgver}-full.tar.gz"
'ezquake.launcher' 'ezquake.desktop' 'ezquake.ico')
noextract=("ezquake_linux64_${pkgver}-full.tar.gz")
sha256sums=('825ffbdb5a2aaea321350a500af488ca9d842423e6798b252966b89b83ad59f2'
            '5ac53c8317eb878dbb3ac33da8fa6572f02aee3302ac0fab03e7f1cdf3d4575f'
            'bc512722c0143139a8dad77beac3ef260f00bc20e7f36e083cdd5870e71a90b6'
            'e92b9cdeac5eadced50a6167eb53b1343b0772d3bf8afa310eb281b88bf7e677'
            '2a6a5484ddb4cfaf8518b51df39ffd1fa8ce768402eab6401415bececb8e8ab2')

build() {
    cd "${srcdir}/ezquake-source-${pkgver}"

    # Compile ezquake
    make
}

package() {
    cd "${srcdir}"

    # Create Destination Directories
    install -d "${pkgdir}/opt/quake"

    # Unpack ezQuake assets package
    bsdtar -x -o -C "${pkgdir}/opt/quake" -f "${srcdir}/ezquake_linux64_${pkgver}-full.tar.gz"

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

