# Maintainer: Rustmilian <#####[at]#####[dot]org>

pkgname=calamares
pkgver=3.2.61
pkgrel=1
pkgdesc='Distribution-independent installer framework'
arch=($CARCH)
license=('GPL')
url="https://calamares.io/"
depends=('kconfig' 'kcoreaddons' 'kiconthemes' 'ki18n' 'kio' 'solid' 'yaml-cpp' 'kpmcore>=4.2.0' 'mkinitcpio-openswap'
         'boost-libs' 'ckbcomp' 'hwinfo' 'qt5-svg' 'polkit-qt5' 'gtk-update-icon-cache' 'plasma-framework'
         'qt5-xmlpatterns' 'squashfs-tools' 'libpwquality' 'efibootmgr' 'icu')
makedepends=('extra-cmake-modules' 'qt5-tools' 'qt5-translations' 'git' 'boost')
backup=('usr/share/calamares/modules/bootloader.conf'
        'usr/share/calamares/modules/displaymanager.conf'
        'usr/share/calamares/modules/initcpio.conf'
        'usr/share/calamares/modules/unpackfs.conf')

source=("$pkgname-$pkgver.tar.gz::https://github.com/calamares/calamares/archive/v$pkgver.tar.gz"
	"calamares.desktop"
	"calamares_polkit"
	"49-nopasswd-calamares.rules"
	"paru-support.patch")

sha256sums=('35fd3f2fed96e444465507bdafee6a982c0f9a6c4c7759e70234d49093743b04'
            '05c4ee3398ebc5168332888f83e49baf9e143641f11873eed14fcd2b6e409a54'
            'c176b28007bd1c1f23d8dbb2c936fa54d0c01bacfb67290ddad597606c129df3'
            '56d85ff6bf860b9559b8c9f997ad9b1002f3fccc782073760eca505e3bddd176'
            'f00c90bd87d6dfd73b3ec53fa9a145ac25234676be41604807f05f05a4bf5bbb')

prepare() {
	cd ${srcdir}/${pkgname}-${pkgver}
	sed -i -e 's/"Install configuration files" OFF/"Install configuration files" ON/' "$srcdir/${pkgname}-${pkgver}/CMakeLists.txt"
	sed -i -e "s|\${CALAMARES_VERSION_MAJOR}.\${CALAMARES_VERSION_MINOR}.\${CALAMARES_VERSION_PATCH}|${_ver}-${pkgrel}|g" CMakeLists.txt
	sed -i -e "s|CALAMARES_VERSION_RC 1|CALAMARES_VERSION_RC 0|g" CMakeLists.txt
	git apply ../paru-support.patch
}

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p build
	cd build
	cmake .. \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DWITH_PYTHONQT=OFF \
	-DWITH_KF5DBus=OFF \
	-DBoost_NO_BOOST_CMAKE=ON \
	-DWEBVIEW_FORCE_WEBKIT=OFF \
	-DSKIP_MODULES="webview tracking interactiveterminal initramfs \
	initramfscfg dracut dracutlukscfg \
	dummyprocess dummypython dummycpp \
	dummypythonqt services-openrc \
	keyboardq localeq welcomeq"
	make
}


package() {
	cd ${pkgname}-${pkgver}/build
	make DESTDIR="$pkgdir" install
	install -Dm644 "${srcdir}/calamares.desktop" "$pkgdir/etc/xdg/autostart/calamares.desktop"
	install -Dm755 "${srcdir}/calamares_polkit" "$pkgdir/usr/bin/calamares_polkit"
	install -Dm644 "${srcdir}/49-nopasswd-calamares.rules" "$pkgdir/etc/polkit-1/rules.d/49-nopasswd-calamares.rules"
	chmod 750 "$pkgdir"/etc/polkit-1/rules.d
}
