# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=rtags
pkgver=2.16
pkgrel=2
pkgdesc='RTags is a client/server application that indexes C/C++ code'
arch=('i686' 'x86_64')
url='https://github.com/Andersbakken/rtags'
license=('GPL3')
depends=('bash' 'clang')
makedepends=('cmake' 'git' 'llvm' 'zlib')
optdepends=('bash-completion: for bash completion' 'zlib' 'lua>=5.3: Lua bindings')
provides=('rtags')
conflicts=('rtags-git')
install="${pkgname}.install"
source=(rdm.service
        rdm.socket)
sha256sums=('c2235b4360442d309f14a38cbd7a7cbb2091061cb1d12a827ef173c1aa0bf556'
            '56bf4f3e8208ea142c61ed6f80b4907f15e2bab8d690763cff8fb15f893ad16d')

prepare() {
  git clone --no-checkout --no-tags --single-branch --branch v${pkgver} \
    ${url}.git ${pkgname}
  cd ${pkgname}
  git checkout -b v${pkgver} v${pkgver}
  git submodule init
  git submodule update
}

build() {
  cd ${pkgname}
  msg "Starting to build ${pkgname} v${pkgver}..."
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}/" install
  install -D --mode=644 ${srcdir}/rdm.service \
    ${pkgdir}/usr/lib/systemd/user/rdm.service
  install -D --mode=644 ${srcdir}/rdm.socket \
    ${pkgdir}/usr/lib/systemd/user/rdm.socket

  cd ${srcdir}/${pkgname}
  install -D --mode=644 LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ft=sh ts=2 sw=2 et:
