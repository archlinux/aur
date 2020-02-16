# Maintainer: Érico Nogueira <ericonr at disroot dot org>
pkgname=fstl-git
pkgver=0.9.3.r136.2b6185b
pkgrel=1
pkgdesc="A viewer for .stl files"
url="http://www.mattkeeter.com/projects/fstl/"
arch=('any')
license=('MIT')
depends=('qt5-base')
makedepends=('cmake' 'icoutils')
source=("$pkgname::git+https://github.com/mkeeter/fstl"
        "fstl.desktop")
sha256sums=('SKIP'
            '1c08b873decc3fff335b476a9c0cc9ae65af038fca5360565e4f0b8beeea202b')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "0.9.3.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"

    mkdir -p build
    pushd build
    cmake ..
    make
    popd

    sed -n '/Copyright/,/PROVIDED/p' README.md > LICENSE

    pushd "exe"
    icotool --extract --index=6 --output=../fstl.png fstl.ico
    popd
}

package() {
    cd "${srcdir}/${pkgname}"
    pushd "build"
    make DESTDIR="${pkgdir}" install
    install -Dm755 fstl "${pkgdir}/usr/bin/fstl"
    popd

    install -D -m644 fstl.png "${pkgdir}/usr/share/pixmaps/fstl.png"

    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -D -m644 "${srcdir}/fstl.desktop" "${pkgdir}/usr/share/applications/fstl.desktop"

}
