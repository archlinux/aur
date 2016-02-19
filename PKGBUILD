# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>
# Contributor: Alexandre Bique <bique.alexandre@gmail.com>

pkgname=paste-binouse-git
_pkgname=paste-binouse
pkgver=r70.4d0f37d
pkgrel=1
pkgdesc="paste-binouse is a standalone C++ web pastebin"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://github.com/abique/paste-binouse"
license=('MIT')
makedepends=('git' 'cmake>=2.8')
depends=('gnutls')
options=()
source=(git+"https://github.com/abique/paste-binouse.git"
        "paste-binoused.confd"
        "paste-binouse.install"
        "paste-binoused.service")
md5sums=('SKIP'
         '53b10719525f897b8e82adcc6c260dec'
         '16c1e7de70723d7ffd2de803d1bffaf3'
         '232e99c5a358c05e45e87bfb496d29e1')
backup=('etc/conf.d/paste-binoused')
install='paste-binouse.install'

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_pkgname}
  git submodule update --init
}

build() {
  cd ${srcdir}/${_pkgname} &&
  rm -rf build &&
  mkdir build &&
  cd build &&
  cmake -DCMAKE_INSTALL_PREFIX=/usr .. &&
  make
}

package() {
  cd ${srcdir}/${_pkgname}/build &&
  DESTDIR=${pkgdir} make install
  install -Dm644 "${srcdir}"/paste-binoused.confd "${pkgdir}"/etc/conf.d/paste-binoused
  install -Dm644 "${srcdir}"/paste-binoused.service "${pkgdir}"/usr/lib/systemd/system/paste-binoused.service
}
