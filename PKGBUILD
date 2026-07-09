# Maintainer: Sébastien TERRIER <ouinouin@ouinouin.eu>

_pkgname=steamos-manager
pkgname=${_pkgname}-hhd
pkgver=26.3.0
pkgrel=2
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
	"hhd.patch"
	"hhd.rs")
sha256sums=('aa1fdab11b18515d4bfabc7a0b18dece17c51ad32da85111d97c881222f5da3a'
            '07fe62dbf722e30b0e7330a18dea9093b123a9a409f2dd7ded806fd628f62d96'
            '10f0562fe7ccb3353417e1ba3cec03e810d26aca998dc2ca96238e32c1d8738d')
provides=('steamos-manager')
conflicts=('steamos-manager')

prepare() {
    cd "${srcdir}/${_pkgname}"
    install -Dm644 "${srcdir}/hhd.rs" steamos-manager/src/hhd.rs
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
