# Maintainer: kageru <kageru[at]encode[dot]moe>

_plug=adaptivegrain
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.3.0.38.g1c062e6
pkgrel=1
pkgdesc='Reimplementation of the adaptive grain mask as a Vapoursynth plugin'
arch=('x86_64')
url='https://github.com/kageru/adaptivegrain'
license=('MIT')
depends=('vapoursynth')
makedepends=('git' 'cargo')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("$_plug::git+https://github.com/kageru/adaptivegrain.git")
sha256sums=('SKIP')

pkgver() {
    cd $_plug
    echo "$(grep '^version =' Cargo.toml | head -n1 | cut -d\" -f2 | cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd $_plug
    echo 'If the build fails with “no default toolchain configured”, you may need to set up rust.
When using rustup, this can be done via
rustup install stable && rustup default stable'
    RUSTFLAGS="$RUSTFLAGS -C target-cpu=native" cargo build --release --locked
}

package() {
    cd $_plug
    install -Dm755 "target/release/libadaptivegrain_rs.so" "$pkgdir/usr/lib/vapoursynth/libadaptivegrain.so"
}
