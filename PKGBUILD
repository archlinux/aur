# Maintainer: Sébastien TERRIER <ouinouin@ouinouin.eu>

_pkgname=steamos-manager
pkgname=${_pkgname}-hhd-git
pkgver=0.r619.g3dcc586
pkgrel=1
pkgdesc="Fork of Valve's steamos-manager with Handheld Daemon (HHD) TDP integration"
arch=('x86_64')
url='https://github.com/bazzite-org/steamos-manager'
license=('MIT')
depends=(
	'hhd>=4.1'
	'dbus'
	'gamescope-session-steam-git'
	'systemd-libs')
makedepends=(
	'git'
	'rust')
source=(
	"${_pkgname}::git+https://github.com/bazzite-org/steamos-manager.git"
	"no-orca-service.patch")
sha256sums=(
	'SKIP'
	'10a36852b2cddf2ecc4f76df0cbabd9dd1f53c507590ecb0e58e6524511ba38f')
provides=('steamos-manager')
conflicts=('steamos-manager')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	local rev count
	count="$(git rev-list --count HEAD)"
	rev="$(git rev-parse --short HEAD)"
	printf "0.r%s.g%s" "$count" "$rev"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -Np1 -i "${srcdir}/no-orca-service.patch"
	cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make build
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install DESTDIR="${pkgdir}"

    install -d -m0755 "$pkgdir/usr/lib/systemd/user/gamescope-session-plus@steam.service.wants/"
    ln -s ../steamos-manager.service "$pkgdir/usr/lib/systemd/user/gamescope-session-plus@steam.service.wants/"
    
    install -d -m0755 "${pkgdir}/usr/bin"
    ln -s ../lib/steamos-manager "${pkgdir}/usr/bin/steamos-manager"
}
