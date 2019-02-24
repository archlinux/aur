# Maintainer: Egor Malyutin <egorcod.tk@gmail.com>

pkgname=funcd-git
pkgver=r22.ae55f2a
_pkgname=funcd
pkgrel=2
pkgdesc="Daemon for functional keys (works without X11)"
url="https://github.com/malyutinegor/funcd"
arch=('x86_64' 'i686')
license=('MIT')
depends=('alsa-utils' 'xorg-xinput')
makedepends=('go')
source=("${_pkgname}::git+https://github.com/malyutinegor/funcd.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" \
		go get -v -u github.com/malyutinegor/funcd
}

build() {
	cd "${srcdir}/go/src/github.com/malyutinegor/funcd"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" \
		go build github.com/malyutinegor/funcd
}

package() {
	cd "${srcdir}/go/src/github.com/malyutinegor/funcd"

	install -Dm755 "funcd" "${pkgdir}/usr/bin/funcd"
	install -Dm755 "funcd.service" "${pkgdir}/etc/systemd/system/funcd.service"
}
