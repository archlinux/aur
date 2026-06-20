# Maintainer: supdrewin <supdrewin at outlook dot com>
# Co-Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
# Contributor: Liao Junxuan <mikeljx@126.com>
# Contributor: Nathaniel van Diepen <eeems@eeems.email>

pkgname=linux-enable-ir-emitter-git
pkgver=7.0.0.beta.r22.ge339c6a
pkgrel=1
pkgdesc="Enables infrared cameras that are not directly enabled out-of-the box"
url="https://github.com/EmixamPP/linux-enable-ir-emitter"
license=('MIT')
arch=('x86_64')

provides=(linux-enable-ir-emitter)
conflicts=(linux-enable-ir-emitter linux-enable-ir-emitter-beta chicony-ir-toggle)

makedepends=(git cargo clang)
depends=(gcc-libs glibc)

install=linux-enable-ir-emitter.install

source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}/${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/linux-enable-ir-emitter"
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
