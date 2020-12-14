# Maintainer: Solomon Choina <shlomochoina@gmail.com
# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=taffybar
pkgver=3.2.3
pkgrel=1
license=('BSD3')
pkgdesc="A desktop bar similar to xmobar, but with more GUI"
url="http://github.com/travitch/taffybar"
arch=('i686' 'x86_64')
depends=("gmp" "zlib" 'libxss' 'libdbusmenu-gtk3')
makedepends=('stack')
install=taffybar.install
source=("https://github.com/taffybar/taffybar/archive/v${pkgver}.tar.gz"
        "taffybar.install"
        "taffybar.service"
        "stack.yaml"
        "https://raw.githubusercontent.com/taffybar/taffybar/13b32fc2bc62129093494e939339a979d641691c/xmonad.hs.example"
        )

sha256sums=('74333f8177677d4acb509d09ca3727b726b70d1b6cfc1a5439d236eabc6556b3'
            '554340a052abecb78fbb959d1a05b8f4f4db947fc151e7f0f8c49f2300f1ab6d'
            'f4a08e887ba527a24f4cecc22393023bf7230172cc76f840ddfc5cfc54182a7e'
            '0bd90a3b0859ccb7a5319ce7906a7c4611153035cb75ee5a1127d34325cc03d4'
            '1a8ca4f177891941960585e228d5386ea9f120a1bb12ac0a956200de839032cb')

# PKGBUILD functions

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mv ../stack.yaml .
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "taffybar/bin"
    stack --jobs "$[$(nproc)+1]" --local-bin-path "taffybar/bin/" install -- taffybar

}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"/taffybar

    install -Dm755 "bin/taffybar" "${pkgdir}/usr/bin/taffybar"

    install -Dm 644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm 644 ../CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 ../README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 ${srcdir}/taffybar.service -t "${pkgdir}/usr/lib/systemd/user"
    install -Dm 644 ${srcdir}/xmonad.hs.example -t "{$pkgdir}/usr/share/doc/${pkgname}"

    rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
}
