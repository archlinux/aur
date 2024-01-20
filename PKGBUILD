# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: git

pkgbase="openbangla-keyboard-git"
pkgname=(
    "$pkgbase"
    "ibus-openbangla-git"
    "fcitx5-openbangla-git"
)
pkgver=2.0.0.r78.gaddbd4e
pkgrel=1
pkgdesc="An OpenSource, Unicode compliant Bengali Input Method"
arch=('x86_64')
url="https://openbangla.github.io"
license=('GPL3')
makedepends=('cmake' 'rust' 'git' 'ibus' 'fcitx5' 'qt5-base')
optdepends=('ttf-indic-otf: fonts for Bangla and other Indic scripts'
            'ttf-freebanglafont: miscellaneous fonts for Bangla script')
source=(
    "${pkgbase%*-git}::git+https://github.com/OpenBangla/OpenBangla-Keyboard#branch=develop"
    "riti::git+https://github.com/OpenBangla/riti"
)
sha256sums=('SKIP'
            'SKIP')
pkgver()
{
    cd "$srcdir/${pkgbase%*-git}"
    (
        set -o pipefail
        git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/${pkgbase%*-git}"
    git submodule init
    git config submodule."src/engine/riti".url $srcdir/riti
    git -c protocol.file.allow=always submodule update
    git -C src/engine/riti checkout master
}

build() {
    if [[ -d build ]]; then rm -rf build; fi
    cmake -B build -S "${pkgbase%*-git}" \
        -DBIN_DIR:PATH=/usr/bin \
        -DLIBEXECDIR:PATH="/usr/lib/$pkgname" \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_SKIP_INSTALL_RPATH=YES \
        -DCMAKE_SKIP_RPATH=YES \
        -DENABLE_FCITX=YES \
        -DENABLE_IBUS=YES \
        -DCMAKE_INSTALL_PREFIX="/usr"
    make -C build
}
package_openbangla-keyboard-git() {
    depends=('qt5-base' "openbangla-im=$pkgver" 'hicolor-icon-theme' 'zstd')
    provides=("${pkgbase%*-git}=$pkgver")
    conflicts=("${pkgbase%*-git}")

    make -C build DESTDIR="$pkgdir" install
    mv -t "$pkgdir/../" \
            "$pkgdir/usr/lib" \
            "$pkgdir/usr/share/ibus" \
            "$pkgdir/usr/share/fcitx5"
}

package_ibus-openbangla-git () {
    depends=('ibus' 'qt5-base' "$pkgbase=$pkgver")
    conflicts=('ibus-openbangla')
    install="ibus-openbangla.install"
    provides=(
        "ibus-openbangla=$pkgver"
        "openbangla-im=$pkgver"
    )

    mkdir -p "$pkgdir/usr/"{lib,share}
    mv "$pkgdir/../lib/openbangla-keyboard-git" "$pkgdir/usr/lib/ibus-openbangla-git"
    mv "$pkgdir/usr/lib/ibus-openbangla-git/"ibus{-engine,}-openbangla
    mv "$pkgdir/../ibus" "$pkgdir/usr/share/ibus"
    sed -i '/<exec>/{s/\(openbangla\)-keyboard/ibus-\1/;s/-engine//;}' \
        "$pkgdir/usr/share/ibus/component/openbangla.xml"
}

package_fcitx5-openbangla-git() {
    depends=(
        'fcitx5'
        'gcc-libs'
        "$pkgbase=$pkgver"
    )
    conflicts=('fcitx5-openbangla')
    optdepends=(
        'fcitx5-gtk: Fcitx5 Gtk support'
        'fcitx5-configtool: Fcitx5 Configuration Utility'
    )
    install="fcitx5-openbangla.install"
    provides=(
        "fcitx5-openbangla=$pkgver"
        "openbangla-im=$pkgver"
    )

    mkdir -p "$pkgdir/usr/"{lib,share}
    mv "$pkgdir/../lib/fcitx5" "$pkgdir/usr/lib/fcitx5"
    mv "$pkgdir/../fcitx5" "$pkgdir/usr/share/fcitx5"
}
