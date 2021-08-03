# Maintainer: Solomon Choina <shlomochoina@gmail.com
# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=taffybar
pkgver=3.3.0
pkgrel=1
license=('BSD3')
pkgdesc="A desktop bar similar to xmobar, but with more GUI"
url="http://github.com/taffybar/taffybar"
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

sha256sums=('41d19c12694c7fe9526d4082993f2c1f07e12ea133c494c7d017da1d2c370b32'
            '554340a052abecb78fbb959d1a05b8f4f4db947fc151e7f0f8c49f2300f1ab6d'
            'f4a08e887ba527a24f4cecc22393023bf7230172cc76f840ddfc5cfc54182a7e'
            'ad02a7524b7c9bd9ae28babfbbb30519b3eb10ff40e3e493aee051bd36c0b715'
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
