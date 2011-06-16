# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=ezquake
pkgver=2.1
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
source=("http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_linux32_${pkgver}.tar.gz" \
'ezquake.launcher' 'ezquake.desktop' 'ezquake.ico')
md5sums=('e238c2c0985a96598bd26a6ee116bee3'
         'bad99b7adc7c238f1df2fc4973c00ae6'
         '75cfa823bf495fe4cdb755c6b5546f2a'
         'b3fd62bf6f56f139257544cab74ba71e')
noextract=("ezquake_linux32_${pkgver}.tar.gz")

if [ $CARCH = 'x86_64' ]; then
    source[0]="http://downloads.sourceforge.net/sourceforge/ezquake/ezquake_linux64_${pkgver}.tar.gz"
    md5sums[0]='00dc037b8f0442ae816025ef88c06c5e'
    noextract=("ezquake_linux64_${pkgver}.tar.gz")
fi

build() {
    cd ${srcdir}

    # Make Destination Directories
    install -d ${pkgdir}/opt/quake

    # Unpack ezQuake
    if [ $CARCH = 'x86_64' ]; then
        bsdtar -x -o -C ${pkgdir}/opt/quake -f ${srcdir}/ezquake_linux64_${pkgver}.tar.gz
    else
        bsdtar -x -o -C ${pkgdir}/opt/quake -f ${srcdir}/ezquake_linux32_${pkgver}.tar.gz
    fi

    # Make id1 Directory for pak0.pak and pak1.pak files
    install -d ${pkgdir}/opt/quake/id1/

    # Make save game Directory with user group permissions
    install -d -m775 -g users ${pkgdir}/opt/quake/qw/save/

    # Install Icon
    install -D -m644 ${srcdir}/ezquake.ico \
        ${pkgdir}/usr/share/pixmaps/ezquake.ico

    # Install Launcher
    install -D -m755 ${srcdir}/ezquake.launcher \
        ${pkgdir}/usr/bin/ezquake

    # Install Desktop
    install -D -m644 ${srcdir}/ezquake.desktop \
        ${pkgdir}/usr/share/applications/ezquake.desktop
}
