# Maintainer: Grzegorz Baranski <root@gbaranski.com>

_pkgname=houseflow-server
pkgname="${_pkgname}-git"
workspace=server
pkgver=0.5.0
pkgrel=5
pkgdesc="Home automation platform, written in Rust. Server only"
arch=(
    'x86_64'
    'arm'
    'armv6h'
    'armv7h'
    'aarch64'
    'i686'
)
url="https://github.com/gbaranski/houseflow"
license=('GPL-3.0')
makedepends=(
    'git'
    'rust'
    'cargo'
)
source=(
	"${_pkgname}::git+https://github.com/gbaranski/houseflow"
	service
)
sha256sums=(
	'SKIP'
	'SKIP'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
    cd "${_pkgname}/${workspace}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}/${workspace}"
    cargo build --release --locked
}

check() {
    cd "${_pkgname}/${workspace}"
    cargo test --release --locked
}

prepare() {
    cd "${_pkgname}/${workspace}"
    cargo fetch --locked
}

package() {
    cd "${_pkgname}"
    install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm 755 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm 644 "$srcdir"/service "$pkgdir/usr/lib/systemd/system/houseflow-server.service"
}

