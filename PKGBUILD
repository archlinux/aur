# Maintainer: David P. <megver83@openmailbox.org>
# Contributor: artoo <artoo@manjaro.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=sddm

pkgname=sddm-elogind
pkgver=0.14.0
pkgrel=6
pkgdesc='QML based X11 display manager'
arch=('i686' 'x86_64')
url='http://github.com/sddm/sddm'
license=('GPL')
provides=('display-manager' 'sddm')
depends=('qt5-declarative' 'elogind' 'upower-nosystemd' 'qt5-base-nosystemd')
makedepends=('extra-cmake-modules' 'python-docutils' 'qt5-tools')
optdepends=('displaymanager-openrc: displaymanager initscript')
conflicts=('display-manager' 'sddm' 'sddm-consolekit')
# replaces=('sddm-consolekit')
install="${_pkgname}.install"
backup=('usr/share/sddm/scripts/Xsetup'
        'etc/pam.d/sddm'
        'etc/sddm.conf')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
        "sddm-fix-avatars.patch::https://github.com/sddm/sddm/commit/ecb903e4.patch"
        'sddm-pam.patch'
        'sddm-enable-elogind.patch')
sha256sums=('a551551a6ba324e9c384c89bc63e871de65fea3740eadbea2d63df86045f8205'
            'b091f02d6d5b2ddc9d5208b17213a181c6e8deae23e5633d694119e79b66d38b'
            '151b9b4a16b919a4f3a6564b2cd794effdc07773c47f2d6b860bbd467c3e4798'
            'cff3f483415c95784d6b9977c31b89fac734d0d74facc4ac042ed8de970d5007')

prepare() {
	mkdir -p build
	cd ${_pkgname}-${pkgver}
	patch -p1 -i ${srcdir}/sddm-pam.patch
	patch -p1 -i ${srcdir}/sddm-enable-elogind.patch
}

build() {
	cd build
	cmake ../${_pkgname}-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DENABLE_PAM=yes \
		-DNO_SYSTEMD=yes \
		-DUSE_ELOGIND=yes \
		-DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
		-DDBUS_CONFIG_FILENAME=org.freedesktop.sddm.conf \
		-DBUILD_MAN_PAGES=ON
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
