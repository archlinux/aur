# Maintainer: Bazyli Cyran <bazyli@cyran.dev>

pkgname=timewall
pkgver=2.0.2
pkgrel=1
pkgdesc='Apple dynamic HEIF wallpapers on GNU/Linux'
url='https://github.com/bcyran/timewall'
provides=('timewall')
conflicts=('timewall-bin')
depends=('libheif')
makedepends=('cargo')
checkdepends=('cargo')
license=('MIT')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bcyran/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('55c202c19cdfc11d6e3a0d4cbab3c95d9e509334eedfd3baaf65c7e8c72c8319')

build() {
    cd "${pkgname}-${pkgver}"
    export SHELL_COMPLETIONS_DIR="completions"
    mkdir -p "${SHELL_COMPLETIONS_DIR}"
    cargo build --release --locked
}

check() {
    cd "${pkgname}-${pkgver}"
    cargo test --release --locked
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 "completions/${pkgname}.bash" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm 644 "completions/_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
    install -Dm 644 "completions/${pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
    install -Dm 644 "timewall.service" -t "${pkgdir}/usr/lib/systemd/user"
}
