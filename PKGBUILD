# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=vibrantx
pkgname=${_pkgname}-git
pkgver=r51.d919cdf
pkgrel=1
pkgdesc="Adjust color vibrance of X11 output"
arch=(x86_64)
url="https://gitlab.com/Scrumplex/vibrantx"
license=("GPL3" "custom:MIT")
depends=("libdrm" "libxrandr")
makedepends=("git" "cmake")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+https://gitlab.com/Scrumplex/vibrantx.git#branch=freeze-vibrantX")
sha512sums=('SKIP')


pkgver() {
    cd "$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {

    cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {

    make -C build DESTDIR="$pkgdir" install

    cd "$_pkgname"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
