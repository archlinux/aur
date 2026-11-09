# Maintainer: tam1m <tbacc plus aur at pm dot me>
_pkgname=pipeweaver
pkgname=pipeweaver-app-git
pkgver=r680.006b045
pkgrel=1
pkgdesc="An application wrapper for the Pipeweaver UI"
arch=('x86_64')
url="https://github.com/pipeweaver/pipeweaver"
license=('MIT')
depends=('pipeweaver-git' 'qt6-webengine')
makedepends=('git' 'rust' 'cargo')
conflicts=('pipeweaver-app')
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!lto') # build fails with lto enabled

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "${srcdir}/${_pkgname}"
    
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build -p pipeweaver-app --release --frozen
}

package() {
    cd "${srcdir}/${_pkgname}"
    
    install -d "${pkgdir}/usr/bin"
    install -m755 "target/release/pipeweaver-app" "${pkgdir}/usr/bin/pipeweaver-app"
    
    install -d "${pkgdir}/usr/share/applications"
    install -m644 app/resources/pipeweaver-app.desktop "${pkgdir}/usr/share/applications/pipeweaver-app.desktop"
    
    # The README and LICENSE are provided by pipeweaver, so we don't need a specific install
}

