# Maintainer: j.r <j.r@jugendhacker.de>
pkgbase=youplay
pkgname=(youplay-base youplay-gtk3 youplay-gtk4 youplay-pyqt6 youplay-qt6)
pkgver=0.46
pkgrel=1
pkgdesc="Search, download and play music from YouTube."
arch=(any)
url="https://codeberg.org/ralfhersel/youplay"
license=('GPL3')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"0001-Change-paths-for-packaging.patch")
md5sums=('8f2eb578f8d1950e8d9cb64e3ae6c85f'
         'a500e03c7e25464565a68acf4f0050b6')

prepare() {
	cd "${pkgbase}"

	patch -p1 -i "${srcdir}/0001-Change-paths-for-packaging.patch"
	sed -e "s/@@gui@@/gtk3/g" youplay.sh > youplay-gtk3.sh
	sed -e "s/@@gui@@/gtk4/g" youplay.sh > youplay-gtk4.sh
	sed -e "s/@@gui@@/pyqt6/g" youplay.sh > youplay-pyqt6.sh
	sed -e "s/@@gui@@/qt6/g" youplay.sh > youplay-qt6.sh
}

package_youplay-base() {
	depends=(mpv ffmpeg python-mpv yt-dlp)

	cd "${pkgbase}"
	install -Dm755 youplay.py "${pkgdir}/usr/share/${pkgbase}/${pkgbase}.py"
	install -Dm644 youplay.svg "${pkgdir}/usr/share/${pkgbase}/${pkgbase}.svg"
}

package_youplay-gtk3() {
	depends=(youplay-base gtk3 python-gobject)

	cd "${pkgbase}"
	install -Dm755 youplay-gtk3.sh "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/${pkgbase}/" youplay_gtk3.py
}

package_youplay-gtk4() {
	depends=(youplay-base gtk4 libadwaita)
	replaces=(youplay)

	cd "${pkgbase}"
	install -Dm755 youplay-gtk4.sh "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 youplay-gtk4.sh "${pkgdir}/usr/bin/${pkgbase}"
	install -Dm644 -t "${pkgdir}/usr/share/${pkgbase}/" youplay_gtk4.py
	desktop-file-install --dir="${pkgdir}/usr/share/applications" youplay.desktop
}

package_youplay-pyqt6() {
	depends=(youplay-base python-pyqt6)

	cd "${pkgbase}"
	install -Dm755 youplay-pyqt6.sh "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/${pkgbase}/" youplay_pyqt6.py
}

package_youplay-qt6() {
	depends=(youplay-base pyside6)

	cd "${pkgbase}"
	install -Dm755 youplay-qt6.sh "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 -t "${pkgdir}/usr/share/${pkgbase}/" youplay_qt6.py
}
