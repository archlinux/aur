pkgname=otadump
pkgver=0.1.2
pkgrel=1
pkgdesc='Extract partitions from Android OTA files'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/crazystylus/${pkgname}"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libbz2.so' 'liblzma.so')
makedepends=('cargo')

_snapshot="${pkgname}-${pkgver}"
source=("${url}/archive/${pkgver}/${_snapshot}.tar.gz")
sha256sums=('0546b131bf1514e7ba527edff9f4c03018cdffba04898282ac9a531750aaf403')

prepare() {
    cd "${_snapshot}"
    sed -i 's/"static"//' 'Cargo.toml'
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_snapshot}"
    cargo build --frozen --release --target-dir "${srcdir}"
}

check() {
    cd "${_snapshot}"
    cargo test --frozen
}

package() {
    install -Dm755 "release/${pkgname}" -t "${pkgdir}/usr/bin"
}
