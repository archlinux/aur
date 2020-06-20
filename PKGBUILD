# Maintainer: Teoh Han Hui <teohhanhui@gmail.com>

_pkgname=makepad
pkgname=makepad-git
pkgver=0.1.0.r360.01a43ce
pkgrel=1
pkgdesc='A creative software development platform built around Rust'
arch=('i686' 'x86_64')
url='https://github.com/makepad/makepad'
license=('MIT')
depends=('libx11' 'libxcursor' 'mesa-libgl')
makedepends=('cargo' 'git')
provides=('makepad')
conflicts=('makepad')

source=("${pkgname}::git+https://github.com/makepad/makepad#branch=master"
        'adjust-resources-path.patch')
sha256sums=('SKIP'
            '8162b3da86389ff26d97923ca144910c54ee982648cb5d12cd974e00741f9322')

prepare() {
    cd "${srcdir}/${pkgname}"
    for patch in "${srcdir}/"*.patch; do
        sed -i -e "s#%%USR_SHARE_PKG%%#${pkgdir}/usr/share/${_pkgname}#g" "${patch}"
        patch -p1 -i "${patch}"
    done
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s.r%s.%s" "$(grep '^version =' makepad/Cargo.toml | head -n1 | cut -d\" -f2 | cut -d- -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release --locked --package "${_pkgname}"
}

check() {
    cd "${srcdir}/${pkgname}"
    cargo test --release --locked --package "${_pkgname}"
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 755 target/release/${_pkgname} -t "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/${_pkgname}/resources"
    install -D -m 644 resources/* -t "${pkgdir}/usr/share/${_pkgname}/resources"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
