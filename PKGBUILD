# Maintainer: Teoh Han Hui <teohhanhui@gmail.com>

_pkgname=makepad
pkgname=makepad-git
pkgver=0.1.0.r883.5c05e153
pkgrel=1
pkgdesc='VR, web and native collaborative shader programming environment'
arch=('i686' 'x86_64')
url='https://github.com/makepad/makepad'
license=('MIT')
depends=('libx11' 'libxcursor' 'mesa-libgl')
makedepends=('cargo' 'git')
provides=('makepad')
conflicts=('makepad')

source=("${pkgname}::git+https://github.com/makepad/makepad#branch=master"
        'adjust-makepad-workspace.patch'
        'adjust-resources-path.patch')
sha256sums=('SKIP'
            '29a82f1366817901481757fb2c9cab1f72eae80758e179b0d0342992334da3b9'
            '83f66d95a06b46a975171eea9ba32f50c1b3529f68257f820a455c39d9bc5601')

prepare() {
    cd "${srcdir}/${pkgname}"

    for patch in "${srcdir}/"*.patch; do
        sed -i -e "s#%%MAKEPAD_HOME%%#/opt/${_pkgname}#g" "${patch}"
        patch -p1 -i "${patch}"
    done
}

pkgver() {
    cd "${srcdir}/${pkgname}"

    printf "%s.r%s.%s" "$(grep '^version =' makepad/Cargo.toml | head -n1 | cut -d\" -f2 | cut -d- -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    cargo build --release --package "${_pkgname}"
}

check() {
    cd "${srcdir}/${pkgname}"

    cargo test --release --package "${_pkgname}"
}

package() {
    cd "${srcdir}/${pkgname}"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/opt/${_pkgname}/target/release/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${_pkgname}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    find . \( -path ./.git -o -path ./.github -o -path ./target \) -prune -o -type f -exec install -Dm644 "{}" "${pkgdir}/opt/${_pkgname}/{}" \;
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
