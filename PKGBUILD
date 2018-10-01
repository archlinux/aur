# Maintainer: THS <mail@thson.de>
pkgname=aseba-git
pkgver=1.6.0
pkgrel=1
pkgdesc="A set of tools which allow beginners to program robots easily and efficiently."
arch=('x86_64')
url="https://github.com/aseba-community/aseba"
license=('LGPL3')
provides=('aseba')
depends=('boost' 'doxygen' 'qt5-tools' 'python2' 'sdl2' 'qt5-svg' 'avahi')
install="aseba-git.install"
source=('dashel::git+https://github.com/aseba-community/dashel.git' 
	'enki::git+https://github.com/enki-community/enki.git'
	'aseba::git+https://github.com/aseba-community/aseba.git')

sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/aseba"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
  msg2 "Adding submodules"
  cd $srcdir/aseba
  git submodule init
  git config submodule.enki.url $srcdir/enki
  git config submodule.dashel.url $srcdir/dashel
  git submodule update
}


build() {
  cd $srcdir/aseba
  mkdir build && cd build
  cmake -DBUILD_SHARED_LIBS=OFF -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2.7 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .. 
  make
}

package() {
    cd $srcdir/aseba/build

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
    install -Dm755  ${srcdir}/aseba/aseba/targets/challenge/examples/*.aesl -t  ${pkgdir}/usr/share/doc/aseba/example-code/
    install -Dm755  "${srcdir}/aseba/aseba/targets/playground/examples/thymio-default-behaviours.aesl"  "${pkgdir}/usr/share/doc/aseba/example-scenarios/thymio-default-behaviours.aesl"
    install -Dm755  ${srcdir}/aseba/aseba/targets/playground/examples/*.png -t ${pkgdir}/usr/share/doc/aseba/example-scenarios/
    install -Dm755  ${srcdir}/aseba/aseba/targets/playground/examples/*.playground -t ${pkgdir}/usr/share/doc/aseba/example-scenarios/
    install -Dm755  ${srcdir}/aseba/aseba/targets/playground/examples/*.aesl -t ${pkgdir}/usr/share/doc/aseba/example-code/
}
