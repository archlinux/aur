# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

_pkgname=smuview
pkgname=${_pkgname}-git
pkgver=r882.7050317
pkgrel=1
pkgdesc="SmuView is a Qt-based source measurement unit GUI for sigrok."
arch=('any')
url="https://github.com/knarfS/$_pkgname"
license=('GPL3')
depends=('libsigrok-git' 'qwt')
makedepends=('git' 'boost')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    # Workaround - libsigrok-git
    sed -i 's/option(DISABLE_WERROR "Build without -Werror" FALSE)/option(DISABLE_WERROR "Build without -Werror" TRUE)/' CMakeLists.txt

    mkdir -p build
    cd build

    cmake ../
    make
}

package() {
    install -Dm755 "$srcdir/$_pkgname/build/smuview" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/$_pkgname/contrib/org.sigrok.SmuView.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "$srcdir/$_pkgname/icons/smuview.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"
}
