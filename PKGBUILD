# Maintainer: JayCee Creates <jaycee.creates@gmail.com>
pkgname="userspace-tablet-driver-gui-git"
_pkgname="userspace-tablet-driver-gui"
pkgver=r1.8a0e292
pkgrel=1
pkgdesc="A front-end GUI for Userspace Tablet Driver Daemon for non-Wacom tablets"
arch=("x86_64")
url="https://github.com/kurikaesu/userspace-tablet-driver-gui.git"
license=('GPL3')
depends=('java-runtime>=11' 'userspace-tablet-driver-daemon')
conflicts=('userspace-tablet-driver-gui')
provides=('userspace-tablet-driver-gui')
install=postremove.install
source=("userspace-tablet-driver-gui::git+https://github.com/kurikaesu/userspace-tablet-driver-gui#branch=main")
sha256sums=("SKIP")

prepare() {
	if [ ! -d "${srcdir}/${_pkgname}" ]
	then
		cd ${srcdir}
		git clone ${url} --branch main --single-branch --depth 1
	else
		cd "${srcdir}/${_pkgname}"
		git fetch --depth 1 origin main
		git reset --hard origin/main
	fi
}

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	./gradlew build
}

package() {
	mkdir -p "${pkgdir}/usr/lib"
	cd "${srcdir}/${_pkgname}"
	cp -rfv ./config/usr/local/* "${pkgdir}/usr"
	cp -rfv ./build/libs "${pkgdir}/usr/lib/userspace-tablet-driver-utility"
	sed -i 's/local\///g' "${pkgdir}/usr/bin/userspace-tablet-driver-utility"
	chmod a+wr "${pkgdir}/usr/lib/userspace-tablet-driver-utility" -R
}
