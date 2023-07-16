# Maintainer: Patrick Desaulniers <desaulniers dot patrick at carrefour dot cegepvicto dot ca>

pkgname=bitrot-git
pkgver=r16.06a72cd
pkgrel=1
pkgdesc="Bitrot audio plugins (LV2, VST2 and LADSPA)"
arch=('i686' 'x86_64')
url="https://github.com/grejppi/bitrot.git"
license=('Apache')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'waf')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+https://github.com/grejppi/bitrot.git"
        "git+https://github.com/grejppi/DPF.git#branch=custom")
md5sums=('SKIP'
         'SKIP')

pkgver() {
    cd "${pkgname%-*}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname%-*}"

    git submodule init
    git config submodule.libs/DPF.url "$srcdir/DPF"
    git -c protocol.file.allow=always submodule update

    waf configure --prefix="/usr" 
}

build() {
    cd "${pkgname%-*}"

    waf
}

package() {
    cd "${pkgname%-*}"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    waf install --destdir="$pkgdir"
}
