# Maintainer: Rustmilian Rustmilian@proton.me

pkgname=(
	'calamares'
	'calamares-qt5'
	)

pkgver=3.3.1
pkgrel=1
pkgdesc='Distribution-independent installer framework'
arch=($CARCH)
url="https://github.com/calamares/calamares"

license=(
	'BSD-2-Clause'
	'CC-BY-4.0'
	'CC0-1.0'
	'GPL-3.0-or-later'
	'LGPL-2.1-only'
	'LGPL-3.0-or-later'
	'MIT'
	)

depends=(
	'ckbcomp'
	'efibootmgr'
	'gtk-update-icon-cache'
	'hwinfo'
	'icu'
	'kpmcore>=24.01.75'
	'libpwquality'
	'mkinitcpio-openswap'
	'squashfs-tools'
	'yaml-cpp'
	)

makedepends=(
	'extra-cmake-modules'
	'git'
	)

backup=(
	'usr/share/calamares/modules/bootloader.conf'
	'usr/share/calamares/modules/displaymanager.conf'
	'usr/share/calamares/modules/initcpio.conf'
	'usr/share/calamares/modules/unpackfs.conf'
	)

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"calamares.desktop"
	"calamares_polkit"
	"49-nopasswd-calamares.rules"
	"paru-support.patch"
	"flag.patch"
	)

sha256sums=(
	'af95c65d78236f67ea7181bce16483a863e304d53a2fab8403a3a9cb7544f86c'
	'b9e65ab87f69b2d3f8f8eaea60c78625aef57dd336314ab75389f31a447445be'
	'c176b28007bd1c1f23d8dbb2c936fa54d0c01bacfb67290ddad597606c129df3'
	'56d85ff6bf860b9559b8c9f997ad9b1002f3fccc782073760eca505e3bddd176'
	'f00c90bd87d6dfd73b3ec53fa9a145ac25234676be41604807f05f05a4bf5bbb'
	'0830c8fe57c94a63ef87b6a025eb729b4f098a9e46e729b63415f4d3a2755762'
	)

prepare() {
	makedepends() {
	if [[ $pkgname == 'calamares' ]]; then
		makedepends+=('qt6-tools' 'qt6-translations')
	elif [[ $pkgname == 'calamares-qt5' ]]; then
		makedepends+=('qt5-tools' 'qt5-translations')
	fi
	handle_qt_version
	}

	handle_qt_version() {
	if [[ $pkgname == 'calamares' ]]; then
		qt=6
		handle_qt6_base
	elif [[ $pkgname == 'calamares-qt5' ]]; then
		qt=5
	fi
	cd "${srcdir}/${pkgname}-${pkgver}" || return
		sed -i 's/"Install configuration files" OFF/"Install configuration files" ON/' "${srcdir}/${pkgname}-${pkgver}/CMakeLists.txt"
		sed -i "s|\${CALAMARES_VERSION_MAJOR}.\${CALAMARES_VERSION_MINOR}.\${CALAMARES_VERSION_PATCH}|${pkgver}-${pkgrel}|g" CMakeLists.txt
		sed -i "s|CALAMARES_VERSION_RC 1|CALAMARES_VERSION_RC 0|g" CMakeLists.txt
		git apply --verbose ../paru-support.patch
	}

##	Non-standard ##
	handle_qt6_base() {
	if ls ./qt6-base/qt6-base-*.pkg.tar.zst 1> /dev/null 2>&1; then
		echo "qt6-base already exists"
		update_qt6_base
	else
		clone_and_build_qt6_base
	fi
	}

	update_qt6_base() {
		cd qt6-base || exit
		echo -e "\e[1;32mUpdate qt6-base? (y/n) : \e[0m\c"
		read -r input
	if [ "$input" = "y" ]; then
		git pull
		git apply --verbose ../flag.patch
		makepkg -sif
	else
		makepkg -si
	fi
	}

	clone_and_build_qt6_base() {
		git clone https://gitlab.archlinux.org/archlinux/packaging/packages/qt6-base.git
		cd qt6-base || exit
		git apply --verbose ../flag.patch
		makepkg -si
	}
##	Non-standard ##

	# Call the function to start the process
	makedepends

}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}" || return
	mkdir -p build
	cd build || return
	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DWITH_QT"${qt}"=ON \
		-DWITH_PYTHONQT=OFF \
		-DWITH_KF5DBus=OFF \
		-DBoost_NO_BOOST_CMAKE=ON \
		-DWEBVIEW_FORCE_WEBKIT=OFF \
		-DSKIP_MODULES="webview \
						tracking \
						interactiveterminal \
						initramfs \
						initramfscfg \
						dracut \
						dracutlukscfg \
						dummyprocess \
						dummypython \
						dummycpp \
						dummypythonqt \
						services-openrc \
						keyboardq \
						localeq \
						welcomeq"
	make
}

package_calamares() {
	depends=(
		'kconfig>=5.246'
		'kcoreaddons>=5.246'
		'ki18n>=5.246'
		'kiconthemes>=5.246'
		'kio>=5.246'
		'polkit-qt6>=0.175.0'
		'qt6-base>=6.6.0'
		'qt6-svg>=6.6.0'
		'solid>=5.246'
	)

	cd "${srcdir}/${pkgname}-${pkgver}/build" || return
	make DESTDIR="$pkgdir" install
	install -Dm644 "${srcdir}/calamares.desktop" "$pkgdir/etc/xdg/autostart/calamares.desktop"
	install -Dm755 "${srcdir}/calamares_polkit" "$pkgdir/usr/bin/calamares_polkit"
	install -Dm644 "${srcdir}/49-nopasswd-calamares.rules" "$pkgdir/etc/polkit-1/rules.d/49-nopasswd-calamares.rules"
	chmod 750 "$pkgdir"/etc/polkit-1/rules.d

}

package_calamares-qt5() {
	depends=(
		'kconfig5>=5.113.0'
		'kcoreaddons5>=5.113.0'
		'kiconthemes5>=5.113.0'
		'ki18n5>=5.113.0'
		'kio5>=5.113.0'
		'solid5>=5.113.0'
		'qt5-base>=5.15.11'
		'qt5-svg>=5.15.11'
		'polkit-qt5>=0.175.0'
		'plasma-framework5>=5.58'
		'qt5-xmlpatterns>=5.15.11'
	)

	cd "${srcdir}/${pkgname}-${pkgver}/build" || return
	make DESTDIR="$pkgdir" install
	install -Dm644 "${srcdir}/calamares.desktop" "$pkgdir/etc/xdg/autostart/calamares.desktop"
	install -Dm755 "${srcdir}/calamares_polkit" "$pkgdir/usr/bin/calamares_polkit"
	install -Dm644 "${srcdir}/49-nopasswd-calamares.rules" "$pkgdir/etc/polkit-1/rules.d/49-nopasswd-calamares.rules"
	chmod 750 "$pkgdir"/etc/polkit-1/rules.d
}
