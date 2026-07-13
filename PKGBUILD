# Maintainer: Sébastien TERRIER <ouinouin@ouinouin.eu>

_pkgname=steamos-manager
pkgname=${_pkgname}-hhd
pkgver=26.3.0
pkgrel=4
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
            '3cd80d6d394d940c54923bfd2acfe3555d9682bac780e1592a1d4870d98e3e53'
            'dabe786263bab9a5cbda3debfa07091838dd6a9e3fedaf2735a812a6f20d1e67')
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
