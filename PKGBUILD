# Maintainer: antsa <asss1924 <plus> aur <at> gmail <dot> com>
_name=mn32-rs
pkgname=${_name}-git
pkgdesc="Configuration tool for Mionix Naos 3200 (rust port)"
url="https://codeberg.org/antsa/mn32-rs"
pkgver=r18.76beef4
pkgrel=1
arch=('x86_64')
license=('Unlicense')
depends=('libusb' 'gtk4')
makedepends=('cargo' 'git')
source=('org.codeberg.antsa.mn32-rs.desktop' '99-mn32-rs.rules' 'mn32-rs-git::git+https://codeberg.org/antsa/mn32-rs.git')
sha512sums=('d58600ba6082f7fd4ab279222cb75a25dd8517b2d7afa882cc653fe226e06e7bf15eb90b821d014de07bf59dbddcc6f6bb364199eaf14c56a11bec5af75ed60b'
            '551d9735496abd273f29eb562f8c526e96d72b8cd863fac63918aa929435d0e615085ddf164f381ea3ca458865fd291e0c42cdc822ab578c36aeec75f424090d'
            'SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cargo build --release --all-features --target-dir=target
    strip ${srcdir}/mn32-rs-git/target/release/${_name}-gui
}

package() {   
    install -d "${pkgdir}"/usr/share/applications
    install -d "${pkgdir}"/usr/lib/udev/rules.d
    install -d "${pkgdir}"/usr/bin
    install -m644 "${srcdir}/org.codeberg.antsa.mn32-rs.desktop" "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}/99-mn32-rs.rules" "${pkgdir}/usr/lib/udev/rules.d"
    install -m755 ${srcdir}/mn32-rs-git/target/release/${_name}-gui "${pkgdir}/usr/bin/${_name}"
}
