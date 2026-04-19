# Maintainer: Mira Strannaya <rsxrwscjpzdzwpxaujrr@yahoo.com>
_pkgname=mazemaze
pkgname="${_pkgname}-git"
pkgver=0.2.1.r172.g1766e11
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
sfgui_commit='d57e17c8acf998235bd2a57b43892b85df45992f'
source=("git+https://github.com/rsxrwscjpzdzwpxaujrr/${_pkgname}"
        "https://github.com/TankOs/SFGUI/archive/${sfgui_commit}.tar.gz")
sha256sums=('SKIP'
            '367938205e3f672c42e0b6b83dcea31068558c77535c10f7c83009fdda3c09e4')

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
           -DSFGUI_SUBMODULE=ON \
           -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="${pkgdir}" install
  cd ..
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 FONT_LICENSE "$pkgdir/usr/share/licenses/${pkgname}/FONT_LICENSE"
}

