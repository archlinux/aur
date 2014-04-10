# Maintainer: Jon Gjengset <jon@tsp.io>
# Repository here: https://github.com/jonhoo/zed-PKGBUILD
pkgname=zed-git
pkgver=0.10.2.r37.g480b696
pkgrel=1
pkgdesc="a code editor built using web technologies"
arch=('i686' 'x86_64')
makedepends=('git')
depends=('node-webkit')
conflicts=('zed')
provides=()
options=(!strip)
license=("MIT")
url="http://zedapp.org/"
source=('git+https://github.com/zedapp/zed.git' 'zed.sh' 'zed.desktop')
md5sums=('SKIP'
         'abae90ce618ed1b3f471b8d1c4b788d1'
         '6da60b5e24427a4f5a4315c71f24e8c3')

pkgver() {
	cd "${srcdir}/zed"
	git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/zed"
	make install-dep
}

build() {
	cd "${srcdir}/zed"
	make apps-npm
}

package() {
	cd "${srcdir}/zed"

	install -d "${pkgdir}/usr/share/${pkgname}"

	msg2 "Copy editor files"
	rm -rf "${pkgdir}/usr/share/${pkgname}/app.nw"
	cp -r "${srcdir}/zed/app" "${pkgdir}/usr/share/${pkgname}/app.nw"
	install "${srcdir}"/zed/Zed.png "${pkgdir}/usr/share/${pkgname}/launcher.png"

	# Install Launcher
	msg2 "Install launcher to /usr/bin"
	install -D -m755 "${srcdir}"/zed.sh "${pkgdir}"/usr/bin/zed

	# Install Desktop
	msg2 "Add .desktop file"
	install -D -m644 "${srcdir}"/zed.desktop "${pkgdir}"/usr/share/applications/zed.desktop
}
