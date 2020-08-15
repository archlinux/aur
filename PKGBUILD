# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=dovecot-xaps-plugin-git
_gitname=dovecot-xaps-plugin
pkgver=0.8
pkgrel=1
pkgdesc='iOS Push Email for Dovecot - dovecot plugin'
arch=('any')
url='https://github.com/freswa/dovecot-xaps-plugin'
license=('custom:MIT')
depends=('dovecot' 'dovecot-xaps-daemon')
makedepends=('git' 'cmake')
provides=('dovecot-xaps-plugin')
conflicts=('dovecot-xaps-plugin')
source=("git+https://github.com/freswa/dovecot-xaps-plugin.git")
b2sums=('SKIP')

pkgver() {
  cd ${_gitname}
  echo $(git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
  cd ${_gitname}
  cmake -B build -DCMAKE_BUILD_TYPE=Release
  make -C build
}

package() {
  cd ${_gitname}/build
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}"/${_gitname}/xaps.conf "${pkgdir}"/usr/share/doc/dovecot/example-config/conf.d/30-xaps.conf
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/${pkgname}/ "${srcdir}"/${_gitname}/LICENSE
}
