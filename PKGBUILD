# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=smuview
pkgname=${_pkgname}-git
pkgver=0.0.4.r350.ga5ffb66
pkgrel=2
pkgdesc="SmuView is a Qt-based source measurement unit GUI for sigrok."
arch=($CARCH)
url="https://github.com/knarfS/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
    gcc-libs
    glib2
    glibc
    glibmm
    hicolor-icon-theme
    libsigrok-git
    #     libsigrok
    qt5-base
    qwt
    python
    python-time-machine
    #     python-pdoc
)
makedepends=(
    asciidoctor
    asciidoctor-pdf
    git
    boost
    cmake
    ninja
    qt5-svg
    qt5-tools
    pkgconf
    pybind11
)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}/"
    (
        set -o pipefail
        git describe --exclude 'continuous' --long 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${_pkgname}" clean -dfx
}

build() {
    cd "$srcdir/$_pkgname"

    # Workaround - libsigrok-git
    #     sed -i 's/option(DISABLE_WERROR "Build without -Werror" FALSE)/option(DISABLE_WERROR "Build without -Werror" TRUE)/' CMakeLists.txt

    # see：https://wiki.archlinux.org/title/CMake_package_guidelines

    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDISABLE_WERROR=FALSE \
        -DENABLE_TESTS=TRUE \
        -B build \
        -G Ninja \
        -Wno-dev
    ninja -C build

    cd manual
    cmake -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make manual
    make manual-publish

}

package() {
    DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${_pkgname}/build install
    DESTDIR="${pkgdir}" cmake --install "${srcdir}"/${_pkgname}/manual
    #     install -Dm755 "$srcdir/$_pkgname/build/smuview" "$pkgdir/usr/bin/$_pkgname"
    #     install -Dm644 "$srcdir/$_pkgname/contrib/org.sigrok.SmuView.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    #     install -Dm644 "$srcdir/$_pkgname/icons/smuview.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}
