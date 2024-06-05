# Maintainer: Fabian Posch <aur@posch.tech>

pkgname=act-sky130-git
pkgver=0.0.1.r24.7f4e878
pkgrel=3
pkgdesc="ACT configurations for the Skywater 130nm technology."
arch=('x86_64')
url="https://github.com/asyncvlsi/sky130l"
license=('Apache-2.0')
depends=('act-core')
makedepends=('git' 'patch' 'make')
conflicts=('act-sky130' 'act-sky130l')
provides=('act-sky130' 'act-sky130l')
source=(
    "git+${url}"
    "conf_makefile.patch"
    "conf2_makefile.patch"
)
sha512sums=(
    "SKIP"
    "7995795df8e21ea9ce0573bd4add73845a937c575484177aa53dd167f46e5404dd616c9efe41b3b2918d6facdd2e9276202b36fe93e8e175ed4b99612638ef65"
    "9991e8d9e568dd868be17b232dd58a68a82d3191100b69f207e62a60e00b2d8601c227a7322f98d4ffa3308f55feb08b3d19ff4aacdf54213a301d077a56040b"
)

pkgver() {
    cd sky130l
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    # patch the makefiles to install to different location to main install
    patch ${srcdir}/sky130l/conf/Makefile < "conf_makefile.patch"
    patch ${srcdir}/sky130l/conf2/Makefile < "conf2_makefile.patch"
}

package() {
    install -Dm644 ${srcdir}/sky130l/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    export ACT_HOME="/opt/act-async"
    mkdir -p ${pkgdir}/opt/act-async/conf/sky130
    mkdir -p ${pkgdir}/opt/act-async/conf/sky130l

    cd sky130l
    make install INSTALL_OVERRIDE="${pkgdir}/opt/act-async/"

    rm -r ${pkgdir}/opt/act-async/act
    rm -r ${pkgdir}/opt/act-async/conf/generic
}