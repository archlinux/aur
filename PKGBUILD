# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

pkgname=logtail-dash
pkgdesc='Displays and updates a dashboard based on one or more logfiles'
license=('MIT')
url='https://github.com/happybeing/logtail-dash'
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
depends=(
)
makedepends=(
    'rust'
    'cargo'
)
# Logtail v1.0.1 has issues with tokio + rt + spawn_blocking()
# Hash for v1.0.0, hoping for release tarballs in the future
_hash='3f47694ef24a12f4c5432b8e131a8373fb47fae5'
source=(
    "${pkgname}_${pkgver}.tar.gz::https://github.com/happybeing/logtail-dash/archive/${_hash}.tar.gz"
)
sha512sums=('bf8e4ac545a3680c61df6524d00278926f0c80dc0953a1b1bcfb0a3c2d18b204649d043d571682fe8d498054d1b07e4cf8b267d6c3d6a41fc626c40090c67d0d')

prepare() {
    mv ${pkgname}-${_hash} ${pkgname}-${pkgver}
}

build() {
    cd ${pkgname}-${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target --bin logtail
}

check() {
    cd ${pkgname}-${pkgver}
    RUSTUP_TOOLCHAIN=stable cargo test --locked --target-dir=target
}

package() {
    cd ${pkgname}-${pkgver}
	install -Dt "$pkgdir/usr/bin/" target/release/logtail
}
