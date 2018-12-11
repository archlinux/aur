# Maintainer: Austin Haedicke (austin.haedicke@gmail.com)
# all PKGBUILDs maintained by me are available on 
# GitHub at https://github.com/savagezen/pkgbuild

# Previous Maintainer : Sauyon Lee <sauyonl@sauyon.com>
# Contributor : Martin Wimpress <code@flexion.org>

pkgname=syncthing-git
pkgver=v0.14.55.rc.1.r1.gbdcffe703
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing"
url="http://syncthing.net/"
license=('MPLv2')
makedepends=('git' 'go' 'godep' 'inetutils')
conflicts=('syncthing')
provides=('syncthing')
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver::git+https://github.com/syncthing/syncthing.git")
sha256sums=('SKIP')
install=${pkgname}.install
_name=syncthing

prepare() {
	cd "${srcdir}"
}

pkgver() {
	cd "${pkgname}-${pkgver}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	export GOPATH="${srcdir}"
	cd "${srcdir}"
	mkdir -p "src/github.com/syncthing"
	mv "${pkgname}-${pkgver}" "src/github.com/syncthing/${_name}"
	cd "src/github.com/syncthing/${_name}"
	if [ ${CARCH}" == "i686" ] ; then
			go run build.go -no-upgrade -goarch 386 build
	if [ ${CARCH}" == "x86_64" ] ; then
			go run build.go -no-upgrade -goarch amd64 build
	else
			go run build.go -no-upgrade build
	fi
}

check() {
	export GOPATH="${srcdir}"
	cd "${srcdir}/src/github.com/syncthing/${_name}"
#	 go run build.go -no-upgrade test
}

package() {
	cd "${srcdir}/src/github.com/syncthing/${_name}"
	install -Dm755 ${_name} "${pkgdir}/usr/bin/${_name}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_name}/README.md"
	install -Dm644 "etc/linux-systemd/system/${_name}@.service" "${pkgdir}/usr/lib/systemd/system/${_name}@.service"
	install -Dm644 "etc/linux-systemd/user/${_name}.service" "${pkgdir}/usr/lib/systemd/user/${_name}.service"

# license
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_name}/LICENSE

# man pages
	cd "${srcdir}/src/github.com/syncthing/${_name}/man"
	for file in $(find . -name '*.1' -print); do
		install -Dm644 $file "${pkgdir}"/usr/share/man/man1/$file
	done
	for file in $(find . -name '*.5' -print); do
		install -Dm644 $file "${pkgdir}"/usr/share/man/man5/$file
	done
	for file in $(find . -name '*.7' -print); do
		install -Dm644 $file "${pkgdir}"/usr/share/man/man7/$file
	done
}
