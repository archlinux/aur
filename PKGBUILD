# Maintainer: ssf <punx69 at gmx dot net>

pkgbase='qt-style-virtuality-git'
pkgname=('qt5-style-virtuality' 'qt4-style-virtuality' 'virtuality-config')
pkgver=1.0.r147
pkgrel=1
pkgdesc="futustic widget style for Qt"
arch=('i686' 'x86_64')
url="https://github.com/luebking/virtuality"
license=('GPL2')
groups=('qt-style-virtuality')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'qt4' 'qt5-base' 'qt5-x11extras' 'pkg-config')
source=("${pkgbase//-git/}::git://github.com/luebking/virtuality#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgbase//-git/}"
	_rev=$(git rev-list --count HEAD)
	printf "1.0.r$_rev"
}

build() {
###great! now we need to build everything until they split build...
	cd "${pkgbase//-git/}"/build-qt5
	cmake -DWITH_QT5=ON -DENABLE_KDE=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
	cd ../build-qt4
	cmake -DWITH_QT5=OFF -DENABLE_KDE=OFF -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	make
}

prepare() {
	cd "${pkgbase//-git/}"
	install -d build-qt4 build-qt5
}

package_qt5-style-virtuality() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='futustic widget style for Qt5'
	depends=('qt5-base' 'qt5-x11extras')
	install -Dm0644 "${pkgbase//-git/}"/build-qt5/libvirtuality.so "${pkgdir}"/usr/lib/qt/plugins/styles/libvirtuality.so
}

package_qt4-style-virtuality() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='futustic widget style for Qt4'
	depends=('qt4')
	install -Dm0644 "${pkgbase//-git/}"/build-qt4/libvirtuality.so "${pkgdir}"/usr/lib/qt4/plugins/styles/libvirtuality.so
}

package_virtuality-config() {
	pkgname=("${pkgname}")
	provides=("${pkgname}" "${pkgname}-git=${pkgver}")
	conflicts=("${pkgname}" "${pkgname}-git<${pkgver}")
	replaces=("${pkgname}" "${pkgname}-git<${pkgver}")
	pkgdesc='An easy way to configure Virtuality'
	depends=('qt5-base')
	cd "${pkgbase//-git/}"/build-qt5
	make install DESTDIR="${pkgdir}"
	rm -rf "${pkgdir}"/usr/lib/
	install -d "${pkgdir}/usr/share/applications/"
	cat <<\EOF > "${pkgdir}/usr/share/applications/${pkgname}.desktop"
[Desktop Entry]
Version=1.0
Name=Virtuality Config
Comment=An easy way to configure Virtuality
Exec=virtuality
Icon=preferences-desktop-theme
Terminal=false
Type=Application
Categories=Qt;Settings;DesktopSettings;LXQt;X-XFCE-SettingsDialog;X-XFCE-PersonalSettings;X-GNOME-PersonalSettings;
X-KDE-StartupNotify=false
EOF
}
