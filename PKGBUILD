# Maintainer: silentnoodle <silentnoodle at cock dot li>
pkgname=med-memory-editor
pkgver=3.7.2
pkgrel=1
pkgdesc='Linux alternative game memory editor'
arch=('i686' 'x86_64')
url='https://github.com/allencch/med'
license=('BSD')
depends=('jsoncpp' 'qt5-base' 'polkit')
makedepends=('cmake')
source=("https://github.com/allencch/med/archive/${pkgver}.tar.gz"
        org.archlinux.pkexec.med.policy
        med.desktop)
sha256sums=('94ce10703bccf57dc165a853e345e39d5aa7d38af8c1680c9043c3d5eab502cf'
            'f09800e12134df7e65c7336cf9851be4013cb8795778941dbf97d5868894e76e'
            'dbaa52dd26fff0c1665773de587e62ef755391e1183cc001b6fe1a2658939448')

prepare() {
    sed '5a #include <cstring>' -i "${srcdir}/med-$pkgver/src/med/ScanParser.cpp"
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "med-${pkgver}"
}

package(){
    make -C build DESTDIR="$pkgdir/" install
    sed -i 's/qt/ui/g' $pkgdir/usr/bin/med
    install -Dm644 "med-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/med/LICENSE"
    install -Dm644 org.archlinux.pkexec.med.policy "$pkgdir/usr/share/polkit-1/actions/org.archlinux.pkexec.med.policy"
    install -Dm644 med.desktop "$pkgdir/usr/share/applications/med.desktop"
}
