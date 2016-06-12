# Maintainer: Naej dLdL <hansi.archlinux@gmail.com>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them
#
_qt5_enable=        # build GUI components using Qt5 instead of Qt4
_gnome_backend=     # add support for Gnome's libsecret secure storage of passwords
_kde_backend=       # add support for KDE's secure storage of passwords
#
### Do not edit below this line unless you know what you're doing

pkgname=cryfs-gui
pkgver=1.2.0
pkgrel=1
pkgdesc="A Qt/C++ front end to EncFS and CryFS (edit PKGBUILD to customize install options)"
arch=('i686' 'x86_64')
url="https://github.com/mhogomchungu/cryfs-gui"
license=('LGPL3')
makedepends=('cmake' 'make')
provides=('cryfs-gui')
conflicts=('cryfs-gui-git')

depends=('cryfs' 'libgcrypt' 'pkg-config')

if [ -n "${_qt5_enable}" ]
then
    depends+=('qt5-base')
    _qt5=true
else
    depends+=('qt4')
    _qt5=false
fi

if [ -n "${_gnome_backend}" ]
then
    depends+=('libsecret')
    _gnome=false
else
    _gnome=true
fi

if [ -n "${_kde_backend}" ];
then
    depends+=('kdeutils')
    _kde=false
else
    _kde=true
fi

source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/mhogomchungu/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=("082352ffb6ea6b7c88abeb4012f905033e177dbf4bb64b33a85fa9e57c7c2bf5")


prepare() {
    #echo "${depends[@]}"
	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE \
	        -DQT5=${_qt5} -DNOSECRETSUPPORT=${_gnome} -DNOKDESUPPORT=${_kde}
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
