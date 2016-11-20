# Maintainer: THS <mail@thson.de>
pkgname=aseba-git
pkgver=1.5.3.r102.g8ccdc9d
pkgrel=1
pkgdesc="A set of tools which allow beginners to program robots easily and efficiently."
arch=('x86_64')
url="https://github.com/aseba-community/aseba"
license=('LGPL3')
provides=('aseba')
depends=('boost' 'qt4' 'qt5-tools' 'qwt' 'libgudev' 'libxml2' 'python2' 'sdl2' 'protobuf' 'qtwebkit' 'avahi')
install="aseba-git.install"
source=('dashel::git+https://github.com/aseba-community/dashel.git' 
	'enki::git+https://github.com/enki-community/enki.git'
	'aseba::git+https://github.com/aseba-community/aseba.git'
	'catch::git+https://github.com/philsquared/Catch'
	'blockly::git+https://github.com/aseba-community/blockly.git')

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/aseba"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  msg2 "Adding submodules"
  cd $srcdir/aseba
  git submodule init
  git config submodule.catch.url $srcdir/catch
  git config submodule.blockly.url $srcdir/blockly
  git submodule update
}


build() {
mkdir -p build-dashel build-enki build-aseba
cd build-dashel
cmake ../dashel -DCMAKE_BUILD_TYPE=RelWithDebInfo -DBUILD_SHARED_LIBS=OFF
make
cd ..
cd build-enki
cmake ../enki -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2 #Only Python2 works
make
cd ..
cd build-aseba
export dashel_DIR=../build-dashel
cmake ../aseba -DCMAKE_BUILD_TYPE=RelWithDebInfo -Ddashel_DIR=../build-dashel -DDASHEL_INCLUDE_DIR=../dashel -DDASHEL_LIBRARY=../build-dashel/libdashel.a -DENKI_INCLUDE_DIR=../enki -DENKI_LIBRARY=../build-enki/enki/libenki.a -DENKI_VIEWER_LIBRARY=../build-enki/viewer/libenkiviewer.a -DCMAKE_INSTALL_PREFIX=/usr

make
}

package() {
    cd $srcdir/build-aseba

    make DESTDIR=$pkgdir install

    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebachallenge.desktop"  "${pkgdir}/usr/share/applications/asebachallenge.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebaonlinehelp.desktop"  "${pkgdir}/usr/share/applications/asebaonlinehelp.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebaplayground.desktop"  "${pkgdir}/usr/share/applications/asebaplayground.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebastudio.desktop"  "${pkgdir}/usr/share/applications/asebastudio.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebastudiothymio.desktop"  "${pkgdir}/usr/share/applications/asebastudiothymio.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/thymioupgrader.desktop"  "${pkgdir}/usr/share/applications/thymioupgrader.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/thymiovpl.desktop"  "${pkgdir}/usr/share/applications/thymiovpl.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/thymiownetconfig.desktop"  "${pkgdir}/usr/share/applications/thymiownetconfig.desktop"
    install -Dm755  ${srcdir}/aseba/menu/freedesktop/48x48/* -t ${pkgdir}/usr/share/pixmaps/
    install -Dm755  "${srcdir}/aseba/targets/challenge/examples/challenge-goto-energy.aesl"  "${pkgdir}/usr/share/doc/aseba/example-code/challenge-goto-energy.aesl"
    install -Dm755  "${srcdir}/aseba/targets/playground/examples/unifr.playground"  "${pkgdir}/usr/share/doc/aseba/example-scenarios/unifr.playground"

}
