# Maintainer: Sébastien TERRIER <ouinouin@ouinouin.eu>

_pkgname=steamos-manager
pkgname=${_pkgname}-hhd
pkgver=26.3.0
pkgrel=1
pkgdesc="Fork of Valve's steamos-manager with Handheld Daemon (HHD) TDP integration"
arch=('x86_64')
url='https://gitlab.steamos.cloud/holo/steamos-manager'
license=('MIT')
depends=(
	'hhd>=4.1'
	'dbus'
	'systemd-libs')
makedepends=(
	'git'
	'rust'
	'clang'
	'speech-dispatcher')
source=(
	"${_pkgname}::git+https://gitlab.steamos.cloud/holo/steamos-manager.git#tag=v${pkgver}"
	"hhd.patch")
sha256sums=('aa1fdab11b18515d4bfabc7a0b18dece17c51ad32da85111d97c881222f5da3a'
            'a2852c3ca75108d39d44a5826be550b9b0c5fd479cb90145c19d5204a0582252')
provides=('steamos-manager')
conflicts=('steamos-manager')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch -Np1 -i "${srcdir}/hhd.patch"
	cargo fetch --locked --target "x86_64-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make build
}

package() {
    cd "${srcdir}/${_pkgname}"
    make install DESTDIR="${pkgdir}"
}
