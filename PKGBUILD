# Maintainer: Igor Khanin <igor at khanin dot biz>
pkgname=katvan
pkgver=0.9.0
pkgrel=1
pkgdesc='A bare-bones editor for Typst files, with a bias for RTL editing'
arch=('x86_64')
url='https://katvan.app'
license=('GPL-3.0-or-later')
depends=('qt6-base'
         'hunspell'
         'libarchive'
         'gcc-libs'
         'glibc'
         'hicolor-icon-theme')
makedepends=('cargo'
             'cmake'
             'corrosion'
             'qt6-tools'
             'gtest')
options=(!lto)
source=("https://github.com/IgKh/katvan/releases/download/v${pkgver}/${pkgname}-${pkgver}-src.tar.gz")
sha256sums=('03626cebb72915a87a09e897fc40a9de5763c7598a1171297bc064857952cdd9')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --manifest-path ${pkgname}-${pkgver}/typstdriver/rust/Cargo.toml --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DKATVAN_CARGO_PROFILE=release -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

