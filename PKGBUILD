# Maintainer: Vasya Novikov <vnnn91@yandex.ru> (replace "nnn" with a single "n")

pkgname=bambam-git
pkgver=r45.e3680c3
pkgrel=1
pkgdesc="A simple baby keyboard masher application."
arch=('any')
url="https://github.com/porridge/bambam"
license=('GPLv3')
depends=('python2' 'python2-pygame')
source=("git+https://github.com/porridge/bambam.git"
	bambam.desktop)
sha256sums=('SKIP'
	'2d7926a150805654d6581fff5781217eb9e3c5eeb4c01240737b229dc4f48a31')

pkgver() {
	cd "${srcdir}/bambam"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/bambam"

	# allow bambam to be executed from a symlink
	# remove these lines if/after a corresponding PR gets merged to master
	sed -i -e 's/normpath/realpath/' bambam.py
}

package() {
	cd "${srcdir}/bambam"

	mkdir -p "${pkgdir}/usr/share/icons"
	cp icon.gif "${pkgdir}/usr/share/icons/bambam.gif"

	mkdir -p "${pkgdir}/usr/share/games/bambam"
	cp -R bambam.py data/ "${pkgdir}/usr/share/games/bambam/"

	mkdir -p "${pkgdir}/usr/share/applications"
	cp "${srcdir}/bambam.desktop" "${pkgdir}/usr/share/applications/"

	mkdir -p "${pkgdir}/usr/bin"
	ln --symbolic "../share/games/bambam/bambam.py" "${pkgdir}/usr/bin/bambam"
}
