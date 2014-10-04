# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=ezquake
pkgver=2.2
pkgrel=1
pkgdesc="One of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need the retail pak files to play."
url="http://ezquake.sourceforge.net/"
license=('GPL')
depends=('libgl' 'libxxf86dga')
makedepends=('unzip')
conflicts=('fuhquake')
provides=('quake' 'fuhquake')
arch=('i686' 'x86_64')
install=ezquake.install
source=("http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_linux64_${pkgver}.tar.gz"
'http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_linux64_2.1.tar.gz'
'ezquake.launcher' 'ezquake.desktop' 'ezquake.ico')
noextract=("ezquake_linux64_${pkgver}.tar.gz" 'ezquake_linux64_2.1.tar.gz')
sha256sums=('b7735c680403678955f7d04a51265d216fb787fbdb343628b69418bfdb5c7203'
            'b3f2de84bd71904895910be9be621cd5462cf689007e9a5e8a6ed3acdfa8b981'
            'b5099392cc02ac0b4a7f073542b7e240b78842c36ac8d0921bbb85a1221e5d45'
            'e92b9cdeac5eadced50a6167eb53b1343b0772d3bf8afa310eb281b88bf7e677'
            '2a6a5484ddb4cfaf8518b51df39ffd1fa8ce768402eab6401415bececb8e8ab2')

if [ $CARCH = 'i686' ]; then
    source[0]="http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_linux32_${pkgver}.tar.gz"
    source[1]='http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_linux32_2.1.tar.gz'
    md5sums[0]='655e8ec60c619ab5d1435882436296b88fc279c2963f01dd277f34939336c067'
    md5sums[1]='bf322d27ae182258ca2d9083ccaa26eda12efe52b075583d327353b87e702310'
    noextract=("ezquake_linux32_${pkgver}.tar.gz" 'ezquake_linux32_2.1.tar.gz')
fi

package() {
    cd "${srcdir}"

    # Create Destination Directories
    install -d "${pkgdir}/opt/quake"

    # Unpack ezQuake
    if [ $CARCH = 'x86_64' ]; then
        bsdtar -x -o -C "${pkgdir}/opt/quake" -f "${srcdir}/ezquake_linux64_2.1.tar.gz"
        bsdtar -x -o -C "${pkgdir}/opt/quake" -f "${srcdir}/ezquake_linux64_${pkgver}.tar.gz"
    else
        bsdtar -x -o -C "${pkgdir}/opt/quake" -f "${srcdir}/ezquake_linux32_2.1.tar.gz"
        bsdtar -x -o -C "${pkgdir}/opt/quake" -f "${srcdir}/ezquake_linux32_${pkgver}.tar.gz"
    fi

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

