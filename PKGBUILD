#
# Touchégg : Multitouch gesture recogniser
#
# Original Maintainer: Guillaume Turchini <guillaume.turchini@gmail.com>"

_pkgname=touchegg
pkgname=${_pkgname}-git
pkgver=r322.a82d299
pkgrel=2
pkgdesc='Linux multi-touch gesture recognizer'
arch=('x86_64')
url='https://github.com/JoseExposito/touchegg'
license=('GPL3')
install="${_pkgname}.install"
source=("${_pkgname}::git://github.com/JoseExposito/touchegg.git" 'filesystem.h')
depends=('libinput' 'cairo' 'systemd-libs' 'libx11' 'libxrandr' 'libxtst' 'pugixml')
makedepends=('git' 'cmake')
sha256sums=('SKIP' 'f58961b18b2d7b1ddf60d6784860e7c84588d991e72d7595e50267209506fb85')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cp "$srcdir/filesystem.h" "$srcdir/${_pkgname}/src/utils/filesystem.h"
    cmake -B build -S "${_pkgname}" -DCMAKE_BUILD_TYPE=Release ..
    make -C build -j$(nproc)
}

package() {
    #cd "$srcdir/${_pkgname}/build"
    #DESTDIR="$pkgdir" make install
    install -D       "$srcdir/build/touchegg"                     "$pkgdir/usr/bin/touchegg"
    install -Dm 0644 "$srcdir/${_pkgname}/installation/touchegg.conf"         "$pkgdir/usr/share/touchegg/touchegg.conf"
    install -Dm 0644 "$srcdir/${_pkgname}/installation/touchegg.service"      "$pkgdir/usr/lib/systemd/system/touchegg.service"
}
