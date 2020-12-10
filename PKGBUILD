# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# pkg: git
pkgname="openbangla-keyboard-git"
pkgver=2.0.0.r9.gd0de98d
pkgrel=1
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="https://openbangla.github.io"
license=('GPL3')
provides=( 'openbangla-keyboard' )
conflicts=( 'openbangla-keyboard' )
depends=('ibus' 'qt5-base')
makedepends=('cmake' 'rust' 'git')
optdepends=('ttf-indic-otf: fonts for Bangla and other Indic scripts'
            'ttf-freebanglafont: miscellaneous fonts for Bangla script')
install="${pkgname%*-git}.install"
source=(
    "${pkgname%*-git}::git+https://github.com/OpenBangla/OpenBangla-Keyboard"
    "riti::git+https://github.com/OpenBangla/riti"
)
sha256sums=('SKIP'
            'SKIP')
pkgver()
{
    cd "$srcdir/${pkgname%*-git}"
    (
        set -o pipefail
        git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/${pkgname%*-git}"
    git submodule init
    git config submodule."src/engine/riti".url $srcdir/riti
    git submodule update
}

build() {
    cd "$srcdir/${pkgname%*-git}"
    if [[ -d build ]]; then rm -rf build; fi
    mkdir build && cd build
    cmake ..
    make
}
package() {
    cd "$srcdir/${pkgname%*-git}"
    make -C build DESTDIR="$pkgdir" install
}
