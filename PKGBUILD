# Maintainer: Kenny Strawn <Kenny[dot]Strawn[at]gmail[dot]com>

pkgname=calamares-git
pkgver=3.2.55.r9930.c70deed13
pkgrel=1
pkgdesc='Distribution-independent installer framework (development version)'
arch=('i686' 'x86_64')
license=(GPL)
url="https://github.com/calamares/calamares"
license=('LGPL')
conflicts=('calamares' 'calamares-dev')
provides=('calamares' 'calamares-dev')
replaces=('calamares-dev')
depends=('kconfig' 'kcoreaddons' 'kiconthemes' 'ki18n' 'kio' 'solid' 'yaml-cpp' 'kpmcore>=4.1.0' 'mkinitcpio-openswap'
         'boost-libs' 'ckbcomp' 'hwinfo' 'qt5-svg' 'polkit-qt5' 'gtk-update-icon-cache' 'plasma-framework'
         'qt5-xmlpatterns' 'squashfs-tools' 'libpwquality' 'appstream-qt') # 'pythonqt>=3.2')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-translations' 'git' 'boost')
# backup=('usr/share/calamares/modules/bootloader.conf'
#         'usr/share/calamares/modules/displaymanager.conf'
#         'usr/share/calamares/modules/initcpio.conf'
#         'usr/share/calamares/modules/unpackfs.conf')

source=(
	"git+https://github.com/calamares/calamares.git"
	"yay-support.patch"
)
sha256sums=(
	'SKIP'
	'SKIP'
)

pkgver() {
	cd ${srcdir}/calamares
	_ver="$(cat CMakeLists.txt | grep -m3 -e "  VERSION" | grep -o "[[:digit:]]*" | xargs | sed s'/ /./g')"
	_git=".r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf '%s%s' "${_ver}" "${_git}"
	sed -i -e "s|\${CALAMARES_VERSION_MAJOR}.\${CALAMARES_VERSION_MINOR}.\${CALAMARES_VERSION_PATCH}|${_ver}${_git}|g" CMakeLists.txt
	sed -i -e "s|CALAMARES_VERSION_RC 1|CALAMARES_VERSION_RC 0|g" CMakeLists.txt
#	sed -i -e "s|default|manjaro|g" src/branding/CMakeLists.txt
	rm -rf ${srcdir}/calamares/.git
}

prepare() {
	cd ${srcdir}/calamares
	sed -i -e 's/"Install configuration files" OFF/"Install configuration files" ON/' CMakeLists.txt

	git apply ../yay-support.patch
}


build() {
	cd ${srcdir}/calamares

	mkdir -p build
	cd build
        cmake .. \
              -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DCMAKE_INSTALL_LIBDIR=lib \
              -DWITH_PYTHONQT:BOOL=ON \
              -DBoost_NO_BOOST_CMAKE=ON \
              -DSKIP_MODULES="webview interactiveterminal initramfs \
                              initramfscfg dracut dracutlukscfg \
                              dummyprocess dummypython dummycpp \
                              dummypythonqt services-openrc"
        make
}

package() {
	cd ${srcdir}/calamares/build
	make DESTDIR="$pkgdir" install

	# rename services-systemd back to services
	mv "$pkgdir/usr/lib/calamares/modules/services-systemd" "$pkgdir/usr/lib/calamares/modules/services"
	mv "$pkgdir/usr/share/calamares/modules/services-systemd.conf" "$pkgdir/usr/share/calamares/modules/services.conf"
	sed -i -e 's/-systemd//' "$pkgdir/usr/lib/calamares/modules/services/module.desc"
	sed -i -e 's/-systemd//' "$pkgdir/usr/share/calamares/settings.conf"
}
