# Maintainer: Naej dLdL <hansi.archlinux@gmail.com>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them
#
_qt5_enable=        # build GUI components using Qt5 instead of Qt4
_gnome_backend=     # add support for Gnome's libsecret secure storage of passwords
_kde_backend=       # add support for KDE's secure storage of passwords
#
### Do not edit below this line unless you know what you're doing

pkgname=cryfs-gui-git
_pkgname=cryfs-gui
pkgver=1.2.05g4ae9a31
pkgrel=1
pkgdesc="A Qt/C++ front end to EncFS and CryFS (edit PKGBUILD to customize install options)"
arch=('i686' 'x86_64')
url="https://github.com/mhogomchungu/cryfs-gui"
license=('LGPL3')
makedepends=('cmake' 'make')
provides=('cryfs-gui')
conflicts=('cryfs-gui')

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

source=("${_pkgname}"::"git://github.com/mhogomchungu/${_pkgname}.git")
sha256sums=(SKIP)

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed 's/-//g'
}

prepare() {
    #echo "${depends[@]}"
	cd "${srcdir}/${_pkgname}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE \
	        -DQT5=${_qt5} -DNOSECRETSUPPORT=${_gnome} -DNOKDESUPPORT=${_kde}
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
