# Maintainer: WhiredPlanck <whiredplanck[at]aosc.io>

pkgname=mmtc
pkgver=0.3.2
pkgrel=1
pkgdesc="A mpd terminal client"
arch=('x86_64')
url="https://github.com/figsoda/mmtc"
license=('MPL-2.0')
depends=('glibc' 'gcc-libs' 'mpd')
makedepends=('rust' 'make' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/figsoda/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('558e8778d299ed8c760617c3050228c2d638950a86db014a1a597751c1101870')
conflicts=()

build() {
    cd ${pkgname}-${pkgver}
    GEN_ARTIFACTS="artifacts" cargo build --release --locked --all-features --target-dir=target
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dvm755 target/release/${pkgname} -t "${pkgdir}/usr/bin"

    # Install completions
    install -dv "${pkgdir}/usr/share/zsh/functions/Completion/Linux/"
    install -Dvm644 artifacts/_mmtc "${pkgdir}/usr/share/zsh/functions/Completion/Linux/"
    install -dv "${pkgdir}/usr/share/fish/completions/"
    install -Dvm644 artifacts/mmtc.fish "${pkgdir}/usr/share/fish/completions/"
    install -dv "${pkgdir}/usr/share/bash-completion/completions/"
    install -Dvm644 artifacts/mmtc.bash "${pkgdir}/usr/share/bash-completion/completions/"

    # Install the license
    install -Dvm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
