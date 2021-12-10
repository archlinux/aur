# Maintainer: Your Name <jacobosborne757@gmail.com>

pkgname=game-speak
pkgver=0.1
pkgrel=1
_gittag=$pkgver
pkgdesc="Helps people with reading difficulties play games"
arch=('x86_64')
url="https://github.com/jkoking/game-speak"
license=('GPL' 'BSD' 'APACHE')
depends=('qt5-base' 'qt5-x11extras' 'qt5-speech' 'speech-dispatcher' 'espeak-ng' 'pkgconf' 'tesseract' 'opencv' 'vtk' 'glew' 'pugixml' 'openmpi' 'hdf5' 'fmt')
makedepends=('git' 'gcc' 'make' 'cmake')
source=("git://github.com/jkoking/game-speak.git#tag=${_gittag}"
    "git://github.com/Skycoder42/QHotkey.git#tag=1.5.0"
    "git://github.com/jkoking/tessdata-game-speak.git")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --abbrev=0

}

prepare() {
    cd $srcdir/game-speak/include
    git submodule init
    git config submodule.qhotkey.https://github.com/Skycoder42/QHotkey.git "$srcdir/game-speak/include/qhotkey"
    git config submodule.tessdata.tessdata::git+https://github.com/jkoking/tessdata-game-speak.git "$srcdir/game-speak/include/tessdata"
    git submodule update

}

build() {
    mkdir $srcdir/game-speak/build
    cd $srcdir/game-speak/build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    cd $srcdir/game-speak/build
	make DESTDIR="$pkgdir/" install
    install -D -m644 ../COPYING  "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
	install -D -m644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 ../include/qhotkey/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/qhotkey/LICENSE"
    install -D -m644 ../include/qhotkey/README.md "${pkgdir}/usr/share/doc/${pkgname}/qhotkey/README.md"
    install -D -m644 ../include/tessdata/README.md "${pkgdir}/usr/share/doc/${pkgname}/tessdata/README.md"
    install -D -m644 ../include/qhotkey/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/tessdata/LICENSE"

}
