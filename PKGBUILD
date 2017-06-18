# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=rtags
pkgver=2.10
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
source=("git+${url}.git"
        rdm.service
        rdm.socket)
sha256sums=('SKIP'
            'c2235b4360442d309f14a38cbd7a7cbb2091061cb1d12a827ef173c1aa0bf556'
            '56bf4f3e8208ea142c61ed6f80b4907f15e2bab8d690763cff8fb15f893ad16d')

prepare() {
  cd rtags
  git checkout v${pkgver}
  git submodule init
  git submodule update
}

build() {
  cd rtags
  cmake . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DRTAGS_NO_BUILD_CLANG=1
  make
}

package() {
  cd rtags
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
