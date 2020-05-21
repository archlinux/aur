# Maintainer: Austin Haedicke (austin.haedicke@gmail.com)
# Telegram @savagezen / @savagezen_aur
# GitHub https://github.com/savagezen/pkgbuild

# Contributor: @RubenKelevra https://github.com/RubenKelevra
# Previous Maintainer : Sauyon Lee <sauyonl@sauyon.com>
# Contributor : Martin Wimpress <code@flexion.org>

_pkgname=syncthing
pkgname=$_pkgname-git
pkgver=v1.6.0.rc.5.r26.gcf7532906
pkgrel=1
pkgdesc="Open Source Continuous Replication / Cluster Synchronization Thing"
url="https://syncthing.net/"
license=('MPLv2')
makedepends=('git' 'go' 'inetutils')
conflicts=("$_pkgname")
provides=("$_pkgname")
arch=('i686' 'x86_64')
source=("git+https://github.com/syncthing/syncthing.git")
sha256sums=('SKIP')
install=${_pkgname}.install

prepare() {
	cd "$srcdir/$_pkgname"
	mkdir -p "${srcdir}/../go"
	export GOPATH="${srcdir}/../go"
	export PATH="$PATH:$GOPATH/bin"
	go get -d -v ./...
}

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	export GOPATH="${srcdir}/../go"
	export PATH="$PATH:$GOPATH/bin"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go run build.go -no-upgrade build
}

check() {
	export GOPATH="${srcdir}/../go"
	cd "$srcdir/$_pkgname"
#	go run build.go -no-upgrade test
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 "etc/linux-systemd/system/${_pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}@.service"
	install -Dm644 "etc/linux-systemd/user/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/user/${_pkgname}.service"

	# license
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE

	# man pages
	cd "$srcdir/$_pkgname/man"
	for file in $(find . -name '*.1' -print); do
		install -Dm644 $file "${pkgdir}"/usr/share/man/man1/$file
	done
	for file in $(find . -name '*.5' -print); do
		install -Dm644 $file "${pkgdir}"/usr/share/man/man5/$file
	done
	for file in $(find . -name '*.7' -print); do
		install -Dm644 $file "${pkgdir}"/usr/share/man/man7/$file
	done
	chmod u+w -R "$GOPATH"
}
