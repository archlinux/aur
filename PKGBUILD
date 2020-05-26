# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=vibrant
pkgname=${_pkgname}-git
pkgver=0.0.2.r0.g166e28b
pkgrel=1
pkgdesc="A simple library to adjust color saturation of X11 outputs."
arch=(x86_64)
url="https://gitlab.com/Scrumplex/vibrant"
license=("GPL3" "custom:MIT")
depends=("libdrm" "libxrandr")
makedepends=("git" "cmake")
provides=($_pkgname "libvibrant.so")
conflicts=($_pkgname)
source=("${_pkgname}::git+https://gitlab.com/Scrumplex/vibrant.git")
sha512sums=('SKIP')


pkgver() {
    cd "$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
