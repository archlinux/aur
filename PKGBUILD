# Maintainer: THS <mail@thson.de>
pkgname=aseba-git
pkgver=1.5.3.r93.gc4a75de
pkgrel=1
pkgdesc="A set of tools which allow beginners to program robots easily and efficiently."
arch=('x86_64')
url="https://github.com/aseba-community/aseba"
license=('LGPL3')
provides=('aseba')
depends=('boost' 'qt4' 'qt5-tools' 'qwt' 'libgudev' 'libxml2' 'python2' 'sdl2' 'protobuf' 'qtwebkit')
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
cd aseba
export dashel_DIR=../build-dashel
cmake ../aseba -DCMAKE_BUILD_TYPE=RelWithDebInfo -Ddashel_DIR=../build-dashel -DDASHEL_INCLUDE_DIR=../dashel -DDASHEL_LIBRARY=../build-dashel/libdashel.a -DENKI_INCLUDE_DIR=../enki -DENKI_LIBRARY=../build-enki/enki/libenki.a -DENKI_VIEWER_LIBRARY=../build-enki/viewer/libenkiviewer.a
make
}

package() {
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebachallenge.desktop"  "${pkgdir}/usr/share/applications/asebachallenge.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebaonlinehelp.desktop"  "${pkgdir}/usr/share/applications/asebaonlinehelp.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebaplayground.desktop"  "${pkgdir}/usr/share/applications/asebaplayground.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebastudio.desktop"  "${pkgdir}/usr/share/applications/asebastudio.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/asebastudiothymio.desktop"  "${pkgdir}/usr/share/applications/asebastudiothymio.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/thymioupgrader.desktop"  "${pkgdir}/usr/share/applications/thymioupgrader.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/thymiovpl.desktop"  "${pkgdir}/usr/share/applications/thymiovpl.desktop"
    install -Dm755  "${srcdir}/aseba/menu/freedesktop/thymiownetconfig.desktop"  "${pkgdir}/usr/share/applications/thymiownetconfig.desktop"
    install -Dm755  ${srcdir}/aseba/menu/freedesktop/48x48/* -t ${pkgdir}/usr/share/icons/hicolor/48x48/
    install -Dm755 "${srcdir}/aseba/clients/studio/thymiovpl" "${pkgdir}/usr/bin/thymiovpl"
    install -Dm755 "${srcdir}/aseba/clients/studio/asebastudio" "${pkgdir}/usr/bin/asebastudio"
    install -Dm755 "${srcdir}/aseba/targets/playground/asebaplayground" "${pkgdir}/usr/bin/asebaplayground"
    install -Dm755 "${srcdir}/aseba/targets/challenge/asebachallenge" "${pkgdir}/usr/bin/asebachallenge"
    install -Dm755 "${srcdir}/aseba/clients/thymioupgrader/thymioupgrader" "${pkgdir}/usr/bin/thymioupgrader"
    install -Dm755 "${srcdir}/aseba/clients/thymiownetconfig/thymiownetconfig" "${pkgdir}/usr/bin/thymiownetconfig"
    install -Dm755 "${srcdir}/aseba/clients/cmd/asebacmd" "${pkgdir}/usr/bin/asebacmd"
    install -Dm755 "${srcdir}/aseba/clients/dump/asebadump" "${pkgdir}/usr/bin/asebadump"
    install -Dm755 "${srcdir}/aseba/clients/exec/asebaexec" "${pkgdir}/usr/bin/asebaexec"
    install -Dm755 "${srcdir}/aseba/clients/joy/asebajoy" "${pkgdir}/usr/bin/asebajoy"
    install -Dm755 "${srcdir}/aseba/clients/dump/asebadump" "${pkgdir}/usr/bin/asebadump"
    install -Dm755 "${srcdir}/aseba/clients/massloader/asebamassloader" "${pkgdir}/usr/bin/asebamassloader"
    install -Dm755 "${srcdir}/aseba/clients/replay/asebaplay" "${pkgdir}/usr/bin/asebaplay"
    install -Dm755 "${srcdir}/aseba/clients/replay/asebarec" "${pkgdir}/usr/bin/asebarec"
    install -Dm755 "${srcdir}/aseba/switches/http/asebahttp" "${pkgdir}/usr/bin/asebahttp"
    install -Dm755 "${srcdir}/aseba/switches/http2/asebahttp2" "${pkgdir}/usr/bin/asebahttp2"
    install -Dm755 "${srcdir}/aseba/switches/medulla/asebamedulla" "${pkgdir}/usr/bin/asebamedulla"
    install -Dm755 "${srcdir}/aseba/switches/switch/asebaswitch" "${pkgdir}/usr/bin/asebaswitch"
}
