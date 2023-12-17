# Maintainer: Rustmilian <#####[at]#####[dot]org>

pkgname=('calamares' 'calamares-qt5')
pkgver=3.3.0
pkgrel=3
pkgdesc='Distribution-independent installer framework'
arch=($CARCH)
license=('CC-BY-4.0' 'CC0-1.0' 'GPL-3.0-or-later' 'LGPL-2.1-only' 'LGPL-3.0-or-later' 'MIT' 'BSD-2-Clause')
url="https://github.com/calamares/calamares/"
depends=()
makedepends+=('extra-cmake-modules' 'git')

backup=('usr/share/calamares/modules/bootloader.conf'
        'usr/share/calamares/modules/displaymanager.conf'
        'usr/share/calamares/modules/initcpio.conf'
        'usr/share/calamares/modules/unpackfs.conf')

source=("$pkgname-$pkgver.tar.gz::https://github.com/calamares/calamares/archive/v$pkgver.tar.gz"
	"calamares.desktop"
	"calamares_polkit"
	"49-nopasswd-calamares.rules"
	"paru-support.patch")

sha256sums=('252f0097e3191ffc557b022f34ef23d24b939f1141efd483db0ab1ee9dc0fb76'
            'b9e65ab87f69b2d3f8f8eaea60c78625aef57dd336314ab75389f31a447445be'
            'c176b28007bd1c1f23d8dbb2c936fa54d0c01bacfb67290ddad597606c129df3'
            '56d85ff6bf860b9559b8c9f997ad9b1002f3fccc782073760eca505e3bddd176'
            'f00c90bd87d6dfd73b3ec53fa9a145ac25234676be41604807f05f05a4bf5bbb')

prepare() {
	# Check for pkgname to determine make dependencies
	if [[ $pkgname == 'calamares' ]]; then
		makedepends+=('qt6-tools' 'qt6-translations')
	elif [[ $pkgname == 'calamares-qt5' ]]; then
		makedepends+=('qt5-tools' 'qt5-translations')
	fi


	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i 's/"Install configuration files" OFF/"Install configuration files" ON/' "${srcdir}/${pkgname}-${pkgver}/CMakeLists.txt"
	sed -i "s|\${CALAMARES_VERSION_MAJOR}.\${CALAMARES_VERSION_MINOR}.\${CALAMARES_VERSION_PATCH}|${pkgver}-${pkgrel}|g" CMakeLists.txt
	sed -i "s|CALAMARES_VERSION_RC 1|CALAMARES_VERSION_RC 0|g" CMakeLists.txt
	git apply --verbose ../paru-support.patch

	# Non-standard
	# Check for qmake6 and handle Qt version
	if command -v qmake6 &> /dev/null; then
		qtversion=$(qmake6 -query QT_VERSION | cut -d. -f1-2)
		if [[ "$(echo "${qtversion} >= 6.6" | bc -l)" -eq 1 ]]; then
			echo "Qt version is greater than or equal to 6.6.0"
			if ls ./qt6-base/qt6-base-*.pkg.tar.zst 1> /dev/null 2>&1; then
				echo "qt6-base already exists"
				cd qt6-base || exit
				echo -e "\e[1;32mUpdate qt6-base? (y/n) :\e[0m\c"
				read -p " " input
				if [ "$input" = "y" ]; then
					git pull
					export MAKEFLAGS+="-DFEATURE_no_direct_extern_access=OFF"
					makepkg -sif
				else
					makepkg -si
				fi
			else
				git clone https://gitlab.archlinux.org/archlinux/packaging/packages/qt6-base.git
				cd qt6-base || exit
				export MAKEFLAGS+="-DFEATURE_no_direct_extern_access=OFF"
				makepkg -si
			fi
		else
			echo "Qt6 found but version is less than 6.6.0"
			exit 1
		fi
	else
		qt=5
		echo "qmake6 command not found. Qt5 fallback will be used."
	fi
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	cd build || exit
	cmake .. \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DWITH_QT${qt}=on \
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


package_calamares() {
	depends=('kconfig>=5.246' 'kcoreaddons>=5.246' 'kiconthemes>=5.246' 'ki18n>=5.246' 'kio>=5.246' 'solid>=5.246' 'yaml-cpp' 'kpmcore>=24.01.75' 'mkinitcpio-openswap'
		'ckbcomp' 'hwinfo' 'qt6-base>=6.6.0' 'qt6-svg>=6.6.0' 'polkit-qt6>=0.175.0' 'gtk-update-icon-cache'
		'squashfs-tools' 'libpwquality' 'efibootmgr' 'icu')

	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="$pkgdir" install
	install -Dm644 "${srcdir}/calamares.desktop" "$pkgdir/etc/xdg/autostart/calamares.desktop"
	install -Dm755 "${srcdir}/calamares_polkit" "$pkgdir/usr/bin/calamares_polkit"
	install -Dm644 "${srcdir}/49-nopasswd-calamares.rules" "$pkgdir/etc/polkit-1/rules.d/49-nopasswd-calamares.rules"
	chmod 750 "$pkgdir"/etc/polkit-1/rules.d
}

package_calamares-qt5() {
	depends=('kconfig5>=5.113.0' 'kcoreaddons5>=5.113.0' 'kiconthemes5>=5.113.0' 'ki18n5>=5.113.0' 'kio5>=5.113.0' 'solid5>=5.113.0' 'yaml-cpp' 'kpmcore>=24.01.75' 'mkinitcpio-openswap'
		'ckbcomp' 'hwinfo' 'qt5-base>=5.15.11' 'qt5-svg>=5.15.11' 'polkit-qt5>=0.175.0' 'gtk-update-icon-cache' 'plasma-framework5>=5.58'
		'qt5-xmlpatterns' 'squashfs-tools' 'libpwquality' 'efibootmgr' 'icu')

	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="$pkgdir" install
	install -Dm644 "${srcdir}/calamares.desktop" "$pkgdir/etc/xdg/autostart/calamares.desktop"
	install -Dm755 "${srcdir}/calamares_polkit" "$pkgdir/usr/bin/calamares_polkit"
	install -Dm644 "${srcdir}/49-nopasswd-calamares.rules" "$pkgdir/etc/polkit-1/rules.d/49-nopasswd-calamares.rules"
	chmod 750 "$pkgdir"/etc/polkit-1/rules.d
}

