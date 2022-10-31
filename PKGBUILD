# Maintainer: Sammay Sarkar <(my-name-without-vowels)@gmail.com>
# Co-Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: github
# what: OpenBangla/OpenBangla-keyboard

pkgname="openbangla-keyboard"
pkgver="2.0.0"
pkgrel=7
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="http://openbangla.github.io"
license=('GPL3')
depends=('ibus' 'qt5-base')
makedepends=('cmake' 'rust' 'git')
optdepends=('ttf-indic-otf: fonts for Bangla and other Indic scripts'
            'ttf-freebanglafont: miscellaneous fonts for Bangla script')
install="$pkgname.install"
source=(
    "$pkgname::git+https://github.com/OpenBangla/OpenBangla-keyboard.git#tag=$pkgver"
    "riti::git+https://github.com/OpenBangla/riti.git"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd ${pkgname}
    git describe --tags | sed 's/-/+/g'
}

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule."src/engine/riti".url "$srcdir/riti"
    git -c protocol.file.allow=always submodule update
}
build() {
    if [[ -d build ]]; then rm -rf build; fi
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_SKIP_INSTALL_RPATH=YES \
        -DCMAKE_SKIP_RPATH=YES
    #	-DBIN_DIR:PATH=/usr/bin \
    #	-DLIBEXECDIR:PATH="/usr/lib/$pkgname"
    make -C build
}
package() {
    make -C build DESTDIR="$pkgdir" install
}
