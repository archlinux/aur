# Maintainer: Mira Strannaya <rsxrwscjpzdzwpxaujrr@yahoo.com>
_pkgname=mazemaze
pkgname="${_pkgname}-git"
pkgver=0.2.1.r169.g84099dc
pkgrel=1
pkgdesc='Simple 3D OpenGL first-person maze game.'
url="https://github.com/rsxrwscjpzdzwpxaujrr/${_pkgname}"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('jsoncpp' 'sfml')
optdepends=()
makedepends=('cmake')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
sfgui_commit='83471599284b2a23027b9ab4514684a6eeb08a19'
source=("git+https://github.com/rsxrwscjpzdzwpxaujrr/${_pkgname}"
        "https://github.com/TankOs/SFGUI/archive/${sfgui_commit}.tar.gz")
sha256sums=('SKIP'
            '4ff867c6f456288c228a7e62bdb9c0f9be28935741428513481017f59ec73809')

pkgver() {
  cd mazemaze
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  rm -d sfgui
  cd ..
  mv "SFGUI-${sfgui_commit}" "${srcdir}/${_pkgname}/sfgui"
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DSFGUI_SUBMODULE=ON
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 FONT_LICENSE "$pkgdir/usr/share/licenses/${pkgname}/FONT_LICENSE"
}

